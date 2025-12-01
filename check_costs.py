from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from backend.models import CoalProperties
from backend.database import DATABASE_URL
import os
from dotenv import load_dotenv

load_dotenv(dotenv_path='backend/.env')

# Adjust DATABASE_URL if needed (e.g. if it's relative)
# Assuming running from root, and backend/.env has the correct URL
if not os.getenv("DATABASE_URL"):
    print("DATABASE_URL not found in env")
    exit(1)

engine = create_engine(os.getenv("DATABASE_URL"))
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
