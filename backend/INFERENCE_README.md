# Coal Blend Inference Engine

This document explains the implementation of the coal blend inference code based on the Jupyter notebook logic.

## Overview

The inference engine implements a complete pipeline for predicting coal blend properties and emissions. It includes:

1. **Weighted Average Calculations** - Combines individual coal properties based on blend ratios with `weighted_{name}` format
2. **Feature Engineering** - Creates derived features (BI, MBI, CBI, VR ratios)
3. **Direct Formula Calculations** - Uses empirical formulas for CRI_direct, CSR_from_CRI, CSR_direct
4. **Global Scaler Normalization** - Uses `scaler_global.pkl` for feature normalization
5. **Target-Specific Model Predictions** - Uses `{target}_features.pkl` and `{target}_model.pkl` for each target
6. **Emission Calculations** - Calculates environmental impact

## Architecture

### Files Structure

```
backend/
├── main.py                 # FastAPI application with /predict endpoint
├── inference_engine.py     # Core inference logic
├── test_inference.py       # Test script for validation
├── Models/
│   ├── scaler_global.pkl   # Global feature scaler
│   ├── CRI_features.pkl    # Features for CRI prediction
│   ├── CRI_model.pkl       # Model for CRI prediction
│   ├── CSR_features.pkl    # Features for CSR prediction
│   ├── CSR_model.pkl       # Model for CSR prediction
│   ├── VM_features.pkl     # Features for VM prediction
│   ├── VM_model.pkl        # Model for VM prediction
│   ├── ASH_features.pkl    # Features for ASH prediction
│   ├── ASH_model.pkl       # Model for ASH prediction
│   └── [target]_scaler.pkl # Optional target-specific scalers
└── INFERENCE_README.md     # This documentation
```

### Core Components

#### 1. CoalBlendInferenceEngine Class

The main inference engine class that orchestrates the entire prediction pipeline.

**Key Methods:**

- `calculate_weighted_averages()` - Combines coal properties by blend ratios with weighted\_{name} format
- `engineer_features()` - Creates derived features from basic properties
- `calculate_direct_formulas()` - Applies empirical formulas for CRI/CSR
- `normalize_features()` - Uses global scaler for feature normalization
- `predict_target()` - Uses target-specific models for predictions
- `predict_all_targets()` - Predicts all 4 targets (CRI, CSR, VM, ASH)
- `calculate_emissions()` - Computes environmental emissions
- `run_inference()` - Complete pipeline execution

#### 2. Feature Engineering

Based on the Jupyter notebook, the engine calculates:

**Base Index (BI):**

```
BI = (Fe2O3 + CaO + MgO + Na2O + K2O) / (SiO2 + Al2O3 + TiO2)
```

**Modified Base Index (MBI):**

```
MBI = ((Ash * 100) / (100 - VM)) * BI
```

**Composite Base Index (CBI):**

```
CBI = (Inertinite + Minerals) / Σ(VR7 to VR19)
```

Where VR ratios are calculated as:

- VR7 = V7 / 3
- VR8 = V8 / 2.7
- VR9 = V9 / 2.5
- VR10 = V10 / 2.4
- VR11 = V11 / 2.5
- VR12 = V12 / 3
- VR13 = V13 / 3.7
- VR14 = V14 / 5
- VR15 = V15 / 7
- VR16 = V16 / 9.6
- VR17 = V17 / 12
- VR18 = V18 / 15
- VR19 = V19 / 18

**VR Ratios:**

```
VR7 = V7 / 3, VR8 = V8 / 2.7, ..., VR19 = V19 / 18
```

**Log Max Fluidity:**

```
Log_Max_Fluidity = log(Max_Fluidity_ddpm)
```

Where Max_Fluidity_ddpm is the maximum fluidity in ddpm (dial divisions per minute).

#### 3. Direct Formula Calculations

**CRI (Coke Reactivity Index):**

```
CRI_direct = -16.48 + 8.16 * VM - 21.68 * Log_Max_Fluidity
```

**CSR (Coke Strength After Reaction):**

```
CSR_from_CRI = 94.19 - 1.15 * CRI_direct
CSR_direct = 95.76 - 2.50 * VM + 11.00 * Log_Max_Fluidity
```

#### 4. Target-Specific Model Pipeline

For each target (CRI, CSR, VM, ASH):

1. **Feature Selection**: Load features from `{target}_features.pkl`
2. **Feature Extraction**: Extract only required features from all available features
3. **Target Scaler**: Apply target-specific scaler if available
4. **Model Prediction**: Use `{target}_model.pkl` for prediction

#### 5. Emission Calculations

**CO2 Emissions:**

```
CO2 = 0.7 * (FC/100) * (44.01/12.01) * 1000
```

**CO Emissions:**

```
CO = 0.3 * (FC/100) * (28.01/12.01) * 1000
```

**SO2 Emissions:**

```
SO2 = (S/100) * (64.07/32.06) * 1000
```

**NO/NO2 Emissions:**

```
NO = 0.2 * (N/100) * (30.01/14.01) * 1000
NO2 = 0.2 * (N/100) * (46.01/14.01) * 1000
```

**PM Index:**

```
PM_Index = 0.4 * (Ash/9) + 0.3 * (CRI/28) + 0.3 * (1 - CSR/65)
PM10 = 0.7 * PM_Index
PM2.5 = 0.3 * PM_Index
```

**VOC Index:**

