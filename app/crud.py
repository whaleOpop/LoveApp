from sqlalchemy.orm import Session
from app.models import User, Gallery, Photo, Couple
from uuid import uuid4
import bcrypt

def hash_password(password: str) -> str:
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return bcrypt.checkpw(plain_password.encode('utf-8'), hashed_password.encode('utf-8'))

def get_user_by_phone(db: Session, phone: str):
    return db.query(User).filter(User.phone == phone).first()

def create_user(db: Session, user_data):
    user_id = str(uuid4())
    session_id = str(uuid4())

    hashed_password = hash_password(user_data['password'])
    user_data['password'] = hashed_password

    db_user = User(id=user_id, sessionid=session_id, **user_data)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def delete_session(db: Session, sessionid: str):
    user = get_user_by_session(db, sessionid)
    if user:
        user.sessionid = None
        db.commit()

def get_user_by_session(db: Session, sessionid: str):
    user = db.query(User).filter(User.sessionid == sessionid).first()
    print(f"Session ID: {sessionid}, User Found: {user}") 
    return user


def authenticate_user(db: Session, phone: str, password: str):
    user = get_user_by_phone(db, phone)
    if user and verify_password(password, user.password):
        user.sessionid = str(uuid4()) 
        db.commit()
        return user
    return None


