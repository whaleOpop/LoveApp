from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import crud, schemas
from app.database import get_db

router = APIRouter()

@router.post("/", response_model=schemas.PhotoResponse)
def create_photo(photo: schemas.PhotoCreate, db: Session = Depends(get_db)):
    return crud.create_photo(db, photo)

@router.get("/{photo_id}", response_model=schemas.PhotoResponse)
def read_photo(photo_id: int, db: Session = Depends(get_db)):
    db_photo = crud.get_photo(db, photo_id)
    if db_photo is None:
        raise HTTPException(status_code=404, detail="Photo not found")
    return db_photo

@router.delete("/{photo_id}")
def delete_photo_endpoint(photo_id: int, db: Session = Depends(get_db)):
    crud.delete_photo(db=db, photo_id=photo_id)
    return {"detail": "Photo is sucsesefully deleted"}
