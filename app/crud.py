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

