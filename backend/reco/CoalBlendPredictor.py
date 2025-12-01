import pandas as pd
import numpy as np
import pickle
import re
from pathlib import Path
from pycaret.regression import load_model, predict_model
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv


class CoalBlendPredictor:
    """
    Coal Blend Prediction System

    Predicts CRI, CSR, ASH, and VM values based on coal blend ratios.
    """

    def __init__(self,
                 coal_db_path="reco/Clean_exist_coals.csv",
                 models_dir="reco"):
        """
        Initialize the Coal Blend Predictor

        Parameters:
        -----------
        coal_db_path : str
            Path to Clean_exist_coals.csv
        scaler_path : str
            Path to scaler_colwise.pkl
        models_dir : str
            Directory containing model files (CRI_model.pkl, etc.)
        """
        self.coal_db_path = coal_db_path
        self.models_dir = Path(models_dir)

        # Initialize coal database
        self.coal_db = None
        self.feature_names = None
        self.models = {}
        self.model_features = {}

        # Load all necessary files
        self._load_resources()

    def _reload_coal_data(self):
        """Reload only the coal database"""
        self.coal_db = self._load_coal_database()
        self.coal_db = self._feature_engineering(self.coal_db)
        self.coal_db = self._prepare_coal_properties(self.coal_db)

    def _load_resources(self):
        """Load coal database, scaler, and models"""
        try:
            # Load coal database
            self._reload_coal_data()

            # Load scaler
            # with open(self.scaler_path, "rb") as f:
            #     scaler_data = pickle.load(f)
            # self.scaler = scaler_data['scaler']
            # self.feature_names = scaler_data['feature_names'] 

            # Load models
            targets = ["CRI", "CSR", "ASH", "VM"]
            for target in targets:
                model_path = self.models_dir / f"{target}_model"
                features_path = self.models_dir / f"{target}_features.pkl"

                self.models[target] = load_model(str(model_path))

                with open(features_path, "rb") as f:
                    self.model_features[target] = pickle.load(f)

        except Exception as e:
            raise RuntimeError(f"Failed to load resources: {str(e)}")

    @staticmethod
    def _normalize_name(s):
        """Normalize coal names for matching"""
        s = str(s).lower().strip()
        s = re.sub(r'[^a-z0-9]+', ' ', s)
        s = re.sub(r'\s+', ' ', s).strip()
        return s

    def _load_coal_database(self):
        """Load and prepare coal properties database from SQL"""
        try:
            load_dotenv()
            database_url = os.getenv("DATABASE_URL")
            
            if not database_url:
                print("⚠️ No DATABASE_URL found, falling back to CSV")
                return self._load_from_csv()

            engine = create_engine(database_url)
            query = "SELECT * FROM coal_properties_clean"
            df = pd.read_sql(query, engine)
            
            # Map DB columns to expected names
            rename_map = {
                'coal_name': 'Name_of_coal',
                'coal_category': 'Coal Category',
                'MaxFluidity': 'Max. Fluidity ddpm',
                'VM': 'V.M.',
                'FC': 'F.C',
                'IM': 'Inherent Moisture',
                'S': 'Total Sulphur',
                'P': 'Phosphorus',
                'CSN_FSI': 'CSN/FSI'
            }
            df = df.rename(columns=rename_map)
            
            # Clean column names
            df.columns = df.columns.str.strip()
            df.columns = df.columns.str.replace(r'\s+', ' ', regex=True)
            
            # Fill missing values
            df = df.fillna(0)
            
            # Create normalized name column for matching
            df['__norm_name'] = df['Name_of_coal'].map(self._normalize_name)
            
            return df

        except Exception as e:
            print(f"Error loading from DB: {e}, falling back to CSV")
            return self._load_from_csv()

    def _load_from_csv(self):
        """Fallback to loading from CSV"""
        df = pd.read_csv(self.coal_db_path)

        # Clean column names
        df.columns = df.columns.str.strip()
        df.columns = df.columns.str.replace(r'\s+', ' ', regex=True)
        df.columns = df.columns.str.replace('\ufeff', '')

        # Fill missing values
        df = df.fillna(0)

        # Create normalized name column for matching
        df['__norm_name'] = df['Name_of_coal'].map(self._normalize_name)

        return df

    def _feature_engineering(self, df):
        """Apply feature engineering (BI, MBI, VR, CBI, Log_Max_Fluidity)"""

        # 1. Calculate BI
        df['BI'] = (df['Fe2O3'] + df['CaO'] + df['MgO'] + df['Na2O'] + df['K2O']) / \
                   (df['SiO2'] + df['Al2O3'] + df['TiO2'])

        # 2. Calculate MBI
        df['MBI'] = ((df['Ash'] * 100) / (100 - df['V.M.'])) * df['BI']

        # 3. VR7 to VR19
        ratios = {
            "V7": 3, "V8": 2.7, "V9": 2.5, "V10": 2.4, "V11": 2.5,
            "V12": 3, "V13": 3.7, "V14": 5, "V15": 7, "V16": 9.6,
            "V17": 12, "V18": 15, "V19": 18
        }

        for col, divisor in ratios.items():
            if col in df.columns:
                df[f'VR{col[1:]}'] = df[col] / divisor

        # 4. Calculate CBI only for HCC, HFCC, SHCC
        VR_cols = [f'VR{i}' for i in range(7, 20) if f'VR{i}' in df.columns]
        sum_vr = df[VR_cols].sum(axis=1)

        df['CBI'] = np.where(
            (df['Coal Category'].isin(['HCC', 'HFCC', 'SHCC'])) & (sum_vr != 0),
            (df['Inertinite'] + df['Minerals']) / sum_vr,
            0
        )

        # 5. Log of Max. Fluidity ddpm
        if 'Max. Fluidity ddpm' in df.columns:
            df['Log_Max_Fluidity'] = np.log(df['Max. Fluidity ddpm'].replace(0, np.nan)).fillna(0)

        return df

    def _prepare_coal_properties(self, df):
        """Prepare coal properties after feature engineering"""

        # Columns to drop
        cols_to_drop = (
            ['Max. Fluidity ddpm'] +
            [f'V{i}' for i in range(7, 20)] +
            [f'VR{i}' for i in range(7, 20)] +
            ['Inertinite', 'Minerals',
             'SiO2', 'Al2O3', 'Fe2O3', 'CaO', 'MgO',
             'Na2O', 'K2O', 'TiO2', 'Mn3O4', 'SO3',
             'P2O5', 'BaO', 'SrO', 'ZnO'] +
            ['C', 'H', 'O', 'N', 'S']  + ['HGI (ASTM)',"Rank","Vitrinite %","Liptinite","Semi-Fusinite","Initial Softening Temp."]
        )

        # Drop only existing columns
        df = df.drop(columns=[c for c in cols_to_drop if c in df.columns])

        return df

    def _calculate_weighted_features(self, coal_inputs):
        """
        Calculate weighted features based on coal inputs

        Parameters:
        -----------
        coal_inputs : dict
            Dictionary like {'Goonyella': 50, 'R.PCI': 50}

        Returns:
        --------
        dict : Category percentages and weighted features
        """

        # Initialize category percentages
        categories = {'HCC': 0, 'SHCC': 0, 'HFCC': 0, 'PCI': 0, 'WC': 0}

        # Property columns (exclude Name and Category)
        exclude_cols = ['Name_of_coal', '__norm_name', 'Coal Category']
        prop_cols = [c for c in self.coal_db.columns if c not in exclude_cols]

        # Initialize weighted sums
        weighted_features = {f'weighted_{col}': 0 for col in prop_cols}

        # Process each coal input
        for coal_name, ratio in coal_inputs.items():
            norm_name = self._normalize_name(coal_name)

            # Find coal in database
            coal_row = self.coal_db[self.coal_db['__norm_name'] == norm_name]

            if coal_row.empty:
                raise ValueError(f"Coal '{coal_name}' not found in database!")

            coal_row = coal_row.iloc[0]

            # Add to category
            category = coal_row['Coal Category']
            if category in categories:
                categories[category] += ratio

            # Calculate weighted properties
            for col in prop_cols:
                weighted_features[f'weighted_{col}'] += coal_row[col] * ratio

        # Combine categories and weighted features
        result = {**categories, **weighted_features}

        return result

    # def _calculate_cri_csr(self, blend_features):
    #     """Calculate CRI and CSR using formulas"""

    #     vm = blend_features['weighted_V.M.']
    #     log_fluidity = blend_features['weighted_Log_Max_Fluidity']

    #     # Calculate CRI
    #     cri_direct = -16.48 + 8.16 * vm - 21.68 * log_fluidity

    #     # Calculate CSR (two formulas)
    #     csr_from_cri = 94.19 - 1.15 * cri_direct
    #     csr_direct = 95.76 - 2.50 * vm + 11.00 * log_fluidity

    #     blend_features['CRI_direct'] = cri_direct
    #     blend_features['CSR_from_CRI'] = csr_from_cri
    #     blend_features['CSR_direct'] = csr_direct

    #     return blend_features

    # def _normalize_features(self, blend_features):
    #     """Normalize features using loaded scaler"""

    #     # Extract feature values in correct order
    #     feature_values = [blend_features[fname] for fname in self.feature_names]
    #     feature_array = np.array(feature_values).reshape(1, -1)

    #     # Normalize (column-wise)
    #     normalized = self.scaler.transform(feature_array)

    #     # Create normalized dict
    #     normalized_dict = dict(zip(self.feature_names, normalized[0]))

    #     return normalized_dict

    def _predict_targets(self, normalized_features):
        """Predict CRI, CSR, ASH, VM using loaded models"""

        predictions = {}

        for target in ["CRI", "CSR", "ASH", "VM"]:
            # Prepare input DataFrame
            input_df = pd.DataFrame([normalized_features])
            input_df = input_df[self.model_features[target]]

            # Predict
            pred = predict_model(self.models[target], data=input_df)
            predictions[target] = pred['prediction_label'].iloc[0]

        return predictions

    def predict(self, coal_inputs, verbose=False):
        """
        Main prediction method

        Parameters:
        -----------
        coal_inputs : dict
            Dictionary of coal names and their ratios
            Example: {'Goonyella': 50, 'R.PCI': 50}
        verbose : bool
            If True, print detailed information

        Returns:
        --------
        dict : Contains blend_composition, category_distribution, and predictions

        Example:
        --------
        >>> predictor = CoalBlendPredictor()
        >>> result = predictor.predict({'Goonyella': 50, 'R.PCI': 50})
        >>> print(result['predictions']['CRI'])
        27.5
        """

        if verbose:
            print("🔮 Starting prediction...")

        # Reload data to ensure freshness
        self._reload_coal_data()

        # Validate total ratio
        total_ratio = sum(coal_inputs.values())
        if abs(total_ratio - 100) > 0.01:
            raise ValueError(f"Total ratio must be 100%, got {total_ratio}%")

        try:
            # Calculate weighted features
            blend_features = self._calculate_weighted_features(coal_inputs)

            # Calculate CRI/CSR
            # blend_features = self._calculate_cri_csr(blend_features)

            # # Normalize features
            # normalized_features = self._normalize_features(blend_features)

            # Predict targets
            predictions = self._predict_targets(blend_features) 

            # Prepare result
            result = {
                'blend_composition': coal_inputs,
                'category_distribution': {
                    k: blend_features[k]
                    for k in ['HCC', 'SHCC', 'HFCC', 'PCI', 'WC']
                },
                'predictions': predictions,
                'status': 'success'
            }

            if verbose:
                self._print_results(result)
            print(result)
            return result

        except Exception as e:
            return {
                'status': 'error',
                'error_message': str(e),
                'blend_composition': coal_inputs
            }


    def _print_results(self, result):
        """Print formatted results"""
        print("\n" + "=" * 60)
        print("BLEND COMPOSITION")
        print("=" * 60)
        for coal, ratio in result['blend_composition'].items():
            print(f"  {coal}: {ratio}%")

        print("\n" + "=" * 60)
        print("COAL CATEGORY DISTRIBUTION")
        print("=" * 60)
        for cat, value in result['category_distribution'].items():
            print(f"  {cat}: {value}%")

        print("\n" + "=" * 60)
        print("PREDICTIONS")
        print("=" * 60)
        for target, value in result['predictions'].items():
            print(f"  {target}: {value:.2f}")
        print("=" * 60 + "\n")

    def batch_predict(self, coal_inputs_list, verbose=False):
        """
        Predict for multiple blends

        Parameters:
        -----------
        coal_inputs_list : list of dict
            List of coal input dictionaries
        verbose : bool
            If True, print progress

        Returns:
        --------
        list : List of prediction results
        """
        results = []

        for i, coal_inputs in enumerate(coal_inputs_list):
            if verbose:
                print(f"\n[{i+1}/{len(coal_inputs_list)}] Processing blend...")

            result = self.predict(coal_inputs, verbose=verbose)
            results.append(result)

        return results

    def get_available_coals(self):
        """
        Get list of available coal names in the database

        Returns:
        --------
        list : List of coal names
        """
        return self.coal_db['Name_of_coal'].tolist()

    def get_coal_info(self, coal_name):
        """
        Get information about a specific coal

        Parameters:
        -----------
        coal_name : str
            Name of the coal

        Returns:
        --------
        dict : Coal properties and category
        """
        norm_name = self._normalize_name(coal_name)
        coal_row = self.coal_db[self.coal_db['__norm_name'] == norm_name]

        if coal_row.empty:
            return None

        coal_row = coal_row.iloc[0]
        return {
            'name': coal_row['Name_of_coal'],
            'category': coal_row['Coal Category'],
            'properties': coal_row.drop(['Name_of_coal', '__norm_name', 'Coal Category']).to_dict()
        }

    def Blend_cost(self, blend_dict):
        # Load coal cost data
        coal_costs = pd.read_csv('/content/coal_costs.csv')
        coal_costs.set_index('Name_of_coal', inplace=True)
        total_cost = 0.0
        for coal_name, percentage in blend_dict.items():
            if coal_name not in coal_costs.index:
              raise ValueError(f"Coal '{coal_name}' not found in coal_costs.csv")
            cost_per_ton = coal_costs.loc[coal_name, 'Cost']
            ton_fraction = percentage / 100 # convert % to fraction
            total_cost += cost_per_ton * ton_fraction
        return {'Total blend Cost': float(total_cost)}

    '''
            Below is the way to make input for cost function i.e cost_input
            predictions = model_result.get('predictions', {})
            cost_dict = predictor.Blend_cost(blend)
            cost_fn_input = {'Total blend Cost': cost_dict.get('Total blend Cost', 0.0), 'predictions': predictions}
            cost_result = predictor.cost_function(cost_fn_input)
    '''
    def cost_function(self, cost_input):
    # combine difference from desired values + blend cost in a simple way
        desired = {
            'CRI': {'type': 'range', 'min': 22, 'max': 28, 'weight': 1.0},
            'CSR': {'type': 'min', 'min': 63, 'weight': 1.5},
            'ASH': {'type': 'max', 'max': 13.5, 'weight': 1.2}
        }
        preds = cost_input['predictions']
        penalty = 0.0
        # CRI: penalty outside range
        d = desired['CRI']
        if preds['CRI'] < d['min']:
            penalty += (d['min'] - preds['CRI']) * d['weight'] * 1000
        elif preds['CRI'] > d['max']:
            penalty += (preds['CRI'] - d['max']) * d['weight'] * 1000
        # CSR: penalty if below min
        d = desired['CSR']
        if preds['CSR'] < d['min']:
            penalty += (d['min'] - preds['CSR']) * d['weight'] * 1000
        # ASH: penalty if above max
        d = desired['ASH']
        if preds['ASH'] > d['max']:
            penalty += (preds['ASH'] - d['max']) * d['weight'] * 1000
        # plus blend cost influence
        total_cost = cost_input.get('Total blend Cost', 0)
        # combine
        score = total_cost + penalty
        return {'Cost function evaluation': float(score)}


    def predict_from_csv(self, input_csv_path, output_csv_path=None, verbose=True):
        """
        Predict from CSV file where columns are coal names and values are ratios

        Parameters:
        -----------
        input_csv_path : str
            Path to input CSV file with coal names as columns and ratios as values
        output_csv_path : str, optional
            Path to save output CSV with predictions appended
            If None, will add '_predictions' to input filename
        verbose : bool
            If True, print progress

        Returns:
        --------
        pd.DataFrame : DataFrame with original data + predictions

        Example CSV format:
        Goonyella,R.PCI,Peak Downs,CRI,CSR,ASH,VM
        50,30,20,,,,
        40,40,20,,,,
        """

        if verbose:
            print(f"\n{'='*60}")
            print("COAL BLEND CSV PREDICTION")
            print(f"{'='*60}")
            print(f"📂 Loading: {input_csv_path}")

        # Load CSV
        df = pd.read_csv(input_csv_path)

        # Clean column names
        df.columns = df.columns.str.strip()

        # Identify prediction columns (CRI, CSR, ASH, VM) if they exist
        prediction_cols = ['CRI', 'CSR', 'ASH', 'VM']
        existing_pred_cols = [col for col in prediction_cols if col in df.columns]

        # Get coal columns (all columns except prediction columns)
        coal_columns = [col for col in df.columns if col not in prediction_cols]

        if verbose:
            print(f"🔍 Found {len(coal_columns)} coal columns")
            print(f"📊 Processing {len(df)} blend(s)...")

        # Initialize prediction columns if they don't exist
        for col in prediction_cols:
            if col not in df.columns:
                df[col] = np.nan

        # Process each row
        successful = 0
        failed = 0
        errors = []

        for idx, row in df.iterrows():
            # Create coal input dictionary (only non-zero/non-empty values)
            coal_inputs = {}
            for coal_name in coal_columns:
                value = row[coal_name]
                # Handle empty strings, NaN, and zeros
                if pd.notna(value) and value != '' and float(value) != 0:
                    coal_inputs[coal_name] = float(value)

            # Skip if no valid coal inputs
            if not coal_inputs:
                if verbose:
                    print(f"  ⚠️  Row {idx+1}: No valid coal ratios found, skipping...")
                failed += 1
                errors.append(f"Row {idx+1}: No valid coal ratios")
                continue

            # Predict
            result = self.predict(coal_inputs, verbose=False)

            if result['status'] == 'success':
                # Update predictions in DataFrame
                for target in prediction_cols:
                    df.at[idx, target] = result['predictions'][target]
                successful += 1

                if verbose:
                    blend_str = ', '.join([f"{k}:{v}%" for k, v in coal_inputs.items()])
                    print(f"  ✅ Row {idx+1}: {blend_str}")
                    print(f"      → CRI={result['predictions']['CRI']:.2f}, "
                          f"CSR={result['predictions']['CSR']:.2f}, "
                          f"ASH={result['predictions']['ASH']:.2f}, "
                          f"VM={result['predictions']['VM']:.2f}")
            else:
                failed += 1
                errors.append(f"Row {idx+1}: {result['error_message']}")
                if verbose:
                    print(f"  ❌ Row {idx+1}: {result['error_message']}")

        # Save output
        if output_csv_path is None:
            # Generate output filename
            input_path = Path(input_csv_path)
            output_csv_path = input_path.parent / f"{input_path.stem}_predictions{input_path.suffix}"

        df.to_csv(output_csv_path, index=False)

        if verbose:
            print(f"\n{'='*60}")
            print("SUMMARY")
            print(f"{'='*60}")
            print(f"✅ Successful predictions: {successful}/{len(df)}")
            if failed > 0:
                print(f"❌ Failed predictions: {failed}/{len(df)}")
                print("\nErrors:")
                for error in errors:
                    print(f"  • {error}")
            print(f"\n💾 Output saved to: {output_csv_path}")
            print(f"{'='*60}\n")

        return df
