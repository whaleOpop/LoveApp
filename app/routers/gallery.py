from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import crud, schemas
from app.database import get_db

router = APIRouter()

@router.post("/", response_model=schemas.GalleryResponse)
def create_gallery(gallery: schemas.GalleryCreate, db: Session = Depends(get_db)):
    return crud.create_gallery(db, gallery)

@router.get("/{gallery_id}", response_model=schemas.GalleryResponse)
def read_gallery(gallery_id: int, db: Session = Depends(get_db)):
    db_gallery = crud.get_gallery(db, gallery_id)
    if db_gallery is None:
        raise HTTPException(status_code=404, detail="Gallery not found")
    return db_gallery

@router.delete("/{gallery_id}")
def delete_gallery_endpoint(gallery_id: int, db: Session = Depends(get_db)):
    crud.delete_gallery(db=db, gallery_id=gallery_id)
    return {detail: "Gallery is sucsesefully deleted"}