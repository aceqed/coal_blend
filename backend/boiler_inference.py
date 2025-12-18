import os
import pandas as pd
import numpy as np
import joblib
from typing import Dict, List, Any
from schemas import BoilerParams, CoalBlendInput

class BoilerPredictor:
    def __init__(self, models_dir: str):
        self.models_dir = models_dir
        self.models = {}
        self._load_models()

    def _load_models(self):
        """Load the 4 boilerplate models."""
        # Maps internal key to filename
        model_files = {
            "boiler_eff": "boiler_efficiency_model.pkl",
            "nox": "nox_model.pkl",
            "ubc_ba": "ubc_in_ba_model.pkl",
            "ubc_fa": "ubc_in_fa_model.pkl"
        }
        
        for key, filename in model_files.items():
            path = os.path.join(self.models_dir, filename)
            try:
                # Try loading with joblib (standard for sklearn/pycaret pipelines if just pkl)
                self.models[key] = joblib.load(path)
                print(f"Loaded {key} model from {path}")
            except Exception as e:
                print(f"Error loading {key} model from {path}: {e}")
                self.models[key] = None

    def calculate_weighted_average(self, blends: List[CoalBlendInput], coal_properties: list) -> Dict[str, float]:
        """
        Calculate weighted average of coal properties.
        coal_properties: list of CoalProperties objects (or dicts) from DB corresponding to the blends.
        """
        if not blends:
            return {}

        avg_props = {
            "TM": 0.0, "IM": 0.0, "Ash": 0.0, "VM": 0.0, 
            "FC": 0.0, "GCV": 0.0, "GCV_ARB": 0.0
        }
        
        total_pct = sum(b.percentage for b in blends)
        if total_pct == 0:
            return avg_props

        # Create a lookup for properties
        # Assuming coal_properties is a list of SQLAlchemy objects or dicts
        props_map = {c.coal_name: c for c in coal_properties}

        for blend in blends:
            coal = props_map.get(blend.coal_name)
            if not coal:
                continue
            
            # Helper to get attr or dict item
            def get_val(obj, key):
                return getattr(obj, key, 0.0) if hasattr(obj, key) else obj.get(key, 0.0)

            ratio = blend.percentage / 100.0 # user input is likely 0-100? Assuming sum is 100
            
            # Map DB fields to what we need
            # DB: TM, IM, Ash, VM, FC, GCV, GCV_ARB
            avg_props["TM"] += get_val(coal, "TM") * ratio
            avg_props["IM"] += get_val(coal, "IM") * ratio
            avg_props["Ash"] += get_val(coal, "Ash") * ratio
            avg_props["VM"] += get_val(coal, "VM") * ratio
            avg_props["FC"] += get_val(coal, "FC") * ratio
            avg_props["GCV"] += get_val(coal, "GCV") * ratio
            avg_props["GCV_ARB"] += get_val(coal, "GCV_ARB") * ratio

        return avg_props

    def predict(self, blends: List[CoalBlendInput], boiler_params: BoilerParams, coal_properties: list) -> Dict[str, float]:
        """
        Run predictions.
        """
        # 1. Calc Weighted Averages
        wa = self.calculate_weighted_average(blends, coal_properties)
        
        # 2. Prepare Input Vector
        # Order must match training: 
        # 'Load', 'feed water temperature', 'Running plant load factor', 'Air to fuel ratio for mill',
        # 'TM_WA', 'IM_WA', 'ASH_WA', 'VM_WA', 'FC_WA', 'GCV_WA', 'GCV (ARB)_WA'
        
        input_data = pd.DataFrame([{
            'Load': boiler_params.load,
            'feed water temperature': boiler_params.feed_water_temp,
            'Running plant load factor': boiler_params.running_plant_load_factor,
            'Air to fuel ratio for mill': boiler_params.air_to_fuel_ratio,
            'TM_WA': wa["TM"],
            'IM_WA': wa["IM"],
            'ASH_WA': wa["Ash"],
            'VM_WA': wa["VM"],
            'FC_WA': wa["FC"],
            'GCV_WA': wa["GCV"],
            'GCV (ARB)_WA': wa["GCV_ARB"]
        }])

        # 3. Predict
        results = {}
        
        # Boiler Efficiency
        if self.models.get("boiler_eff"):
            try:
                pred = self.models["boiler_eff"].predict(input_data)
                results["boiler_efficiency"] = float(pred[0])
            except Exception as e:
                print(f"Prediction error (Efficiency): {e}")
                results["boiler_efficiency"] = -1.0

        # NOx
        if self.models.get("nox"):
            try:
                pred = self.models["nox"].predict(input_data)
                results["nox"] = float(pred[0])
            except Exception as e:
                print(f"Prediction error (NOx): {e}")
                results["nox"] = -1.0

        # UBC BA
        if self.models.get("ubc_ba"):
            try:
                pred = self.models["ubc_ba"].predict(input_data)
                results["ubc_ba"] = float(pred[0])
            except Exception as e:
                print(f"Prediction error (UBC BA): {e}")
                results["ubc_ba"] = -1.0

        # UBC FA
        if self.models.get("ubc_fa"):
            try:
                pred = self.models["ubc_fa"].predict(input_data)
                results["ubc_fa"] = float(pred[0])
            except Exception as e:
                print(f"Prediction error (UBC FA): {e}")
                results["ubc_fa"] = -1.0
                
        # Add GCV averages to results as requested in notebook requirements (Step 5 in notebook)
        results["gcv_wa"] = wa["GCV"]
        results["gcv_arb_wa"] = wa["GCV_ARB"]

        return results

    def batch_predict(self, population: np.ndarray, boiler_params_list: list, coal_properties: list, coal_names: list) -> tuple:
        """
        Batch prediction for entire population at once.
        
        Args:
            population: np.ndarray of shape (pop_size, n_coals) with blend ratios (0-1)
            boiler_params_list: list of dicts with Load, feed_water_temp, etc for each individual
            coal_properties: list of coal property objects from DB
            coal_names: list of coal names corresponding to columns in population
            
        Returns:
            (scores, predictions) where scores is array and predictions is dict of arrays
        """
        pop_size = population.shape[0]
        n_coals = population.shape[1]
        
        # Build property matrix from coal properties
        props_map = {c.coal_name: c for c in coal_properties}
        
        # Properties we need for weighted average
        prop_keys = ["TM", "IM", "Ash", "VM", "FC", "GCV", "GCV_ARB"]
        prop_matrix = np.zeros((n_coals, len(prop_keys)))
        
        for i, name in enumerate(coal_names):
            coal = props_map.get(name)
            if coal:
                for j, key in enumerate(prop_keys):
                    val = getattr(coal, key, None) or 0.0
                    prop_matrix[i, j] = val if val else 0.0
        
        # Weighted averages for entire population: (pop_size, n_props)
        weighted_props = np.dot(population, prop_matrix)  # population ratios are 0-1
        
        # Build input DataFrame for all individuals at once
        input_rows = []
        for idx in range(pop_size):
            bp = boiler_params_list[idx]
            input_rows.append({
                'Load': bp["Load"],
                'feed water temperature': bp["feed_water_temp"],
                'Running plant load factor': bp["running_plant_load_factor"],
                'Air to fuel ratio for mill': bp["air_to_fuel_ratio"],
                'TM_WA': weighted_props[idx, 0],
                'IM_WA': weighted_props[idx, 1],
                'ASH_WA': weighted_props[idx, 2],
                'VM_WA': weighted_props[idx, 3],
                'FC_WA': weighted_props[idx, 4],
                'GCV_WA': weighted_props[idx, 5],
                'GCV (ARB)_WA': weighted_props[idx, 6]
            })
        
        input_df = pd.DataFrame(input_rows)
        
        # Batch predict for each model
        predictions = {
            "boiler_efficiency": np.zeros(pop_size),
            "nox": np.zeros(pop_size),
            "ubc_ba": np.zeros(pop_size),
            "ubc_fa": np.zeros(pop_size),
            "gcv_wa": weighted_props[:, 5],
            "gcv_arb_wa": weighted_props[:, 6]
        }
        
        if self.models.get("boiler_eff"):
            try:
                predictions["boiler_efficiency"] = self.models["boiler_eff"].predict(input_df)
            except Exception as e:
                print(f"Batch prediction error (Efficiency): {e}")
        
        if self.models.get("nox"):
            try:
                predictions["nox"] = self.models["nox"].predict(input_df)
            except Exception as e:
                print(f"Batch prediction error (NOx): {e}")
        
        if self.models.get("ubc_ba"):
            try:
                predictions["ubc_ba"] = self.models["ubc_ba"].predict(input_df)
            except Exception as e:
                print(f"Batch prediction error (UBC BA): {e}")
        
        if self.models.get("ubc_fa"):
            try:
                predictions["ubc_fa"] = self.models["ubc_fa"].predict(input_df)
            except Exception as e:
                print(f"Batch prediction error (UBC FA): {e}")
        
        return predictions

