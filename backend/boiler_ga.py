import random
import numpy as np
import pandas as pd
from typing import List, Dict, Any, Tuple
from boiler_inference import BoilerPredictor
from schemas import BoilerParams, CoalBlendInput
import time

class BoilerGA:
    """
    Vectorized Boiler Optimization GA - processes entire population at once for speed.
    """
    def __init__(self, predictor: BoilerPredictor, pop_size=30, generations=15, coal_df=None):
        self.predictor = predictor
        self.pop_size = pop_size
        self.generations = generations
        self.coal_df = coal_df 
        if self.coal_df is not None:
             self.coal_names = self.coal_df["Coal_Name"].tolist()
             self.n_coals = len(self.coal_names)
        else:
             self.coal_names = [] 
             self.n_coals = 0
             
        self.MAX_COALS = 5
        self.best_solution = None
        self.history = []

    def enforce_max_coals(self, ratios):
        ratios = np.array(ratios)
        # Keep top N coals only
        top_idx = np.argsort(ratios)[-self.MAX_COALS:]
        new_ratios = np.zeros_like(ratios)
        new_ratios[top_idx] = ratios[top_idx]
        
        # Normalize
        if new_ratios.sum() == 0:
            new_ratios[top_idx] = 1.0 / self.MAX_COALS
        else:
            new_ratios /= new_ratios.sum()
        return new_ratios

    def generate_population(self):
        """Generate initial population as a matrix (pop_size x n_coals + 4 boiler params)"""
        population = []
        for _ in range(self.pop_size):
            ind = self.generate_good_parent()
            population.append(ind)
        return population

    def generate_good_parent(self):
        selected = random.sample(range(self.n_coals), min(self.MAX_COALS, self.n_coals))
        ratios = np.zeros(self.n_coals)
        
        # Dirichlet for random valid probability distribution
        raw = np.random.dirichlet(np.ones(len(selected)))
        for i, idx in enumerate(selected):
            ratios[idx] = raw[i]
            
        return {
            "coal_ratios": ratios,
            "Load": random.uniform(80, 95),
            "feed_water_temp": random.uniform(210, 240),
            "running_plant_load_factor": random.uniform(85, 95),
            "air_to_fuel_ratio": random.uniform(1.8, 2.3)
        }

    def batch_fitness(self, population, coal_properties_list):
        """
        Vectorized fitness evaluation for entire population at once.
        Returns: (scores, predictions_list)
        """
        pop_size = len(population)
        
        # Build population matrix (pop_size x n_coals)
        pop_matrix = np.zeros((pop_size, self.n_coals))
        boiler_params_list = []
        
        for i, ind in enumerate(population):
            ind["coal_ratios"] = self.enforce_max_coals(ind["coal_ratios"])
            pop_matrix[i] = ind["coal_ratios"]
            boiler_params_list.append({
                "Load": ind["Load"],
                "feed_water_temp": ind["feed_water_temp"],
                "running_plant_load_factor": ind["running_plant_load_factor"],
                "air_to_fuel_ratio": ind["air_to_fuel_ratio"]
            })
        
        # Batch predict
        preds = self.predictor.batch_predict(
            pop_matrix, 
            boiler_params_list, 
            coal_properties_list, 
            self.coal_names
        )
        
        # Calculate scores for all individuals
        eff = preds["boiler_efficiency"]
        nox = preds["nox"]
        ubc_ba = preds["ubc_ba"]
        ubc_fa = preds["ubc_fa"]
        gcv = preds["gcv_wa"]
        gcv_arb = preds["gcv_arb_wa"]
        
        scores = (
            + 0.35 * eff
            - 0.20 * nox
            - 0.15 * ubc_ba
            - 0.15 * ubc_fa
            + 0.10 * gcv
            + 0.05 * gcv_arb
        )
        
        # Convert to list of individual predictions
        predictions_list = []
        for i in range(pop_size):
            predictions_list.append({
                "boiler_efficiency": float(eff[i]),
                "nox": float(nox[i]),
                "ubc_ba": float(ubc_ba[i]),
                "ubc_fa": float(ubc_fa[i]),
                "gcv_wa": float(gcv[i]),
                "gcv_arb_wa": float(gcv_arb[i])
            })
        
        return scores, predictions_list

    def crossover(self, p1, p2):
        ratios = (p1["coal_ratios"] + p2["coal_ratios"]) / 2
        ratios = self.enforce_max_coals(ratios)
        
        return {
            "coal_ratios": ratios,
            "Load": random.choice([p1["Load"], p2["Load"]]),
            "feed_water_temp": random.choice([p1["feed_water_temp"], p2["feed_water_temp"]]),
            "running_plant_load_factor": random.choice([p1["running_plant_load_factor"], p2["running_plant_load_factor"]]),
            "air_to_fuel_ratio": random.choice([p1["air_to_fuel_ratio"], p2["air_to_fuel_ratio"]])
        }

    def mutate(self, ind, rate=0.1):
        # Coal Blend Mutation
        if random.random() < rate:
            selected = random.sample(range(self.n_coals), min(self.MAX_COALS, self.n_coals))
            ratios = np.zeros(self.n_coals)
            raw = np.random.dirichlet(np.ones(len(selected)))
            for i, idx in enumerate(selected):
                ratios[idx] = raw[i]
            ind["coal_ratios"] = ratios
            
        # Parameter Mutation
        if random.random() < rate:
             ind["Load"] = random.uniform(80, 95)
        if random.random() < rate:
             ind["feed_water_temp"] = random.uniform(210, 240)
        if random.random() < rate:
             ind["running_plant_load_factor"] = random.uniform(85, 95)
        if random.random() < rate:
             ind["air_to_fuel_ratio"] = random.uniform(1.8, 2.3)
        
        ind["coal_ratios"] = self.enforce_max_coals(ind["coal_ratios"])
        return ind

    def evolve(self, coal_properties_list, callback=None):
        """
        Run the evolution with vectorized fitness evaluation.
        coal_properties_list: List of coal property objects/dicts required by BoilerPredictor
        callback: function(generation, best_score, best_ind) -> None (for progress updates)
        """
        print(f"🚀 Starting Vectorized Boiler GA (Pop: {self.pop_size}, Gens: {self.generations})")
        start_time = time.time()
        
        population = self.generate_population()
        
        for gen in range(1, self.generations + 1):
            gen_start = time.time()
            
            # Vectorized batch fitness evaluation
            scores, predictions_list = self.batch_fitness(population, coal_properties_list)
            
            # Build evaluated list
            evaluated = []
            for i, ind in enumerate(population):
                evaluated.append((scores[i], predictions_list[i], ind))
            
            evaluated.sort(key=lambda x: x[0], reverse=True)
            best_score, best_preds, best_ind = evaluated[0]
            
            self.best_solution = {
                "score": best_score,
                "preds": best_preds,
                "ind": best_ind
            }
            
            if callback:
                callback(gen, best_score, best_ind)
            
            # Selection (Top 40%)
            top_bound = max(1, int(0.4 * self.pop_size))
            parents = [x[-1] for x in evaluated[:top_bound]]
            
            next_gen = [p.copy() for p in parents]  # Deep copy parents
            while len(next_gen) < self.pop_size:
                p1, p2 = random.sample(parents, 2)
                child = self.crossover(p1, p2)
                child = self.mutate(child)
                next_gen.append(child)
            
            population = next_gen
            
            if gen % 5 == 0:
                print(f"Gen {gen}: Best Score = {best_score:.4f} (Time: {time.time()-gen_start:.3f}s)")
        
        # Store final population for get_top_blends
        self.final_population = population
        self.final_scores, self.final_predictions = self.batch_fitness(population, coal_properties_list)
            
        print(f"✅ Done. Total Time: {time.time()-start_time:.2f}s")
        return self.best_solution

    def get_top_blends(self, coal_properties_list, n=5):
        """
        Returns the top N unique blends from the final population.
        Must be called after evolve().
        """
        if not hasattr(self, 'final_population') or self.final_population is None:
            return []
        
        # Sort by scores (descending - higher is better for boiler)
        indices = np.argsort(self.final_scores)[::-1]
        
        top_blends = []
        seen_sigs = set()
        
        for idx in indices:
            ind = self.final_population[idx]
            preds = self.final_predictions[idx]
            score = self.final_scores[idx]
            
            # Create signature from coal ratios (rounded to avoid float precision issues)
            sig = tuple(np.round(ind["coal_ratios"], 4))
            
            if sig not in seen_sigs:
                seen_sigs.add(sig)
                
                # Build composition dict
                composition = {}
                for i, ratio in enumerate(ind["coal_ratios"]):
                    if ratio > 0:
                        composition[self.coal_names[i]] = ratio * 100
                
                # Calculate weighted properties for this blend
                w_props = {k: 0.0 for k in ['FC', 'Ash', 'VM', 'S', 'N', 'CRI', 'CSR']}
                props_map = {c.coal_name: c for c in coal_properties_list}
                for c_name, pct in composition.items():
                    coal = props_map.get(c_name)
                    if coal:
                        w_props['FC'] += (getattr(coal, 'FC', 0) or 0) * (pct / 100)
                        w_props['Ash'] += (getattr(coal, 'Ash', 0) or 0) * (pct / 100)
                        w_props['VM'] += (getattr(coal, 'VM', 0) or 0) * (pct / 100)
                        w_props['S'] += (getattr(coal, 'S', 0) or 0) * (pct / 100)
                        w_props['N'] += (getattr(coal, 'N', 0) or 0) * (pct / 100)
                        w_props['CRI'] += (getattr(coal, 'CRI', 0) or 0) * (pct / 100)
                        w_props['CSR'] += (getattr(coal, 'CSR', 0) or 0) * (pct / 100)
                
                top_blends.append({
                    "rank": len(top_blends) + 1,
                    "score": float(score),
                    "composition": composition,
                    "boiler_params": {
                        "load": ind["Load"],
                        "feed_water_temp": ind["feed_water_temp"],
                        "running_plant_load_factor": ind["running_plant_load_factor"],
                        "air_to_fuel_ratio": ind["air_to_fuel_ratio"]
                    },
                    "predictions": preds,
                    "weighted_props": w_props
                })
                
                if len(top_blends) >= n:
                    break
        
        return top_blends
