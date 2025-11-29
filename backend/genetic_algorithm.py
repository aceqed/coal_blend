import pandas as pd
import numpy as np
import random
import pickle
import re
import os
from pathlib import Path
from pycaret.regression import load_model, predict_model
import time
import warnings

# Suppress PyCaret and Pandas warnings for cleaner output
warnings.filterwarnings("ignore")

class FastCoalPredictor:
    """
    Robust Coal Predictor optimized for your specific CSV structure.
    Handles 'dirty' column names (spaces, % signs) found in inspection.
    """

    # ✅ EXACT MAPPING BASED ON YOUR INSPECTION OUTPUT
    # Adapted for main.py DataFrame columns
    COLUMN_MAPPING = {
        # Internal Model Name : Your DataFrame Column Name
        "CRI": "CRI_weight",         
        "CSR": "CSR_weight",
        "ASH": "Ash",
        "VM": "VM_weight",
        "S": "S",
        "P": "P",     
        
        # Chemical Components
        "SiO2": "SiO2",
        "Fe2O3": "Fe2O3",
        "CaO": "CaO",
        "MgO": "MgO",
        "Na2O": "Na2O",
        "K2O": "K2O",
        "TiO2": "TiO2",
        "P2O5": "P2O5",
        "Mn3O4": "Mn3O4",
        
        # Other properties
        "Inertinite": "Inertinite",
        "Minerals": "Minerals",
        "Fluidity": "MaxFluidity" # Mapped from MaxFluidity in DB
    }

    def __init__(self, coal_df, models_dir="."):
        self.models_dir = Path(models_dir)
        
        # Use passed DataFrame
        self.coal_df = coal_df.copy()
        
        # 2. Clean and Map Columns
        self.coal_df = self._clean_data(self.coal_df)
        
        # 3. Apply Feature Engineering
        self.coal_df = self._apply_feature_engineering(self.coal_df)
        
        # 4. Prepare Matrices
        self._precompute_matrices()
        
        # 5. Load Models
        self.models = {}
        self.model_features = {}
        targets = ["CRI", "CSR", "ASH", "VM"]
        
        print(f"Loading models from {self.models_dir.resolve()}...", end=" ")
        loaded_count = 0
        for target in targets:
            try:
                # Load PyCaret Model
                self.models[target] = load_model(str(self.models_dir / f"{target}_model"), verbose=False)
                # Load Feature List
                feat_path = self.models_dir / f"{target}_features.pkl"
                with open(feat_path, "rb") as f:
                    self.model_features[target] = pickle.load(f)
                loaded_count += 1
            except Exception as e:
                print(f"\n❌ Failed to load {target}: {e}")
        
        if loaded_count == 0:
            raise RuntimeError("No models were loaded. Ensure .pkl files are in the directory.")
            
        print("Done.")

    @staticmethod
    def _normalize_name(s):
        """Standardizes coal names for matching between DB and Cost files."""
        s = str(s).lower().strip()
        s = re.sub(r"[^a-z0-9]+", " ", s)
        return re.sub(r"\s+", " ", s).strip()

    def _clean_data(self, df):
        """Maps columns and forces them to be numeric."""
        df = df.copy()
        
        # 1. Rename columns based on mapping
        rename_map = {v: k for k, v in self.COLUMN_MAPPING.items() if v in df.columns}
        df = df.rename(columns=rename_map)
        
        # 2. Normalize Coal Names for Indexing
        if 'Name_of_coal' in df.columns:
            df['norm_name'] = df['Name_of_coal'].apply(self._normalize_name)
            df = df.set_index('norm_name')
            
        # 3. Clean Categories (Strip whitespace)
        if "Coal Category" in df.columns:
            df["Coal Category"] = df["Coal Category"].astype(str).str.strip()
        else:
             # Default category if missing (should be in DB though)
             # models.py has coal_category
             if "coal_category" in df.columns:
                 df["Coal Category"] = df["coal_category"].astype(str).str.strip()
             else:
                 df["Coal Category"] = "Unknown"

        
        # 4. Force Numeric Conversion
        numeric_cols = ["CRI", "CSR", "ASH", "VM", "S", "P", "Al2O3", "Fe2O3", 
                        "SiO2", "CaO", "MgO", "Na2O", "K2O", "TiO2", "Fluidity", 
                        "Inertinite", "Minerals"]
        
        # Add V7-V19 to conversion list
        numeric_cols += [f"V{i}" for i in range(7, 20)]

        for col in numeric_cols:
            if col in df.columns:
                # Handle text numbers
                if df[col].dtype == 'object':
                    df[col] = df[col].astype(str).str.replace(',', '.', regex=False)
                    df[col] = df[col].astype(str).str.replace('%', '', regex=False)
                
                # Coerce to number
                df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0.0)
            else:
                # Create missing column as 0.0
                df[col] = 0.0
                
        return df

    def _apply_feature_engineering(self, df):
        """Calculates derived features like BI, MBI, CBI needed by the model."""
        df = df.copy()
        
        # BI Calculation
        numerator = df["Fe2O3"] + df["CaO"] + df["MgO"] + df["Na2O"] + df["K2O"]
        denominator = df["SiO2"] + df["Al2O3"] + df["TiO2"]
        df["BI"] = np.divide(numerator, denominator, out=np.zeros_like(numerator), where=denominator!=0)

        # MBI Calculation
        denom_vm = 100 - df["VM"]
        df["MBI"] = np.where(denom_vm != 0, ((df["ASH"] * 100) / denom_vm) * df["BI"], 0)

        # CBI Calculation
        ratios = {
            "V7": 3, "V8": 2.7, "V9": 2.5, "V10": 2.4, "V11": 2.5, "V12": 3,
            "V13": 3.7, "V14": 5, "V15": 7, "V16": 9.6, "V17": 12, "V18": 15, "V19": 18,
        }
        
        sum_vr = np.zeros(len(df))
        has_v_cols = False
        
        for col, divisor in ratios.items():
            if col in df.columns:
                df[f"VR{col[1:]}"] = df[col] / divisor
                sum_vr += df[f"VR{col[1:]}"]
                has_v_cols = True
        
        if has_v_cols:
            condition = (df["Coal Category"].isin(["HCC", "HFCC", "SHCC"])) & (sum_vr != 0)
            df["CBI"] = np.where(condition, (df["Inertinite"] + df["Minerals"]) / sum_vr, 0)
        else:
            df["CBI"] = 0.0

        # Log Max Fluidity
        df["Log_Max_Fluidity"] = np.log(df["Fluidity"].replace(0, np.nan)).fillna(0)
            
        return df

    def _precompute_matrices(self):
        """Prepares the large numerical matrices for fast vector multiplication."""
        exclude_cols = ["Name_of_coal", "Coal Category", "__norm_name", "norm_name", "coal_category"]
        
        # Select ALL numeric columns
        self.prop_cols = [c for c in self.coal_df.columns 
                          if pd.api.types.is_numeric_dtype(self.coal_df[c]) 
                          and c not in exclude_cols]
        
        self.coal_df.sort_index(inplace=True)
        self.property_matrix = self.coal_df[self.prop_cols].values
        self.coal_names = self.coal_df.index.tolist()
        self.categories = self.coal_df["Coal Category"].values
        
        # Costs
        if "Cost" in self.coal_df.columns:
             self.costs = self.coal_df["Cost"].fillna(99999.0).values
        else:
             self.costs = np.full(len(self.coal_df), 99999.0)

        # Masks for fast Category constraints
        self.unique_cats = ["HCC", "SHCC", "HFCC", "PCI", "WC"]
        self.cat_masks = {}
        for cat in self.unique_cats:
            self.cat_masks[cat] = (self.categories == cat).astype(float)

    def batch_predict_and_cost(self, population_matrix):
        """Vectorized prediction for the entire population at once."""
        # 1. Weighted Properties
        weighted_props = np.dot(population_matrix, self.property_matrix) / 100.0
        
        # 2. DataFrame Construction
        cols = [f"weighted_{c}" for c in self.prop_cols]
        input_df = pd.DataFrame(weighted_props, columns=cols)
        
        for cat in self.unique_cats:
            input_df[cat] = np.dot(population_matrix, self.cat_masks[cat])

        # 3. Costs
        costs = np.dot(population_matrix, self.costs) / 100.0

        # 4. Predict
        predictions = {}
        for target in ["CRI", "CSR", "ASH", "VM"]:
            if target in self.models:
                required = self.model_features[target]
                for req in required:
                    if req not in input_df.columns:
                        input_df[req] = 0.0
                
                model_input = input_df[required]
                preds = predict_model(self.models[target], data=model_input, verbose=False)
                predictions[target] = preds["prediction_label"].values

        # 5. Score
        scores = self._vectorized_cost_function(costs, predictions)
        
        # 6. Calculate Emissions and Weighted Properties
        # Get indices for required properties
        try:
            idx_ash = self.prop_cols.index("Ash")
            idx_vm = self.prop_cols.index("VM")
            idx_fc = self.prop_cols.index("FC")
            idx_s = self.prop_cols.index("S")
            idx_n = self.prop_cols.index("N")
            idx_cri = self.prop_cols.index("CRI")
            idx_csr = self.prop_cols.index("CSR")
            
            # Extract weighted averages (Pop x 1)
            w_ash = weighted_props[:, idx_ash]
            w_vm = weighted_props[:, idx_vm]
            w_fc = weighted_props[:, idx_fc]
            w_s = weighted_props[:, idx_s]
            w_n = weighted_props[:, idx_n]
            w_cri = weighted_props[:, idx_cri]
            w_csr = weighted_props[:, idx_csr]
            
            # Store weighted properties in predictions for frontend
            predictions["weighted_Ash"] = w_ash
            predictions["weighted_VM"] = w_vm
            predictions["weighted_FC"] = w_fc
            predictions["weighted_S"] = w_s
            predictions["weighted_N"] = w_n
            predictions["weighted_CRI"] = w_cri
            predictions["weighted_CSR"] = w_csr
            
            # Calculate Emissions (Vectorized)
            # CO2 = 0.7 * (FC/100) * (44.01/12.01) * 10
            predictions["CO2_Emissions"] = 0.7 * (w_fc / 100) * (44.01 / 12.01) * 10
            
            # CO = 0.3 * (FC/100) * (28.01/12.01) * 10
            predictions["CO_Emissions"] = 0.3 * (w_fc / 100) * (28.01 / 12.01) * 10
            
            # SO2 = (S/100) * (64.07/32.06) * 10
            predictions["SO2_Emissions"] = (w_s / 100) * (64.07 / 32.06) * 10
            
            # NO = 0.2 * (N/100) * (30.01/14.01) * 10
            predictions["NO_Emissions"] = 0.2 * (w_n / 100) * (30.01 / 14.01) * 10
            
            # NO2 = 0.2 * (N/100) * (46.01/14.01) * 10
            predictions["NO2_Emissions"] = 0.2 * (w_n / 100) * (46.01 / 14.01) * 10
            
            # PM Index = 0.4 * (Ash/9) + 0.3 * (CRI/28) + 0.3 * (1 - CSR/65)
            pm_index = 0.4 * (w_ash / 9) + 0.3 * (w_cri / 28) + 0.3 * (1 - w_csr / 65)
            predictions["PM_Index"] = pm_index
            predictions["PM10_Emissions"] = 0.7 * pm_index
            predictions["PM25_Emissions"] = 0.3 * pm_index
            
            # VOC Index = 0.5 * (VM/2.5) + 0.2 * (CRI/28) + 0.2 * (1 - CSR/65) + 0.1 * (N/1.0)
            voc_index = 0.5 * (w_vm / 2.5) + 0.2 * (w_cri / 28) + 0.2 * (1 - w_csr / 65) + 0.1 * (w_n / 1.0)
            predictions["VOC_Index"] = voc_index
            predictions["VOC_Emissions"] = 0.9 * voc_index
            predictions["PAH_Emissions"] = 0.1 * voc_index
            
        except ValueError as e:
            # Handle case where some columns might be missing
            # print(f"Warning: Missing columns for emission calculation: {e}")
            pass
            
        return scores, predictions, costs

    def _vectorized_cost_function(self, costs, preds):
        """Vectorized Penalty Logic"""
        penalty = np.zeros_like(costs)
        
        if "CRI" in preds:
            penalty += np.maximum(0, 22 - preds["CRI"]) * 1000
            penalty += np.maximum(0, preds["CRI"] - 28) * 1000
        
        if "CSR" in preds:
            penalty += np.maximum(0, 56 - preds["CSR"]) * 1500
            
        if "ASH" in preds:
            penalty += np.maximum(0, preds["ASH"] - 13.5) * 1200
            
        return  penalty + costs 


