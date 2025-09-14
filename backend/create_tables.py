from database import engine, Base
from models import VendorCoalData

# Create all tables
Base.metadata.create_all(bind=engine)
