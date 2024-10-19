from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import crud, schemas
from app.database import get_db

router = APIRouter()


@router.post("/register", response_model=schemas.UserResponse)
def create_user(user: schemas.UserResponse, db: Session = Depends(get_db)):
    existing_user = db.query(user).filter(user.phone == user.phone).first()

    if existing_user:
        raise HTTPException(
            status_code=400, detail="Номер уже зарегистрирован")
    
    db_user = crud.create_user(db, user)
    return {"detail": "Login successful", "session_token": db_user.sessionid}


@router.post("/login")
def login_user(user: schemas.UserLogin, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_phone(db, phone=user.phone)

    if db_user is None or not crud.verify_password(user.password, db_user.password):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    token = crud.update_user_token(db, sessionid=db_user.sessionid)
    return {"detail": "Login successful", "session_token": token}


@router.get("/{session_id}")
def read_user(session_id: str, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_session_id(db, session_id)

    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    
    db_user = crud.update_user_token(db, session_id)
    return db_user


@router.delete("/{user_id}")
def delete_user_endpoint(user_id: str, db: Session = Depends(get_db)):
    crud.delete_user(db=db, user_id=user_id)
    return {"detail": "User successfully deleted"}