class VectorizedGA:
    def __init__(self, predictor, population_size=200, generations=100, mutation_rate=0.3):
        self.predictor = predictor
        self.pop_size = population_size
        self.generations = generations
        self.mutation_rate = mutation_rate
        self.n_coals = len(predictor.coal_names)
        
        # Storage for final population stats
        self.population = None
        self.fitness = None
        self.costs = None
        self.preds = None
        
        # Constraints
        self.cat_constraints = {
            "SHCC": {"max_count": 3, "min": 20, "max": 52},
            "HCC":  {"max_count": 2, "min": 30, "max": 59},
            "HFCC": {"max_count": 2, "min": 5,  "max": 20},
            "WC":   {"max_count": 2, "min": 0,  "max": 15},
            "PCI":  {"max_count": 1, "min": 5, "max": 15},
        }

    def generate_random_population(self):
        pop_matrix = np.zeros((self.pop_size, self.n_coals))
        for i in range(self.pop_size):
            pop_matrix[i] = self._generate_single_valid_blend()
        return pop_matrix

    def _generate_single_valid_blend(self):
        blend = np.zeros(self.n_coals)
        for cat, const in self.cat_constraints.items():
            mask = self.predictor.cat_masks[cat]
            indices = np.where(mask > 0)[0]
            if len(indices) == 0: continue
            
            # For categories with min=0 (like WC), include them ~70% of the time
            if const['min'] == 0:
                if random.random() > 0.7:  # Skip 30% of the time
                    continue
                effective_min = 1  # When included, ensure at least 1%
            else:
                effective_min = const['min']
            
            k = random.randint(1, min(len(indices), const['max_count']))
            selected_indices = np.random.choice(indices, k, replace=False)
            total_cat_ratio = random.randint(effective_min, const['max'])
            
            ratios = np.random.dirichlet(np.ones(k)) * total_cat_ratio
            for idx, r in zip(selected_indices, ratios):
                blend[idx] = r
                
        return self._repair_blend(blend)

    def _repair_blend(self, blend):
        """Ensures blend sums to exactly 100 with integers"""
        blend = np.round(blend).astype(int)
        diff = 100 - np.sum(blend)
        if diff != 0:
            indices = np.where(blend > 0)[0]
            if len(indices) > 0:
                targets = np.random.choice(indices, abs(diff), replace=True)
                for t in targets:
                    if diff > 0: blend[t] += 1
                    elif blend[t] > 0: blend[t] -= 1
        return blend

    def check_constraints_batch(self, pop_matrix):
        """Vectorized constraint checking for entire population"""
        valid_mask = np.ones(pop_matrix.shape[0], dtype=bool)
        sums = np.sum(pop_matrix, axis=1)
        valid_mask &= (sums == 100)
        
        for cat, const in self.cat_constraints.items():
            cat_ratios = np.dot(pop_matrix, self.predictor.cat_masks[cat])
            cat_counts = np.dot((pop_matrix > 0).astype(float), self.predictor.cat_masks[cat])
            
            valid_mask &= (cat_ratios >= const['min'])
            valid_mask &= (cat_ratios <= const['max'])
            has_cat = cat_ratios > 0
            valid_mask &= (~has_cat | (cat_counts <= const['max_count']))
            
        return valid_mask
    
    def get_category_distribution(self, blend):
        """Calculates percentage of each category in the blend"""
        distribution = {}
        for cat in self.predictor.unique_cats:
            mask = self.predictor.cat_masks[cat]
            distribution[cat] = np.sum(blend * mask)
        return distribution

    def evolve(self):
        print(f"🚀 Starting Vectorized Optimization (Pop: {self.pop_size}, Gens: {self.generations})")
        start_global = time.time()
        
        self.population = self.generate_random_population()
        best_overall_fit = float('inf')
        best_overall_cost = float('inf')
        best_overall_blend = None
        
        for gen in range(self.generations):
            gen_start = time.time()
            
            # 1. Batch Prediction
            self.fitness, self.preds, self.costs = self.predictor.batch_predict_and_cost(self.population)
            
            # 2. Apply Penalties
            valid_mask = self.check_constraints_batch(self.population)
            self.fitness[~valid_mask] += 1_000_000 
            
            # 3. Track Best
            min_fit_idx = np.argmin(self.fitness)
            if self.fitness[min_fit_idx] < best_overall_fit:
                best_overall_fit = self.fitness[min_fit_idx]
                best_overall_cost = self.costs[min_fit_idx]
                best_overall_blend = self.population[min_fit_idx].copy()
                
            # 4. Selection
            p1 = np.random.randint(0, self.pop_size, self.pop_size)
            p2 = np.random.randint(0, self.pop_size, self.pop_size)
            winner_indices = np.where(self.fitness[p1] < self.fitness[p2], p1, p2)
            parents = self.population[winner_indices]
            
            # 5. Crossover
            parents1 = parents[:self.pop_size//2]
            parents2 = parents[self.pop_size//2:]
            mask = np.random.rand(self.pop_size//2, self.n_coals) < 0.5
            off1 = np.where(mask, parents1, parents2)
            off2 = np.where(mask, parents2, parents1)
            
            new_pop = np.vstack([parents, off1, off2])
            np.random.shuffle(new_pop)
            new_pop = new_pop[:self.pop_size]
            
            # 6. Mutation
            mut_indices = np.where(np.random.rand(self.pop_size) < self.mutation_rate)[0]
            for idx in mut_indices:
                nz = np.where(new_pop[idx] > 0)[0]
                if len(nz) >= 2:
                    i, j = np.random.choice(nz, 2, replace=False)
                    new_pop[idx][i], new_pop[idx][j] = new_pop[idx][j], new_pop[idx][i]
            
            # 7. Repair
            for i in range(self.pop_size):
                 new_pop[i] = self._repair_blend(new_pop[i])
            self.population = new_pop
            
            # 8. Diversity Injection
            n_inject = int(self.pop_size * 0.05)
            if n_inject > 0:
                injections = np.zeros((n_inject, self.n_coals))
                for k in range(n_inject):
                    injections[k] = self._generate_single_valid_blend()
                self.population[-n_inject:] = injections

            if gen % 10 == 0:
                print(f"Gen {gen}: Fitness = {best_overall_fit:.2f} | Cost = ₹{best_overall_cost:.2f} (Time: {time.time()-gen_start:.3f}s)")

        # --- CRITICAL FIX: FINAL EVALUATION OF THE LAST POPULATION ---
        # The loop modifies population *after* evaluation, so we must re-evaluate 
        # to ensure final stats match the final population state.
        self.fitness, self.preds, self.costs = self.predictor.batch_predict_and_cost(self.population)
        valid_mask = self.check_constraints_batch(self.population)
        self.fitness[~valid_mask] += 1_000_000 
        # -------------------------------------------------------------

        print(f"\n✅ Done. Total Time: {time.time()-start_global:.2f}s")
        return best_overall_blend, best_overall_fit

    def get_top_blends(self, n=5):
        """Returns the top N unique blends from the final population"""
        if self.fitness is None:
            return []

        # Sort by fitness
        indices = np.argsort(self.fitness)
        top_blends = []
        seen_sigs = set()
        
        for idx in indices:
            # Skip invalid blends (high penalty)
            if self.fitness[idx] > 500000:
                continue
                
            blend = self.population[idx]
            sig = tuple(blend) # Simple signature to detect exact duplicates
            
            if sig not in seen_sigs:
                seen_sigs.add(sig)
                
                # Format blend for output
                blend_dict = {}
                for i, ratio in enumerate(blend):
                    if ratio > 0:
                        blend_dict[self.predictor.coal_names[i]] = ratio
                
                # Get specific predictions for this blend
                predictions = {k: v[idx] for k, v in self.preds.items()}
                
                top_blends.append({
                    "rank": len(top_blends) + 1,
                    "fitness": self.fitness[idx],
                    "cost": self.costs[idx],
                    "predictions": predictions,
                    "composition": blend_dict
                })
                
                if len(top_blends) >= n:
                    break
        
        return top_blends