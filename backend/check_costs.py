import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import CoalProperties
from database import DATABASE_URL
from dotenv import load_dotenv

load_dotenv()

if not DATABASE_URL:
    print("DATABASE_URL not found in env")
    exit(1)

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
db = SessionLocal()

try:
    coals = db.query(CoalProperties).all()
    print(f"Found {len(coals)} coals.")
    coals_with_cost = [c for c in coals if c.cost is not None and c.cost > 0]
    print(f"Coals with cost > 0: {len(coals_with_cost)}")
    for c in coals_with_cost[:5]:
        print(f"  - {c.coal_name}: {c.cost}")
    
    if len(coals_with_cost) == 0:
        print("WARNING: No coals have cost data. Simulation costs will be 0.")
finally:
    db.close()
