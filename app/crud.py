from sqlalchemy.orm import Session
from app.models import User, Gallery, Photo, Couple
from fastapi import HTTPException
from app.schemas import UserCreate, GalleryCreate, PhotoCreate, CoupleCreate
from uuid import uuid4
import bcrypt


def hash_password(password: str) -> str:
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password.decode('utf-8')


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return bcrypt.checkpw(plain_password.encode('utf-8'), hashed_password.encode('utf-8'))


def create_user(db: Session, user: UserCreate):
    hashed_password = hash_password(user.password)
    db_user = User(id=str(uuid4()), **user.dict(
        exclude={"password"}), password=hashed_password, sessionid=str(uuid4()))
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def update_user_token(db: Session, sessionid: str):
    db_user = get_user_by_session_id(db, sessionid)
    db_user.sessionid = str(uuid4())
    db.commit()
    db.refresh(db_user)
    return {"session_token": db_user.sessionid}


def get_user_by_session_id(db: Session, sessionid: str):
    return db.query(User).filter(User.sessionid == sessionid).first()


def get_user_by_phone(db: Session, phone: str):
    return db.query(User).filter(User.phone == phone).first()


def get_user(db: Session, user_id: str):
    return db.query(User).filter(User.id == user_id).first()


def delete_user(db: Session, user_id: str):
    db_user = db.query(User).filter(User.id == user_id).first()
    if db_user is None:
        raise HTTPException(status_code=404, detail="User is not found")
    db.delete(db_user)
    db.commit()
    return {"details": "User successfully deleted"}


def create_photo(db: Session, photo: PhotoCreate):
    db_photo = Photo(id=str(uuid4()), **photo.dict())
    db.add(db_photo)
    db.commit()
    db.refresh(db_photo)
    return db_photo


def get_photo(db: Session, photo_id: str):
    return db.query(Photo).filter(Photo.id == photo_id).first()


def delete_photo(db: Session, photo_id: str):
    db_photo = db.query(Photo).filter(Photo.id == photo_id).first()

    if db_photo is None:
        raise HTTPException(status_code=404, detail="Photo is not found")

    db.delete(db_photo)
    db.commit()
    return {"details": "Photo successfully deleted"}


def create_gallery(db: Session, gallery: GalleryCreate):
    db_gallery = Gallery(id=str(uuid4()), **gallery.dict())
    db.add(db_gallery)
    db.commit()
    db.refresh(db_gallery)
    return db_gallery


def get_gallery(db: Session, gallery_id: str):
    return db.query(Gallery).filter(Gallery.id == gallery_id).first()


def delete_gallery(db: Session, gallery_id: str):
    db_gallery = db.query(Gallery).filter(Gallery.id == gallery_id).first()

    if db_gallery is None:
        raise HTTPException(status_code=404, detail="Gallery is not found")

    db.delete(db_gallery)
    db.commit()
    return {"details": "Gallery successfully deleted"}


def create_couple(db: Session, couple: CoupleCreate):
    db_couple = Couple(id=str(uuid4()), **couple.dict())
    db.add(db_couple)
    db.commit()
    db.refresh(db_couple)
    return db_couple


def get_couple(db: Session, couple_id: str):
    return db.query(Couple).filter(Couple.id == couple_id).first()


def delete_couple(db: Session, couple_id: str):
    db_couple = db.query(Couple).filter(Couple.id == couple_id).first()

    if db_couple is None:
        raise HTTPException(status_code=404, detail="Couple is not found")

    db.delete(db_couple)
    db.commit()
    return {"details": "Couple successfully deleted"}
