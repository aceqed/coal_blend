import pandas as pd
import numpy as np
from sqlalchemy.orm import Session
from database import SessionLocal, engine
import models

def seed_coals():
    print("Recreating CoalProperties table...")
    
    # Drop and recreate the table
    models.CoalProperties.__table__.drop(engine, checkfirst=True)
    models.CoalProperties.__table__.create(engine)
    
    
    # Load Boiler Data (Primary Source)
    print("Reading boiler property data...")
    try:
        df = pd.read_csv("Boiler_effi_pred/coal_property_data.csv")
        df.columns = df.columns.str.strip()
        print(f"Loaded boiler data for {len(df)} coals. Using this as the primary source.")
    except Exception as e:
        print(f"Error: Boiler data not found or error: {e}")
        return

    # Load cost data
    print("Reading cost data...")
    try:
        cost_df = pd.read_csv("reco/coal_costs.csv")
        cost_df.columns = cost_df.columns.str.strip()
        cost_map = dict(zip(cost_df['Name_of_coal'].str.strip(), cost_df['Cost']))
        print(f"Loaded cost data for {len(cost_map)} coals")
    except Exception as e:
        print(f"Warning: Error reading cost data: {e}. Costs will be set to 0.0")
        cost_map = {}
    
    # Replace NaN with 0.0 for numeric fields
    df = df.replace({np.nan: 0.0})

    coals = []
    # Identify the column for Coal Name in the new CSV
    # Based on previous context it seems to be "Coal_Name"
    name_col = "Coal_Name" if "Coal_Name" in df.columns else "Name_of_coal"
    
    for _, row in df.iterrows():
        coal_name = row.get(name_col)
        coal_name_clean = str(coal_name).strip()
        
        # Get cost from cost_map
        coal_cost = cost_map.get(coal_name_clean, 0.0)
        
        # In the new logic, the row itself is the boiler data
        # We need to map the CSV columns to the model
        # Note: The boiler CSV likely has columns like 'TM', 'IM', 'Ash', 'VM', 'FC', 'GCV', 'GCV (ARB)'
        
        coal = models.CoalProperties(
            coal_name=coal_name_clean,
            coal_category=row.get('Coal Category', 'Thermal'), # Default if missing
            Rank=row.get('Rank', 0.0), # Assuming float
            cost=coal_cost,
            
            # Boiler Properties (Direct from this CSV)
            TM=row.get("TM", 0.0),
            GCV=row.get("GCV", 0.0),
            GCV_ARB=row.get("GCV (ARB)", 0.0),
            
            # Proximate Analysis
            IM=row.get("IM", 0.0), 
            Ash=row.get('Ash', 0.0), # Check case sensitivity if needed, usually 'Ash'
            VM=row.get('VM', 0.0),   # Usually 'VM' or 'V.M.' in boiler csv? Let's check typical keys
            FC=row.get('FC', 0.0),   # Usually 'FC' or 'F.C'
            S=row.get('S', 0.0),
            P=row.get('P', 0.0),     # Boiler csv might use 'P' or 'Phosphorus'
            
            # Additional fields (Might be missing in boiler CSV, default to 0.0)
            HGI=row.get('HGI', 0.0),
            
            # Petrography - likely missing or different columns
            Vitrinite=row.get('Vitrinite', 0.0),
            Liptinite=row.get('Liptinite', 0.0),
            Semi_Fusinite=row.get('Semi_Fusinite', 0.0),
            Inertinite=row.get('Inertinite', 0.0),
            Minerals=row.get('Minerals', 0.0),
            
            # Reflectance
            V7=0.0, V8=0.0, V9=0.0, V10=0.0, V11=0.0, V12=0.0, 
            V13=0.0, V14=0.0, V15=0.0, V16=0.0, V17=0.0, V18=0.0, V19=0.0,
            
            # Coking Properties
            CSN_FSI=row.get('CSN', 0.0), # Boiler CSV might have CSN
            Initial_Softening_Temp=0.0,
            MaxFluidity=0.0,
            Log_Max_Fluidity=0.0,
            
            # Ash Analysis (Oxides) - likely missing or different
            SiO2=row.get('SiO2', 0.0),
            Al2O3=row.get('Al2O3', 0.0),
            Fe2O3=row.get('Fe2O3', 0.0),
            CaO=row.get('CaO', 0.0),
            MgO=row.get('MgO', 0.0),
            Na2O=row.get('Na2O', 0.0),
            K2O=row.get('K2O', 0.0),
            TiO2=row.get('TiO2', 0.0),
            Mn3O4=row.get('Mn3O4', 0.0),
            SO3=row.get('SO3', 0.0),
            P2O5=row.get('P2O5', 0.0),
            BaO=row.get('BaO', 0.0),
            SrO=row.get('SrO', 0.0),
            ZnO=row.get('ZnO', 0.0),
            
            # Coke Quality
            CRI=0.0,
            CSR=0.0,
            
            # Ultimate Analysis (C, H, N, O, S)
            C=row.get('C', 0.0),
            H=row.get('H', 0.0),
            N=row.get('N', 0.0),
            O=row.get('O', 0.0),
            
            # Other
            ss=0.0, 
            MBI=0.0, 
            CBI=0.0  
        )
        coals.append(coal)
    
    db = SessionLocal()
    try:
        print(f"Inserting {len(coals)} records...")
        db.add_all(coals)
        db.commit()
        print("Successfully seeded CoalProperties table.")
    except Exception as e:
        print(f"Error seeding database: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    seed_coals()
