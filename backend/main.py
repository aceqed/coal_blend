import os
from fastapi import FastAPI, Depends, HTTPException, status, Response, BackgroundTasks, UploadFile, File, Form
from dotenv import load_dotenv
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.ext.declarative import declarative_base
from pydantic import BaseModel, EmailStr
from datetime import timedelta, datetime
from fastapi.security import OAuth2PasswordRequestForm
from fastapi.middleware.cors import CORSMiddleware
import logging
from typing import List, Dict, Optional
import joblib
import numpy as np
import pandas as pd
import asyncio
import traceback
import PyPDF2
from typing import Dict, Any
import io
from pathlib import Path
import fitz  # PyMuPDF
import re
from bs4 import BeautifulSoup
import models
import schemas
import auth
from database import engine, get_db
from inference_engine import CoalBlendInferenceEngine
import json 
import types
import httpx
import re

def normalize_coal_name(name):
    """Normalize coal name for matching - same logic as genetic_algorithm.py"""
    s = str(name).lower().strip()
    s = re.sub(r"[^a-z0-9]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()
# Import the new GA components
from genetic_algorithm import FastCoalPredictor, VectorizedGA

# Legacy predictor for single prediction endpoint (optional)
try:
    from reco.CoalBlendPredictor import CoalBlendPredictor
    coal_blend_predictor = CoalBlendPredictor()
except ImportError:
    logging.warning("Legacy CoalBlendPredictor not found. /predict endpoint might fail.")
    coal_blend_predictor = None

load_dotenv()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Database setup
DATABASE_URL = os.getenv("DATABASE_URL")
engine = create_engine(DATABASE_URL)
Base = declarative_base()
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Dependency for database session
def get_db():
    db = SessionLocal()
    try:
        yield db;
    finally:
        db.close()

# FastAPI app
app = FastAPI(title="User Authentication API")

# Add CORS middleware with specific settings
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:3000","http://35.225.143.100"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    expose_headers=["Set-Cookie"]
)

# Login request model
class LoginRequest(BaseModel):
    email: EmailStr
    password: str

# Load the prediction models
def load_models():
    models_dir = os.path.join(os.path.dirname(__file__), "Models")
    try:
        model_path = os.path.join(models_dir, "multioutput_rf_model.pkl")
        if os.path.exists(model_path):
            with open(model_path, "rb") as f:
                model = joblib.load(f)
            return model
        return None
    except Exception as e:
        logger.error(f"Error loading model: {str(e)}")
        return None

# Load model at startup
prediction_model = load_models()

# Initialize inference engine
def load_inference_engine():
    models_dir = os.path.join(os.path.dirname(__file__), "Models")
    try:
        inference_engine = CoalBlendInferenceEngine(models_dir)
        return inference_engine
    except Exception as e:
        logger.error(f"Error loading inference engine: {str(e)}")
        return None

# Load inference engine at startup
inference_engine = load_inference_engine()

# Add a global dictionary to track running simulations
running_simulations = {}

# --- Gemini Config ---
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
GEMINI_MODEL = "gemini-2.0-flash"
GEMINI_ENDPOINT = f"https://generativelanguage.googleapis.com/v1beta/models/{GEMINI_MODEL}:generateContent"

# --- HELPER FUNCTIONS (Globally Defined) ---

def calculate_emissions(fc, ash, vm, s, n, cri, csr):
    """Calculates emission metrics based on coal properties."""
    emissions = {}

    # CO2
    emissions["CO2_Emissions"] = 0.7 * (fc / 100) * (44.01 / 12.01) * 10
    # CO
    emissions["CO_Emissions"] = 0.3 * (fc / 100) * (28.01 / 12.01) * 10
    # SO2
    emissions["SO2_Emissions"] = (s / 100) * (64.07 / 32.06) * 10
    # NO
    emissions["NO_Emissions"] = 0.2 * (n / 100) * (30.01 / 14.01) * 10
    # NO2
    emissions["NO2_Emissions"] = 0.2 * (n / 100) * (46.01 / 14.01) * 10

    # PM Index
    pm_index = 0.4 * (ash / 9) + 0.3 * (cri / 28) + 0.3 * (1 - csr / 65)
    emissions["PM_Index"] = pm_index
    emissions["PM10_Emissions"] = 0.7 * pm_index
    emissions["PM25_Emissions"] = 0.3 * pm_index

    # VOC Index
    voc_index = 0.5 * (vm / 2.5) + 0.2 * (cri / 28) + 0.2 * (1 - csr / 65) + 0.1 * (n / 1.0)
    emissions["VOC_Index"] = voc_index
    emissions["VOC_Emissions"] = 0.9 * voc_index
    emissions["PAH_Emissions"] = 0.1 * voc_index

    return emissions

# Helper: Extract Number
def extract_number(pattern, text):
    import re
    import math
    match = re.search(fr'{pattern}\s*[:=]?\s*([\d.]+)', text, re.IGNORECASE)
    if not match: return None
    try:
        value = float(match.group(1))
        return round(value, 6) if math.isfinite(value) else None
    except (ValueError, TypeError):
        return None

