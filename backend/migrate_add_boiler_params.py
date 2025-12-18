# Database Migration: Add boiler_params column
# Run this script once to add the missing column to your SQLite database.

import sqlite3
import os

# Path to your database
db_path = os.path.join(os.path.dirname(__file__), "coal_blend.db")

def migrate():
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    # Check if column already exists
    cursor.execute("PRAGMA table_info(simulationCoalRecommendations)")
    columns = [col[1] for col in cursor.fetchall()]
    
    if "boiler_params" not in columns:
        print("Adding 'boiler_params' column to simulationCoalRecommendations table...")
        cursor.execute("""
            ALTER TABLE simulationCoalRecommendations
            ADD COLUMN boiler_params TEXT
        """)
        conn.commit()
        print("Migration complete: 'boiler_params' column added.")
    else:
        print("Column 'boiler_params' already exists. No migration needed.")
    
    conn.close()

if __name__ == "__main__":
    migrate()
