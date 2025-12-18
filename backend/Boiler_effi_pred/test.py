import pandas as pd
from pycaret.regression import load_model, predict_model

# =====================================
# 1. Define Input Features
# =====================================
input_features = [
    'Load',
    'feed water temperature',
    'Running plant load factor',
    'Air to fuel ratio for mill',
    'TM_WA', 'IM_WA', 'ASH_WA',
    'VM_WA', 'FC_WA',
    'GCV_WA', 'GCV (ARB)_WA'
]

# =====================================
# 2. Load Input CSV
# =====================================
input_csv_path = "Training_data.csv"
input_df = pd.read_csv(input_csv_path)

# Validate required columns
missing_cols = set(input_features) - set(input_df.columns)
if missing_cols:
    raise ValueError(f"Missing required columns in input CSV: {missing_cols}")

input_df_model = input_df[input_features].copy()

# =====================================
# 3. Load Trained Models
# =====================================
models = {
    "Boiler_Efficiency_Pred": load_model("boiler_efficiency_model"),
    "NOx_Pred": load_model("nox_model"),
    "UBC_in_BA_Pred": load_model("ubc_in_ba_model"),
    "UBC_in_FA_Pred": load_model("ubc_in_fa_model")
}

# =====================================
# 4. Run Batch Predictions
# =====================================
output_df = input_df.copy()

for target_name, model in models.items():
    pred_df = predict_model(model, data=input_df_model)
    output_df[target_name] = pred_df.iloc[:, -1]

# =====================================
# 5. Save Output CSV
# =====================================
output_csv_path = "inference_output_with_predictions.csv"
output_df.to_csv(output_csv_path, index=False)

print("\n✅ Batch prediction completed successfully.")
print(f"📄 Output saved as: {output_csv_path}")
