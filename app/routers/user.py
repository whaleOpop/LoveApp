from fastapi import APIRouter, Depends, HTTPException, Header
from sqlalchemy.orm import Session
from app.schemas import UserCreate, UserAuth, UserOut
from app.crud import create_user, authenticate_user, get_user_by_session, delete_session,get_user_by_phone
from app.database import get_db


router = APIRouter()


@router.post("/register")
def register_user(user: UserCreate, db: Session = Depends(get_db)):
    existing_user = get_user_by_phone(db, user.phone)
    if existing_user:
        raise HTTPException(status_code=400, detail="Номер уже зарегистрирован")
    db_user = create_user(db, user.dict())
    
    return {"sessionid": db_user.sessionid}


@router.post("/login")
def login(user_auth: UserAuth, db: Session = Depends(get_db)):
    user = authenticate_user(db, user_auth.phone, user_auth.password)
    if not user:
        raise HTTPException(status_code=400, detail="Invalid credentials")
    return {"sessionid": user.sessionid}

@router.post("/logout")
def logout(sessionid: str, db: Session = Depends(get_db)):
    delete_session(db, sessionid)
    return {"msg": "Successfully logged out"}


@router.get("/me", response_model=UserOut)
def get_me(sessionid: str = Header(...), db: Session = Depends(get_db)):
    user = get_user_by_session(db, sessionid)
    if not user:
        raise HTTPException(status_code=401, detail="Invalid session")
    return user