def parse_coal_properties(text: str) -> dict:
    """Helper function to parse coal properties from text."""
    result = {
        "IM": extract_number(r'(?:Inherent\s+Moisture|IM)', text),
        "Ash": extract_number(r'Ash', text),
        "VM": extract_number(r'(?:Volatile\s+Matter|VM)', text),
        "FC": extract_number(r'(?:Fixed\s+Carbon|FC)', text),
        "S": extract_number(r'(?:Sulphur|Sulfur|S)', text),
        "P": extract_number(r'(?:Phosphorus|P)', text),
        "SiO2": extract_number(r'SiO2', text),
        "Al2O3": extract_number(r'Al2O3', text),
        "Fe2O3": extract_number(r'Fe2O3', text),
        "CaO": extract_number(r'CaO', text),
        "MgO": extract_number(r'MgO', text),
        "Na2O": extract_number(r'Na2O', text),
        "K2O": extract_number(r'K2O', text),
        "TiO2": extract_number(r'TiO2', text),
        "Mn3O4": extract_number(r'Mn3O4', text),
        "SO3": extract_number(r'SO3', text),
        "P2O5": extract_number(r'P2O5', text),
        "BaO": extract_number(r'BaO', text),
        "SrO": extract_number(r'SrO', text),
        "ZnO": extract_number(r'ZnO', text),
        "CRI": extract_number(r'CRI', text),
        "CSR": extract_number(r'CSR', text),
        "N": extract_number(r'(?:Nitrogen|N)', text),
        "HGI": extract_number(r'HGI', text),
        "Vitrinite": extract_number(r'Vitrinite', text),
        "Liptinite": extract_number(r'Liptinite', text),
        "Semi_Fusinite": extract_number(r'Semi_Fusinite', text),
        "CSN_FSI": extract_number(r'CSN_FSI', text),
        "Initial_Softening_Temp": extract_number(r'Initial_Softening_Temp', text),
        "MBI": extract_number(r'MBI', text),
        "CBI": extract_number(r'CBI', text),
        "Log_Max_Fluidity": extract_number(r'Log_Max_Fluidity', text),
        "C": extract_number(r'C', text),
        "H": extract_number(r'H', text),
        "O": extract_number(r'O', text),
        "ss": extract_number(r'ss', text),
        "V7": extract_number(r'V7', text),
        "V8": extract_number(r'V8', text),
        "V9": extract_number(r'V9', text),
        "V10": extract_number(r'V10', text),
        "V11": extract_number(r'V11', text),
        "V12": extract_number(r'V12', text),
        "V13": extract_number(r'V13', text),
        "V14": extract_number(r'V14', text),
        "V15": extract_number(r'V15', text),
        "V16": extract_number(r'V16', text),
        "V17": extract_number(r'V17', text),
        "V18": extract_number(r'V18', text),
        "V19": extract_number(r'V19', text),
        "Inertinite": extract_number(r'Inertinite', text),
        "Minerals": extract_number(r'Minerals', text),
        "Max_Fluidity_ddpm": extract_number(r'Max_Fluidity_ddpm', text),
    }
    return {k: v for k, v in result.items() if v is not None}

