from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import crud, schemas
from app.database import get_db

router = APIRouter()

@router.post("/", response_model=schemas.CoupleResponse)
def create_couple(couple: schemas.CoupleCreate, db: Session = Depends(get_db)):
    return crud.create_couple(db, couple)

@router.get("/{couple_id}", response_model=schemas.CoupleResponse)
def read_couple(couple_id: int, db: Session = Depends(get_db)):
    db_couple = crud.get_couple(db, couple_id)
    if db_couple is None:
        raise HTTPException(status_code=404, detail="Couple not found")
    return db_couple


