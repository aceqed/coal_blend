"""
Comparison script to test boiler_inference.py predictions against pycaret test.py results.
This script loads the Training_data.csv, runs predictions using BoilerPredictor,
and compares them with the existing inference_output_with_predictions.csv.
"""

import os
import sys
import pandas as pd
import numpy as np

# Add parent directory to path to import boiler_inference
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from boiler_inference import BoilerPredictor

# =====================================
# 1. Configuration
# =====================================
MODELS_DIR = os.path.dirname(os.path.abspath(__file__))  # Models are in the same directory
INPUT_CSV = os.path.join(MODELS_DIR, "Training_data.csv")
REFERENCE_CSV = os.path.join(MODELS_DIR, "inference_output_with_predictions.csv")
OUTPUT_CSV = os.path.join(MODELS_DIR, "boiler_inference_comparison.csv")

# Input features expected by the models
INPUT_FEATURES = [
    'Load',
    'feed water temperature',
    'Running plant load factor',
    'Air to fuel ratio for mill',
    'TM_WA', 'IM_WA', 'ASH_WA',
    'VM_WA', 'FC_WA',
    'GCV_WA', 'GCV (ARB)_WA'
]

# =====================================
# 2. Load Input Data
# =====================================
print("Loading input data...")
input_df = pd.read_csv(INPUT_CSV)

# Validate required columns
missing_cols = set(INPUT_FEATURES) - set(input_df.columns)
if missing_cols:
    raise ValueError(f"Missing required columns in input CSV: {missing_cols}")

print(f"Loaded {len(input_df)} rows from {INPUT_CSV}")

# =====================================
# 3. Load Reference Predictions (pycaret test.py output)
# =====================================
print("Loading reference predictions...")
reference_df = pd.read_csv(REFERENCE_CSV)
print(f"Loaded {len(reference_df)} rows from {REFERENCE_CSV}")

# =====================================
# 4. Initialize BoilerPredictor
# =====================================
print("\nInitializing BoilerPredictor...")
predictor = BoilerPredictor(MODELS_DIR)

# =====================================
# 5. Run Predictions Using BoilerPredictor
# =====================================
print("\nRunning predictions using BoilerPredictor...")

# Prepare input DataFrame for BoilerPredictor (same column format)
input_data = input_df[INPUT_FEATURES].copy()

# Create a DataFrame for batch predictions
results = {
    "Boiler_Efficiency_Pred_New": [],
    "NOx_Pred_New": [],
    "UBC_in_BA_Pred_New": [],
    "UBC_in_FA_Pred_New": []
}

# Run predictions for each row
for idx in range(len(input_data)):
    row = input_data.iloc[idx]
    
    # Create input DataFrame for single prediction
    single_input = pd.DataFrame([{
        'Load': row['Load'],
        'feed water temperature': row['feed water temperature'],
        'Running plant load factor': row['Running plant load factor'],
        'Air to fuel ratio for mill': row['Air to fuel ratio for mill'],
        'TM_WA': row['TM_WA'],
        'IM_WA': row['IM_WA'],
        'ASH_WA': row['ASH_WA'],
        'VM_WA': row['VM_WA'],
        'FC_WA': row['FC_WA'],
        'GCV_WA': row['GCV_WA'],
        'GCV (ARB)_WA': row['GCV (ARB)_WA']
    }])
    
    # Predict using each model
    try:
        if predictor.models.get("boiler_eff"):
            pred = predictor.models["boiler_eff"].predict(single_input)
            results["Boiler_Efficiency_Pred_New"].append(float(pred[0]))
        else:
            results["Boiler_Efficiency_Pred_New"].append(np.nan)
    except Exception as e:
        print(f"Row {idx}: Error predicting boiler_eff: {e}")
        results["Boiler_Efficiency_Pred_New"].append(np.nan)
    
    try:
        if predictor.models.get("nox"):
            pred = predictor.models["nox"].predict(single_input)
            results["NOx_Pred_New"].append(float(pred[0]))
        else:
            results["NOx_Pred_New"].append(np.nan)
    except Exception as e:
        print(f"Row {idx}: Error predicting nox: {e}")
        results["NOx_Pred_New"].append(np.nan)
    
    try:
        if predictor.models.get("ubc_ba"):
            pred = predictor.models["ubc_ba"].predict(single_input)
            results["UBC_in_BA_Pred_New"].append(float(pred[0]))
        else:
            results["UBC_in_BA_Pred_New"].append(np.nan)
    except Exception as e:
        print(f"Row {idx}: Error predicting ubc_ba: {e}")
        results["UBC_in_BA_Pred_New"].append(np.nan)
    
    try:
        if predictor.models.get("ubc_fa"):
            pred = predictor.models["ubc_fa"].predict(single_input)
            results["UBC_in_FA_Pred_New"].append(float(pred[0]))
        else:
            results["UBC_in_FA_Pred_New"].append(np.nan)
    except Exception as e:
        print(f"Row {idx}: Error predicting ubc_fa: {e}")
        results["UBC_in_FA_Pred_New"].append(np.nan)

