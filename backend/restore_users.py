from database import SessionLocal, engine
import models
from datetime import datetime

# Direct data extract from coal_blend.sql
# COPY public.users (id, email, name, hashed_password, is_active, created_at, updated_at)
users_data = [
    {
        "id": 1,
        "email": "navinpal512002@gmail.com",
        "name": "navin",
        "hashed_password": "$2b$12$pWs4RL7mqlVYJHEbzRdXBe.Yolg4JJoD5g4Q/5VcekHWbWmKcArsi",
        "is_active": True,
        "created_at": "2025-05-24 10:00:47.147393"
    },
    {
        "id": 2,
        "email": "abhay@gmail.com",
        "name": "abhay",
        "hashed_password": "$2b$12$ewJFAW8PVTE4Z6.mHjb8Ee3edAscPKnqTo41Qmh3ny2CHZzxu2ItC",
        "is_active": True,
        "created_at": "2025-05-24 11:32:37.147261"
    },
    {
        "id": 3,
        "email": "namo@gmail.com",
        "name": "namo",
        "hashed_password": "$2b$12$aeY19AFQLcQWxr9NAHNhyOE/LepuDvDqDZ.vdt79YpV.xzH8sdePu",
        "is_active": True,
        "created_at": "2025-05-26 12:26:33.79111"
    },
    {
        "id": 4,
        "email": "navin@gmail.com",
        "name": "navin",
        "hashed_password": "$2b$12$7xsPbBbw7QQXOPbQccNIjeP16ODxsuO409qSOOB3JQI9CKvhWwhXq",
        "is_active": True,
        "created_at": "2025-07-08 11:21:55.48851"
    }
]

def restore_users():
    # Ensure tables exist
    models.Base.metadata.create_all(bind=engine)
    
    db = SessionLocal()
    try:
        print("Restoring users...")
        for u_data in users_data:
            # Check if user exists
            existing = db.query(models.User).filter(models.User.email == u_data["email"]).first()
            if not existing:
                # Handle timestamp format
                # The dump has timezone offset +05:30. 
                # Simplification: strptime with %z might fail on python < 3.7 for colons in offset?
                # Actually, standard fromisoformat might work if we clean it a bit
                try:
                    # Clean the timezone for simple datetime insertion
                    dt_str = u_data["created_at"].split('+')[0]
                    created_at = datetime.fromisoformat(dt_str)
                except Exception as e:
                    print(f"Date parsing error: {e}, using now()")
                    created_at = datetime.now()

                user = models.User(
                    id=u_data["id"],
                    email=u_data["email"],
                    name=u_data["name"],
                    hashed_password=u_data["hashed_password"],
                    is_active=u_data["is_active"],
                    created_at=created_at
                )
                db.add(user)
                print(f"Added user: {u_data['email']}")
            else:
                print(f"User already exists: {u_data['email']}")
        
        db.commit()
        print("User restoration complete.")
    except Exception as e:
        print(f"Error restoring users: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    restore_users()