```
VOC_Index = 0.5 * (VM/2.5) + 0.2 * (CRI/28) + 0.2 * (1 - CSR/65) + 0.1 * (N/1.0)
VOC = 0.9 * VOC_Index
PAH = 0.1 * VOC_Index
```

## API Usage

### /predict Endpoint

**Request:**

```json
{
  "blends": [
    {
      "coal_name": "Metropolitan",
      "percentage": 40
    },
    {
      "coal_name": "Lake Vermont",
      "percentage": 35
    },
    {
      "coal_name": "PDN",
      "percentage": 25
    }
  ]
}
```

**Response:**

```json
{
  "blend_properties": {
    "weighted_IM": 1.45,
    "weighted_Ash": 9.12,
    "weighted_VM": 26.23,
    "weighted_FC": 63.2,
    "weighted_S": 0.69,
    "weighted_P": 0.029,
    "weighted_BI": 0.234,
    "weighted_MBI": 3.456,
    "weighted_CBI": 0.0,
    "CRI_direct": 198.45,
    "CSR_from_CRI": -134.13,
    "CSR_direct": 29.23,
    "CO2_Emissions": 2567.89,
    "CO_Emissions": 1100.52,
    "SO2_Emissions": 13.78,
    "NO_Emissions": 0.77,
    "NO2_Emissions": 1.18,
    "PM_Index": 0.234,
    "PM10_Emissions": 0.164,
    "PM25_Emissions": 0.07,
    "VOC_Index": 0.456,
    "VOC_Emissions": 0.41,
    "PAH_Emissions": 0.046
  },
  "predicted_coal_properties": {
    "ash_percent": 9.12,
    "vm_percent": 26.23,
    "fc_percent": 63.2,
    "CSN": 0.0
  },
  "predicted_coke_properties": {
    "CRI": 26.5,
    "CSR": 64.2,
    "ASH": 12.0,
    "VM": 8.0,
    "N": 0.18,
    "S": 0.59,
    "P": 0.026,
    "FC": 80.0
  }
}
```

## Testing

Run the test script to validate the inference engine:

```bash
cd backend
python test_inference.py
```

This will test:

- Weighted average calculations with weighted\_{name} format
- Feature engineering
- Direct formula calculations
- Complete inference pipeline
- Target-specific model predictions
- Emission calculations

## Model Requirements

The inference engine expects the following model files:

### Required Files:

```
backend/Models/
├── scaler_global.pkl       # Global feature scaler
├── CRI_features.pkl        # Features for CRI prediction
├── CRI_model.pkl          # Model for CRI prediction
├── CSR_features.pkl       # Features for CSR prediction
├── CSR_model.pkl          # Model for CSR prediction
├── VM_features.pkl        # Features for VM prediction
├── VM_model.pkl           # Model for VM prediction
├── ASH_features.pkl       # Features for ASH prediction
└── ASH_model.pkl          # Model for ASH prediction
```

### Optional Files:

```
backend/Models/
├── CRI_scaler.pkl         # Target-specific scaler for CRI
├── CSR_scaler.pkl         # Target-specific scaler for CSR
├── VM_scaler.pkl          # Target-specific scaler for VM
└── ASH_scaler.pkl         # Target-specific scaler for ASH
```

## Data Requirements

### Coal Properties Database

Each coal should have the following properties:

- IM (Inherent Moisture)
- Ash, VM (Volatile Matter), FC (Fixed Carbon)
- S (Sulphur), P (Phosphorus), N (Nitrogen)
- SiO2, Al2O3, Fe2O3, CaO, MgO, Na2O, K2O, TiO2, Mn3O4, SO3, P2O5, BaO, SrO, ZnO
- CRI, CSR
- HGI, Vitrinite, Liptinite, Semi_Fusinite
- CSN_FSI, Initial_Softening_Temp, MBI, CBI, Log_Max_Fluidity
- C, H, O, ss
- Inertinite, Minerals, Max_Fluidity_ddpm
- V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 (Vitrinite reflectance values)

### Missing Data Handling

For missing data (V7-V19, coal categories, etc.), the engine:

- Sets VR ratios to 0.0
- Sets CBI to 0.0
- Sets Log_Max_Fluidity to 0.0
- Sets unavailable weighted features to 0.0

## Performance

The inference engine provides predictions for 4 target variables:

- **CRI (Coke Reactivity Index)**
- **CSR (Coke Strength After Reaction)**
- **VM (Volatile Matter)**
- **ASH (Ash Content)**

Each target uses its own specialized model and feature set for optimal performance.

## Integration

The inference engine is integrated into the FastAPI application:

1. **Startup**: All models and scalers loaded at application startup
2. **Request Processing**: `/predict` endpoint uses the complete inference pipeline
3. **Response**: Returns comprehensive prediction results with all calculations

## Error Handling

The engine includes comprehensive error handling:

- Validates input data
- Handles missing coal properties
- Provides detailed logging at each step
- Returns meaningful error messages
- Graceful fallback for missing models

## Logging

The inference engine provides detailed logging at each step:

- Model loading status
- Weighted average calculations
- Feature engineering progress
- Direct formula calculations
- Target-specific predictions
- Emission calculations
- Complete pipeline status

## Future Enhancements

Potential improvements:

1. Add support for V7-V19 data
2. Implement coal category classification
3. Add more sophisticated emission models
4. Include cost optimization
5. Add uncertainty quantification
6. Support for additional target variables
7. Real-time model updates
