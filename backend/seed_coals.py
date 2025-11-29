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
    
    print("Reading CSV file...")
    try:
        df = pd.read_csv("Clean_exist_coals.csv")
    except FileNotFoundError:
        print("Error: Clean_exist_coals.csv not found.")
        return

    # Clean column names (strip whitespace)
    df.columns = df.columns.str.strip()
    
    # Replace NaN with None (or 0.0 for floats if preferred, but SQLAlchemy handles None as NULL)
    # For this model, most fields are Floats. Let's replace NaN with 0.0 for safety in calculations, 
    # or None if we want to allow NULLs. The model definition doesn't specify nullable=False for most, 
    # but calculations might fail with None. Let's use 0.0 for numeric fields.
    df = df.replace({np.nan: 0.0})

    coals = []
    for _, row in df.iterrows():
        coal = models.CoalProperties(
            coal_name=row.get('Name_of_coal'),
            coal_category=row.get('Coal Category'),
            Rank=row.get('Rank'),
            
            # Proximate Analysis
            IM=0.0, # Not in CSV?
            Ash=row.get('Ash', 0.0),
            VM=row.get('V.M.', 0.0),
            FC=row.get('F.C', 0.0),
            S=row.get('Total Sulphur', 0.0),
            P=row.get('Phosphorus', 0.0),
            
            # HGI
            HGI=row.get('HGI (ASTM)', 0.0),
            
            # Petrography
            Vitrinite=row.get('Vitrinite %', 0.0),
            Liptinite=row.get('Liptinite', 0.0),
            Semi_Fusinite=row.get('Semi-Fusinite', 0.0),
            Inertinite=row.get('Inertinite', 0.0),
            Minerals=row.get('Minerals', 0.0),
            
            # Reflectance
            V7=row.get('V7', 0.0),
            V8=row.get('V8', 0.0),
            V9=row.get('V9', 0.0),
            V10=row.get('V10', 0.0),
            V11=row.get('V11', 0.0),
            V12=row.get('V12', 0.0),
            V13=row.get('V13', 0.0),
            V14=row.get('V14', 0.0),
            V15=row.get('V15', 0.0),
            V16=row.get('V16', 0.0),
            V17=row.get('V17', 0.0),
            V18=row.get('V18', 0.0),
            V19=row.get('V19', 0.0),
            
            # Coking Properties
            CSN_FSI=row.get('CSN/FSI', 0.0),
            Initial_Softening_Temp=row.get('Initial Softening Temp.', 0.0),
            MaxFluidity=row.get('Max. Fluidity ddpm', 0.0),
            # Log_Max_Fluidity can be calculated if needed, or left 0
            Log_Max_Fluidity=np.log10(row.get('Max. Fluidity ddpm', 1.0)) if row.get('Max. Fluidity ddpm', 0.0) > 0 else 0.0,
            
            # Ash Analysis (Oxides)
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
            CRI=row.get('CRI', 0.0), # Note: CSV header might have space 'CRI '
            CSR=row.get('CSR', 0.0),
            
            # Ultimate Analysis
            C=row.get('C', 0.0),
            H=row.get('H', 0.0),
            N=row.get('N', 0.0),
            O=row.get('O', 0.0),
            
            # Other
            ss=0.0, # Not in CSV
            MBI=0.0, # Not in CSV
            CBI=0.0  # Not in CSV
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
