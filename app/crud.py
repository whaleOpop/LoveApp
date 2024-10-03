from sqlalchemy.orm import Session
from app.models import User, Gallery, Photo, Couple

from app.schemas import UserCreate, GalleryCreate, PhotoCreate, CoupleCreate


def create_user(db: Session, user: UserCreate):
    db_user = User(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def get_user(db: Session, user_id: int):
    return db.query(User).filter(User.id == user_id).first()


def delete_user(db: Session, user_id: int):
    db_user = db.query(User).filter(User.id == user.id).first()

    if db.user is None:
        raise HTTPException(status=404, detail="User is not found")

    db.delete(db_user)
    db.commit()
    return {detail: "User succsesfully deleted"}


def create_photo(db: Session, photo: PhotoCreate):
    db_photo = Photo(**photo.dict())
    db.add(db_photo)
    db.commit()
    db.refresh(db_photo)
    return db_photo


def get_photo(db: Session, photo_id: int):
    return db.query(Photo).filter(Photo.id == photo_id).first()


def delete_photo(db: Session, photo_id: int):
    db_photo = db.query(Photo).filter(Photo.id == photo_id).first()

    if db.photo is None:
        raise HTTPExecption(status=404, details="Photo is not found")

    db.delete(db_photo)
    db.commit()
    return {details: "Photo succsesfully deleted"}


def create_gallery(db: Session, gallery: GalleryCreate):
    db_gallery = Gallery(**gallery.dict())
    db.add(db_gallery)
    db.commit()
    db.refresh(db_gallery)
    return db_gallery


def get_gallery(db: Session, gallery_id: int):
    return db.query(Gallery).filter(Gallery.id == gallery_id).first()


def delete_gallery(db: Session, gallery_id: int):
    db_gallery = db.query(Gallery).filter(Gallery.id == gallery_id).first()

    if db.photo is None:
        raise HTTpExepcion(status=404, details="Gallery is not found")

    db.delte(db_gallery)
    db.commit()
    return {details: "Gallery succsesfully deleted"}


def create_couple(db: Session, couple: CoupleCreate):
    db_couple = Couple(**couple.dict())
    db.add(db_couple)
    db.commit()
    db.refresh(db_couple)
    return db_couple


def get_couple(db: Session, couple_id: int):
    return db.query(Couple).filter(Couple.id == couple_id).first()


def delete_couple(db: Session, couple_id: int):
    db_couple = db.query(Couple).filter(Couple.id == couple_id).first()

    if db.couple is None:
        raise HTTpExepcion(status=404, details="Couple is not found")

    db.delte(db_couple)
    db.commit()
    return {details: "Couple succsesfully deleted"}