print(f"Completed predictions for {len(input_data)} rows")

# =====================================
# 6. Compare Results
# =====================================
print("\n" + "="*60)
print("COMPARISON RESULTS")
print("="*60)

# Create comparison DataFrame
comparison_df = input_df.copy()

# Add new predictions
for key, values in results.items():
    comparison_df[key] = values

# Add reference predictions
comparison_df["Boiler_Efficiency_Pred_Ref"] = reference_df["Boiler_Efficiency_Pred"]
comparison_df["NOx_Pred_Ref"] = reference_df["NOx_Pred"]
comparison_df["UBC_in_BA_Pred_Ref"] = reference_df["UBC_in_BA_Pred"]
comparison_df["UBC_in_FA_Pred_Ref"] = reference_df["UBC_in_FA_Pred"]

# Calculate differences
comparison_df["Boiler_Eff_Diff"] = comparison_df["Boiler_Efficiency_Pred_New"] - comparison_df["Boiler_Efficiency_Pred_Ref"]
comparison_df["NOx_Diff"] = comparison_df["NOx_Pred_New"] - comparison_df["NOx_Pred_Ref"]
comparison_df["UBC_BA_Diff"] = comparison_df["UBC_in_BA_Pred_New"] - comparison_df["UBC_in_BA_Pred_Ref"]
comparison_df["UBC_FA_Diff"] = comparison_df["UBC_in_FA_Pred_New"] - comparison_df["UBC_in_FA_Pred_Ref"]

# Print summary statistics
metrics = [
    ("Boiler Efficiency", "Boiler_Eff_Diff", "Boiler_Efficiency_Pred_New", "Boiler_Efficiency_Pred_Ref"),
    ("NOx", "NOx_Diff", "NOx_Pred_New", "NOx_Pred_Ref"),
    ("UBC in BA", "UBC_BA_Diff", "UBC_in_BA_Pred_New", "UBC_in_BA_Pred_Ref"),
    ("UBC in FA", "UBC_FA_Diff", "UBC_in_FA_Pred_New", "UBC_in_FA_Pred_Ref")
]

for name, diff_col, new_col, ref_col in metrics:
    print(f"\n{name}:")
    print("-" * 40)
    
    # Filter out NaN values for comparison
    valid_mask = comparison_df[new_col].notna() & comparison_df[ref_col].notna()
    valid_df = comparison_df[valid_mask]
    
    if len(valid_df) > 0:
        diff = valid_df[diff_col]
        print(f"  Mean Difference:     {diff.mean():.6f}")
        print(f"  Std Difference:      {diff.std():.6f}")
        print(f"  Max Abs Difference:  {diff.abs().max():.6f}")
        print(f"  Min Difference:      {diff.min():.6f}")
        print(f"  Max Difference:      {diff.max():.6f}")
        
        # Calculate Mean Absolute Error (MAE)
        mae = diff.abs().mean()
        print(f"  MAE:                 {mae:.6f}")
        
        # Calculate Mean Absolute Percentage Error (MAPE) where reference != 0
        non_zero_mask = valid_df[ref_col] != 0
        if non_zero_mask.any():
            mape = (diff[non_zero_mask].abs() / valid_df.loc[non_zero_mask, ref_col].abs() * 100).mean()
            print(f"  MAPE:                {mape:.4f}%")
        
        # Check if predictions are exactly equal
        exact_match = (diff.abs() < 1e-10).sum()
        print(f"  Exact Matches:       {exact_match}/{len(valid_df)}")
        
        # Very close matches (within 0.001)
        close_match = (diff.abs() < 0.001).sum()
        print(f"  Close Matches (<0.001): {close_match}/{len(valid_df)}")
    else:
        print("  No valid predictions to compare")

# =====================================
# 7. Save Comparison Output
# =====================================
comparison_df.to_csv(OUTPUT_CSV, index=False)
print(f"\n✅ Comparison output saved to: {OUTPUT_CSV}")

# =====================================
# 8. Sample Comparison (first 5 rows)
# =====================================
print("\n" + "="*60)
print("SAMPLE COMPARISON (First 5 rows)")
print("="*60)

sample_cols = [
    "Load", "feed water temperature",
    "Boiler_Efficiency_Pred_New", "Boiler_Efficiency_Pred_Ref", "Boiler_Eff_Diff",
    "NOx_Pred_New", "NOx_Pred_Ref", "NOx_Diff"
]

print(comparison_df[sample_cols].head().to_string())

print("\n✅ Comparison script completed successfully!")