# Auth Routes
@app.post("/register")
def register_user(user: schemas.UserCreate, response: Response, db: Session = Depends(get_db)):
    logger.info(f"Registering user with email: {user.email}")
    db_user = db.query(models.User).filter(models.User.email == user.email).first()
    if db_user:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email already registered")
    
    hashed_password = auth.get_password_hash(user.password)
    db_user = models.User(email=user.email, name=user.name, hashed_password=hashed_password)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)

    access_token_expires = timedelta(minutes=auth.ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = auth.create_access_token(data={"sub": db_user.email}, expires_delta=access_token_expires)

    response.set_cookie(key="auth_token", value=access_token, httponly=True, secure=False, samesite="lax", max_age=auth.ACCESS_TOKEN_EXPIRE_MINUTES * 60, path="/")

    return {"message": "Registration successful", "user": {"id": db_user.id, "email": db_user.email, "name": db_user.name}, "access_token": access_token, "token_type": "bearer"}

@app.post("/login")
async def login(login_data: LoginRequest, response: Response, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.email == login_data.email).first()
    if not user or not auth.verify_password(login_data.password, user.hashed_password):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Incorrect email or password")
      
    access_token_expires = timedelta(minutes=auth.ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = auth.create_access_token(data={"sub": user.email}, expires_delta=access_token_expires)

    response.set_cookie(key="auth_token", value=access_token, httponly=True, secure=False, samesite="lax", max_age=auth.ACCESS_TOKEN_EXPIRE_MINUTES * 60, path="/")

    return {"message": "Login successful", "user": {"id": user.id, "email": user.email, "name": user.name}, "access_token": access_token, "token_type": "bearer"}

@app.post("/logout")
async def logout(response: Response):
    response.delete_cookie(key="auth_token", httponly=True, samesite="lax", secure=True)
    return {"message": "Successfully logged out"}

@app.get("/users/me", response_model=schemas.User)
async def read_users_me(current_user: models.User = Depends(auth.get_current_user)):
    return current_user

# Prediction Route (Single Blend)
@app.post("/predict")
async def predict_blend(prediction_input: schemas.PredictionInput, db: Session = Depends(get_db)):
    if not inference_engine or not coal_blend_predictor:
        raise HTTPException(status_code=500, detail="Inference engines not initialized")

    total_percentage = sum(blend.percentage for blend in prediction_input.blends)
    if abs(total_percentage - 100) > 0.01:
        raise HTTPException(status_code=400, detail="Total percentage must equal 100%")

    coal_properties = {}
    for blend in prediction_input.blends:
        coal = db.query(models.CoalProperties).filter(models.CoalProperties.coal_name == blend.coal_name).first()
        if not coal:
            raise HTTPException(status_code=404, detail=f"Coal properties not found for: {blend.coal_name}")
        coal_properties[blend.coal_name] = coal

    blend_ratios = [{"coal_name": blend.coal_name, "percentage": blend.percentage} for blend in prediction_input.blends]
    
    # Run inferences
    inference_results = inference_engine.run_inference(coal_properties, blend_ratios)
    input_data = {blend.coal_name: blend.percentage for blend in prediction_input.blends}
    coke_prediction = coal_blend_predictor.predict(input_data)

    enhanced_blend_properties = inference_results["final_features"]
    
    predicted_coal_properties = {
        "ASH": enhanced_blend_properties.get("ASH", 0.0)/100,
        "VM": enhanced_blend_properties.get("VM", 0.0)/100,
        "FC": enhanced_blend_properties.get("weighted_F.C")/100,
        "CSN": enhanced_blend_properties.get("weighted_CSN/FSI")/100,
        "N": (enhanced_blend_properties.get("weighted_N", 0.0)*100) * 0.1,
        "S": float(enhanced_blend_properties.get("weighted_S", 0.0)/ 100 )* 0.85,
        "P": float(enhanced_blend_properties.get("weighted_Phosphorus", 0.0) / 100) * 0.9,
        "C": float(enhanced_blend_properties.get("weighted_C",0.0)/100)
    }
    
    predicted_coke_properties = {
        "CRI": coke_prediction.get("predictions",{}).get("CRI", 0.0),
        "CSR": coke_prediction.get("predictions",{}).get("CSR", 0.0),
        "ASH": coke_prediction.get("predictions",{}).get("ASH", 0.0),
        "VM":  coke_prediction.get("predictions",{}).get("VM", 0.0),
    }
    
    return schemas.PredictionOutput(
        blend_properties=enhanced_blend_properties,
        predicted_coke_properties=predicted_coke_properties,
        predicted_coal_properties=predicted_coal_properties
    )

# Simulation Routes
@app.post("/simulation", response_model=schemas.SimulationResponse)
async def create_simulation(
    simulation: schemas.SimulationCreate,
    background_tasks: BackgroundTasks,
    db: Session = Depends(get_db),
    current_user: models.User = Depends(auth.get_current_user)
):
    try:
        db_simulation = models.Simulation(
            user_id=current_user.id,
            scenario_name=simulation.scenario_name,
            scenario_description=simulation.scenario_description,
            status="running",
            generated_date=datetime.now()
        )
        db.add(db_simulation)
        db.commit()
        db.refresh(db_simulation)

        coke_properties, blend_properties = [], []
        
        for prop in simulation.coke_properties:
            db_prop = models.SimulationProperties(
                simulation_id=db_simulation.id, property_type="coke",
                property_name=prop.property_name, min_value=prop.min_value, max_value=prop.max_value
            )
            db.add(db_prop)
            db.flush()
            coke_properties.append({
                "id": db_prop.id, "simulation_id": db_simulation.id, "property_type": "coke",
                "property_name": prop.property_name, "min_value": prop.min_value, "max_value": prop.max_value
            })

        for prop in simulation.blend_properties:
            db_prop = models.SimulationProperties(
                simulation_id=db_simulation.id, property_type="blend",
                property_name=prop.property_name, min_value=prop.min_value, max_value=prop.max_value
            )
            db.add(db_prop)
            db.flush()
            blend_properties.append({
                "id": db_prop.id, "simulation_id": db_simulation.id, "property_type": "blend",
                "property_name": prop.property_name, "min_value": prop.min_value, "max_value": prop.max_value
            })

        db.commit()
        
        response_data = {
            "id": db_simulation.id, "user_id": db_simulation.user_id,
            "scenario_name": db_simulation.scenario_name, "scenario_description": db_simulation.scenario_description,
            "status": db_simulation.status, "generated_date": db_simulation.generated_date,
            "coke_properties": coke_properties, "blend_properties": blend_properties,
            "recommendations": []
        }
        return response_data

    except Exception as e:
        logger.error(f"Error creating simulation: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Error creating simulation: {str(e)}")

@app.post("/simulation/{simulation_id}/stop")
async def stop_simulation(simulation_id: int, db: Session = Depends(get_db), current_user: models.User = Depends(auth.get_current_user)):
    try:
        db_simulation = db.query(models.Simulation).filter(models.Simulation.id == simulation_id).first()
        if not db_simulation or db_simulation.user_id != current_user.id:
            raise HTTPException(status_code=404, detail="Simulation not found or unauthorized")
            
        if simulation_id in running_simulations:
            running_simulations[simulation_id]["stop_requested"] = True
            
        db_simulation.status = "failed"
        db_simulation.error_message = "Simulation stopped by user"
        db.commit()
        running_simulations.pop(simulation_id, None)
        return {"message": "Stop request received", "status": "failed"}
    except Exception as e:
        logger.error(f"Error stopping simulation: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

async def run_optimization(simulation_id: int, simulation_data: dict, db: Session):
    try:
        logger.info(f"Starting Vectorized GA optimization for simulation {simulation_id}")
        running_simulations[simulation_id] = {"stop_requested": False, "start_time": datetime.now()}
        
        db_simulation = db.query(models.Simulation).filter_by(id=simulation_id).first()
        if not db_simulation: return
        db_simulation.status = "running"
        db.commit()

        # 1. Prepare Constraints and Targets from Simulation Data
        targets = {
            "CRI": {"min": 22, "max": 28, "weight": 1000},
            "CSR": {"min": 65, "max": 100, "weight": 1500},
            "ASH": {"min": 0, "max": 13.5, "weight": 1200}
        }
        
        for prop in simulation_data.get('coke_properties', []):
            name = prop['property_name'].upper()
            if name in targets:
                targets[name]['min'] = float(prop['min_value'])
                targets[name]['max'] = float(prop['max_value'])

        # 2. Get Coal Data from DB and format for FastCoalPredictor
        coal_data = db.query(models.CoalProperties).all()
        if not coal_data: raise ValueError("No coal data found in database")

        formatted_coals = []
        for coal in coal_data:
            row = {
                'Name_of_coal': coal.coal_name,
                'Coal Category': coal.coal_category,
                'Cost': coal.cost if hasattr(coal, 'cost') and coal.cost is not None else 99999.0,
                
                # These keys MUST match the values in FastCoalPredictor.COLUMN_MAPPING
                'CRI_weight': coal.CRI,
                'CSR_weight': coal.CSR,
                'Ash': coal.Ash,
                'VM_weight': coal.VM,
                'S': coal.S,
                'P': coal.P,
                'SiO2': coal.SiO2,
                'Fe2O3': coal.Fe2O3,
                'CaO': coal.CaO,
                'MgO': coal.MgO,
                'Na2O': coal.Na2O,
                'K2O': coal.K2O,
                'TiO2': coal.TiO2,
                'P2O5': coal.P2O5,
                'Mn3O4': coal.Mn3O4,
                'Inertinite': coal.Inertinite,
                'Minerals': coal.Minerals,
                'MaxFluidity': coal.MaxFluidity # Mapped to Fluidity
            }
            # Fill None with 0.0
            for k, v in row.items():
                if v is None and k not in ['Name_of_coal', 'Coal Category']:
                    row[k] = 0.0
            formatted_coals.append(row)
        
        coal_df = pd.DataFrame(formatted_coals)
        
        # 3. Initialize FastCoalPredictor with DataFrame
        models_dir = os.path.join(os.path.dirname(__file__), "reco")
        
        try:
            # Pass DataFrame directly
            predictor = FastCoalPredictor(coal_df=coal_df, models_dir=models_dir)
            
            # 4. Inject Dynamic Cost Function
            def dynamic_cost_function(self, costs, preds):
                penalty = np.zeros_like(costs)
                if "CRI" in preds:
                    penalty += np.maximum(0, targets['CRI']['min'] - preds["CRI"]) * targets['CRI']['weight']
                    penalty += np.maximum(0, preds["CRI"] - targets['CRI']['max']) * targets['CRI']['weight']
                if "CSR" in preds:
                    penalty += np.maximum(0, targets['CSR']['min'] - preds["CSR"]) * targets['CSR']['weight']
                if "ASH" in preds:
                    penalty += np.maximum(0, preds["ASH"] - targets['ASH']['max']) * targets['ASH']['weight']
                return  penalty #+ costs

            # Bind the new method to the instance
            predictor._vectorized_cost_function = types.MethodType(dynamic_cost_function, predictor)

            # 5. Initialize and Run VectorizedGA
            ga = VectorizedGA(predictor, population_size=500, generations=100)
            
            # Map simulation 'blend' constraints (Category constraints)
            for prop in simulation_data.get('blend_properties', []):
                cat_name = prop['property_name'].upper() # e.g., 'HCC', 'PCI'
                if cat_name in ga.cat_constraints:
                    ga.cat_constraints[cat_name]['min'] = float(prop['min_value'])
                    ga.cat_constraints[cat_name]['max'] = float(prop['max_value'])

            # Evolve
            best_blend, best_score = ga.evolve()
            
            # 6. Extract Results
            top_blends = ga.get_top_blends(n=6)
            
            # 7. Store Recommendations in DB
            for b in top_blends:
                # Prepare composition dictionary (Coal Name -> Percentage)
                composition = b['composition'] 
                
                # Check if predictions contain weighted props/emissions
                preds = b['predictions']
                
                # Fallback calculation if weighted props missing from prediction dict
                if 'weighted_FC' not in preds:
                    w_props = {k: 0.0 for k in ['FC', 'Ash', 'VM', 'S', 'N', 'CRI', 'CSR']}
                    for c_name, pct in composition.items():
                        c_props = next((c for c in coal_data if c.coal_name.lower() == c_name.lower()), None)
                        if c_props:
                            w_props['FC'] += (c_props.FC or 0) * (pct/100)
                            w_props['Ash'] += (c_props.Ash or 0) * (pct/100)
                            w_props['VM'] += (c_props.VM or 0) * (pct/100)
                            w_props['S'] += (c_props.S or 0) * (pct/100)
                            w_props['N'] += (c_props.N or 0) * (pct/100)
                            w_props['CRI'] += (c_props.CRI or 0) * (pct/100)
                            w_props['CSR'] += (c_props.CSR or 0) * (pct/100)
                    
                    # Uses the global calculate_emissions function defined earlier
                    emissions = calculate_emissions(
                        w_props['FC'], w_props['Ash'], w_props['VM'], 
                        w_props['S'], w_props['N'], w_props['CRI'], w_props['CSR']
                    )
                    print("EMISSIONS",emissions)
                else:
                    # Use returned emissions if available in predictions dict
                    emissions = {k: preds.get(k, 0.0) for k in [
                        "CO2_Emissions", "CO_Emissions", "SO2_Emissions", "NO_Emissions", "NO2_Emissions",
                        "PM_Index", "PM10_Emissions", "PM25_Emissions", "VOC_Index", "VOC_Emissions", "PAH_Emissions"
                    ]}
                    print("EMISSIONS",emissions)

                rec = models.SimulationCoalRecommendations(
                    simulation_id=simulation_id,
                    coal_percentages=composition,
                    total_cost=b['cost'],
                    
                    # Model Predictions
                    predicted_cri=preds.get('CRI', 0),
                    predicted_csr=preds.get('CSR', 0),
                    predicted_ash=preds.get('ASH', 0),
                    predicted_vm=preds.get('VM', 0),
                    
                    # Store 0 for others not predicted by this specific model
                    predicted_fc=preds.get('weighted_FC', 0),
                    predicted_csn=0, 
                    predicted_ash_final=preds.get('ASH', 0),
                    predicted_vm_final=preds.get('VM', 0),
                    
                    # Emissions
                    CO2_Emissions=emissions.get("CO2_Emissions", 0),
                    CO_Emissions=emissions.get("CO_Emissions", 0),
                    SO2_Emissions=emissions.get("SO2_Emissions", 0),
                    NO_Emissions=emissions.get("NO_Emissions", 0),
                    NO2_Emissions=emissions.get("NO2_Emissions", 0),
                    PM_index=emissions.get("PM_Index", 0),
                    PM10_Emissions=emissions.get("PM10_Emissions", 0),
                    PM25_Emissions=emissions.get("PM25_Emissions", 0),
                    VOC_index=emissions.get("VOC_Index", 0),
                    VOC_Emissions=emissions.get("VOC_Emissions", 0),
                    PAH_Emissions=emissions.get("PAH_Emissions", 0)
                )
                db.add(rec)

            db_simulation.status = "completed"
            db.commit()
            
        except Exception as inner_e:
            logger.error(f"Error during FastCoalPredictor setup: {inner_e}")
            raise inner_e
            
    except Exception as e:
        logger.error(f"Error in optimization process: {str(e)}")
        logger.error(traceback.format_exc())
        db_simulation = db.query(models.Simulation).filter_by(id=simulation_id).first()
        if db_simulation:
            db_simulation.status = "failed"
            db_simulation.error_message = str(e)
            db.commit()
    finally:
        running_simulations.pop(simulation_id, None)

@app.post("/simulation/{simulation_id}/start")
async def start_optimization(simulation_id: int, simulation_data: dict, db: Session = Depends(get_db)):
    try:
        asyncio.create_task(run_optimization(simulation_id, simulation_data, db))
        return {"message": "Optimization started"}
    except Exception as e:
        logger.error(f"Error starting optimization: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/simulations", response_model=List[schemas.SimulationResponse])
async def get_simulations(db: Session = Depends(get_db), current_user: models.User = Depends(auth.get_current_user)):
    try:
        simulations = db.query(models.Simulation).filter(models.Simulation.user_id == current_user.id).order_by(models.Simulation.generated_date.desc()).all()
        all_coals = db.query(models.CoalProperties.coal_name, models.CoalProperties.coal_category).all()
        coal_category_map = {normalize_coal_name(c.coal_name): c.coal_category for c in all_coals}
        result = []
        for simulation in simulations:
            coke_props = db.query(models.SimulationProperties).filter(models.SimulationProperties.simulation_id == simulation.id, models.SimulationProperties.property_type == "coke").all()
            blend_props = db.query(models.SimulationProperties).filter(models.SimulationProperties.simulation_id == simulation.id, models.SimulationProperties.property_type == "blend").all()
            recs = db.query(models.SimulationCoalRecommendations).filter(models.SimulationCoalRecommendations.simulation_id == simulation.id).all()
            
            processed_recs = []
            for rec in recs:
                if not rec.coal_percentages: continue
                for coal, pct in rec.coal_percentages.items():
                    if pct > 0:
                        if (coal_category_map.get(normalize_coal_name(coal), "Unknown") == "Unknown"):
                            print(coal)
                        processed_recs.append({
                            "id": rec.id, "simulation_id": rec.simulation_id, "coal_name": coal, "percentage": pct,
                            "coal_category": coal_category_map.get(normalize_coal_name(coal), "Unknown"),
                            "predicted_ash": rec.predicted_ash, "predicted_vm": rec.predicted_vm, "predicted_fc": rec.predicted_fc,
                            "predicted_cri": rec.predicted_cri, "predicted_csr": rec.predicted_csr, "total_cost": rec.total_cost,
                            "predicted_csn": rec.predicted_csn, "predicted_ash_final": rec.predicted_ash_final, "predicted_vm_final": rec.predicted_vm_final,
                            "created_at": rec.created_at if hasattr(rec, 'created_at') else None,
                            "updated_at": rec.updated_at if hasattr(rec, 'updated_at') else None
                        })
            
            result.append({
                "id": simulation.id, "scenario_name": simulation.scenario_name, "scenario_description": simulation.scenario_description,
                "generated_date": simulation.generated_date, "status": simulation.status, "user_id": simulation.user_id,
                "coke_properties": coke_props, "blend_properties": blend_props, "recommendations": processed_recs
            })
        return result
    except Exception as e:
        logger.error(f"Error fetching simulations: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/simulation/{simulation_id}", response_model=schemas.SimulationResponse)
async def get_simulation(simulation_id: int, db: Session = Depends(get_db), current_user: models.User = Depends(auth.get_current_user)):
    try:
        simulation = db.query(models.Simulation).filter(models.Simulation.id == simulation_id, models.Simulation.user_id == current_user.id).first()
        if not simulation: raise HTTPException(status_code=404, detail="Simulation not found")
        
        coke_props = db.query(models.SimulationProperties).filter(models.SimulationProperties.simulation_id == simulation.id, models.SimulationProperties.property_type == "coke").all()
        blend_props = db.query(models.SimulationProperties).filter(models.SimulationProperties.simulation_id == simulation.id, models.SimulationProperties.property_type == "blend").all()
        recs = db.query(models.SimulationCoalRecommendations).filter(models.SimulationCoalRecommendations.simulation_id == simulation.id).all()
                # Fetch all coal categories once for efficient mapping
        all_coals = db.query(models.CoalProperties.coal_name, models.CoalProperties.coal_category).all()
        coal_category_map = {normalize_coal_name(c.coal_name): c.coal_category for c in all_coals}
        processed_recs = []
        for rec in recs:
            if not rec.coal_percentages: continue
            for coal, pct in rec.coal_percentages.items():
                if pct > 0:
                    processed_recs.append({
                        "id": rec.id, "simulation_id": rec.simulation_id, "coal_name": coal.lower(), "percentage": pct,
                        "coal_category": coal_category_map.get(normalize_coal_name(coal), "Unknown"),
                        "predicted_ash": rec.predicted_ash, "predicted_vm": rec.predicted_vm, "predicted_fc": rec.predicted_fc,
                        "predicted_cri": rec.predicted_cri, "predicted_csr": rec.predicted_csr, "total_cost": rec.total_cost,
                        "predicted_csn": rec.predicted_csn, "predicted_ash_final": rec.predicted_ash_final, "predicted_vm_final": rec.predicted_vm_final,
                        "created_at": rec.created_at if hasattr(rec, 'created_at') else None,
                        "updated_at": rec.updated_at if hasattr(rec, 'updated_at') else None
                    })
                    
        return {
            "id": simulation.id, "scenario_name": simulation.scenario_name, "scenario_description": simulation.scenario_description,
            "generated_date": simulation.generated_date, "status": simulation.status, "user_id": simulation.user_id,
            "coke_properties": coke_props, "blend_properties": blend_props, "recommendations": processed_recs
        }
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Error fetching simulation: {str(e)}")
        logger.error(traceback.format_exc())
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/simulations/batch")
async def get_simulations_batch(
    simulation_ids: str,  # Comma-separated list of simulation IDs
    db: Session = Depends(get_db),
    current_user: models.User = Depends(auth.get_current_user)
):
    """
    Get status of multiple simulations in a single request
    """
    try:
        # Parse the comma-separated list of IDs
        ids = [int(id_str) for id_str in simulation_ids.split(",") if id_str.strip().isdigit()]
        
        if not ids:
            return []
            
        # Query all requested simulations that belong to the current user
        simulations = (
            db.query(models.Simulation)
            .filter(
                models.Simulation.id.in_(ids),
                models.Simulation.user_id == current_user.id
            )
            .all()
        )
        
        # Format the response
        result = []
        for sim in simulations:
            # Get the latest status update
            latest_update = (
                db.query(models.SimulationUpdate)
                .filter(models.SimulationUpdate.simulation_id == sim.id)
                .order_by(models.SimulationUpdate.timestamp.desc())
                .first()
            )
            
            # Prepare the simulation data
            sim_data = {
                "id": sim.id,
                "name": sim.scenario_name,
                "description": sim.scenario_description,
                "status": latest_update.status if latest_update else sim.status,
                "created_at": sim.generated_date.isoformat(),
                "updated_at": sim.generated_date.isoformat(),  # Using generated_date as updated_at for now
                "progress": latest_update.progress if latest_update else 0,
                "message": latest_update.message if latest_update else ""
            }
            
            # Add recommendations if available
            if sim.status == "completed" and sim.recommendations:
                sim_data["has_recommendations"] = True
                
            result.append(sim_data)
            
        return result
        
    except Exception as e:
        logger.error(f"Error in get_simulations_batch: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

# Vendor Coal Routes
def extract_html_from_pdf(pdf_path: Path) -> str:
    """Extract HTML-formatted text from all pages of a PDF (without <img> tags)."""
    html_content = ""
    with fitz.open(pdf_path) as doc:
        for page_num, page in enumerate(doc, start=1):
            page_html = page.get_text("html")
            soup = BeautifulSoup(page_html, "html.parser")
            for img_tag in soup.find_all("img"):
                img_tag.decompose()
            html_content += f"<!-- Page {page_num} -->\n{str(soup)}\n\n"
    return html_content

def extract_json_with_gemini(text: str, json_schema: dict) -> str:
    system_prompt = f"""
        You are a precise data extraction assistant.
        Extract all values from the provided PDF text according to the following JSON schema:
        {json_schema}
        Fill missing values with null.
        Only output valid JSON, no extra text, and no markdown formatting.
        Strictly follow the schema.
    """

    payload = {
        "contents": [
            {
                "parts": [
                    {"text": system_prompt},
                    {"text": "Please read the following:\n" + text}
                ]
            }
        ],
        "generationConfig": {
            "maxOutputTokens": 8192
        }
    }

    headers = {
        "Content-Type": "application/json",
        "X-goog-api-key": GEMINI_API_KEY
    }

    with httpx.Client(timeout=120.0) as client:
        resp = client.post(GEMINI_ENDPOINT, headers=headers, json=payload)
        resp.raise_for_status()
        result = resp.json()

    raw_output = result["candidates"][0]["content"]["parts"][0]["text"]
    cleaned_output = re.sub(r"<think>.*?</think>", "", raw_output, flags=re.DOTALL)
    cleaned_output = re.sub(r"```json\s*", "", cleaned_output)
    cleaned_output = re.sub(r"```", "", cleaned_output)

    return cleaned_output.strip()

@app.post("/api/coal/upload", response_model=schemas.CoalPDFUploadResponse)
async def upload_coal_pdf(
    file: UploadFile = File(...),
    db: Session = Depends(get_db),
    current_user: models.User = Depends(auth.get_current_user)
):
    if not file.filename.lower().endswith('.pdf'):
        return {
            "success": False,
            "message": "Invalid file type",
            "error": "Only PDF files are allowed"
        }

    temp_pdf = Path("temp") / file.filename
    temp_pdf.parent.mkdir(exist_ok=True)
    with open(temp_pdf, "wb") as f:
        f.write(await file.read())

    raw_text = extract_html_from_pdf(temp_pdf)
    json_str = extract_json_with_gemini(raw_text, schemas.VendorCoalDataSchema.model_json_schema())

    try:
        parsed = json.loads(json_str)
        validated = schemas.VendorCoalDataSchema(**parsed)
        vendor_coal = models.VendorCoalData(**validated.dict(), is_approved=False)
        db.add(vendor_coal)
        db.commit()
        db.refresh(vendor_coal)

        return {
            "success": True,
            "message": "Coal PDF processed and stored successfully",
            "coal_data": validated.model_dump()
        }

    except json.JSONDecodeError:
        return {
            "success": False,
            "message": "Failed to parse JSON",
            "error": json_str
        }
    except Exception as e:
        return {
            "success": False,
            "message": "Validation/DB insert failed",
            "error": str(e)
        }

@app.get("/api/vendor_coals")
def list_vendor_coals(db: Session = Depends(get_db), current_user: models.User = Depends(auth.get_current_user)):
    coals = db.query(models.VendorCoalData).all()
    return {"success": True, "data": [coal.__dict__ for coal in coals]}

@app.post("/api/vendor_coals/{coal_id}/approve")
def approve_vendor_coal(coal_id: int, db: Session = Depends(get_db), current_user: models.User = Depends(auth.get_current_user)):
    vendor_coal = db.query(models.VendorCoalData).filter_by(id=coal_id).first()
    if not vendor_coal or vendor_coal.is_approved: return {"success": False, "message": "Invalid request"}
    
    vendor_coal.is_approved = True
    db.add(vendor_coal)
    
    master_coal = models.CoalProperties(
        coal_name=vendor_coal.coal_name, IM=vendor_coal.IM, Ash=vendor_coal.Ash, VM=vendor_coal.VM, FC=vendor_coal.FC,
        S=vendor_coal.S, P=vendor_coal.P, SiO2=vendor_coal.SiO2, Al2O3=vendor_coal.Al2O3, Fe2O3=vendor_coal.Fe2O3,
        CaO=vendor_coal.CaO, MgO=vendor_coal.MgO, Na2O=vendor_coal.Na2O, K2O=vendor_coal.K2O, TiO2=vendor_coal.TiO2,
        Mn3O4=vendor_coal.Mn3O4, SO3=vendor_coal.SO3, P2O5=vendor_coal.P2O5, BaO=vendor_coal.BaO, SrO=vendor_coal.SrO,
        ZnO=vendor_coal.ZnO, CRI=vendor_coal.CRI, CSR=vendor_coal.CSR, N=vendor_coal.N, HGI=vendor_coal.HGI,
        Vitrinite=vendor_coal.Vitrinite, Liptinite=vendor_coal.Liptinite, Semi_Fusinite=vendor_coal.Semi_Fusinite,
        CSN_FSI=vendor_coal.CSN_FSI, Initial_Softening_Temp=vendor_coal.Initial_Softening_Temp, MBI=vendor_coal.MBI,
        CBI=vendor_coal.CBI, Log_Max_Fluidity=vendor_coal.Log_Max_Fluidity, coal_category=vendor_coal.coal_category,
        C=vendor_coal.C, H=vendor_coal.H, O=vendor_coal.O, V7=vendor_coal.V7, V8=vendor_coal.V8, V9=vendor_coal.V9,
        V10=vendor_coal.V10, V11=vendor_coal.V11, V12=vendor_coal.V12, V13=vendor_coal.V13, V14=vendor_coal.V14,
        V15=vendor_coal.V15, V16=vendor_coal.V16, V17=vendor_coal.V17, V18=vendor_coal.V18, V19=vendor_coal.V19,
        Inertinite=vendor_coal.Inertinite, Minerals=vendor_coal.Minerals, MaxFluidity=vendor_coal.MaxFluidity
    )
    db.add(master_coal)
    db.commit()
    return {"success": True, "message": "Coal approved", "data": vendor_coal.__dict__}
@app.patch("/api/vendor_coals/{coal_id}")
def update_vendor_coal(
    coal_id: int,
    payload: schemas.VendorCoalUpdate,
    db: Session = Depends(get_db),
    current_user: models.User = Depends(auth.get_current_user)
):
    # fetch vendor coal
    vendor_coal = db.query(models.VendorCoalData).filter_by(id=coal_id).first()
    if not vendor_coal:
        raise HTTPException(status_code=404, detail="Coal not found")

    if vendor_coal.is_approved:
        raise HTTPException(status_code=400, detail="Approved coals cannot be modified")

    # apply updates dynamically
    update_data = payload.dict(exclude_unset=True)
    for key, value in update_data.items():
        setattr(vendor_coal, key, value)

    db.add(vendor_coal)
    db.commit()
    db.refresh(vendor_coal)

    return {
        "success": True,
        "message": f"Coal {vendor_coal.id} updated successfully",
        "data": vendor_coal.__dict__
    } 

@app.post("/api/vendor-coal/manual", response_model=schemas.VendorCoalDataCreate)
def create_vendor_coal_manual(
    coal_data: schemas.VendorCoalDataCreate,
    db: Session = Depends(get_db)
):
    db_coal = models.VendorCoalData(**coal_data.dict())
    db.add(db_coal)
    db.commit()
    db.refresh(db_coal)
    return db_coal
    
if __name__ == "__main__":
    import uvicorn
    logger.info("Starting server...")
    uvicorn.run(app, host="localhost", port=8000, log_level="info")