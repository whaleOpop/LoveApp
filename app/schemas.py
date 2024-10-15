from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class UserLogin(BaseModel):
    phone: str
    password: str


class UserCreate(BaseModel):
    name: str
    phone: str
    password: str
    age: int
    zodiac: str
    city: str
    uuid: str

class UserResponse(BaseModel):
    id: str
    name: str
    phone: str
    age: int
    zodiac: str
    city: str
    uuid: str
    class Config:
        orm_mode = True

class GalleryCreate(BaseModel):
    name: str
    description: str

class GalleryResponse(BaseModel):
    id: str
    name: str
    description: str
    class Config:
        orm_mode = True

class PhotoCreate(BaseModel):
    description: str
    photo: bytes
    id_gallery: str

class PhotoResponse(BaseModel):
    id: str
    description: str
    id_gallery: str
    class Config:
        orm_mode = True

class CoupleCreate(BaseModel):
    start_date: datetime
    end_date: Optional[datetime]
    id_para_man: str
    id_para_women: str
    id_gallery: Optional[str]

class CoupleResponse(BaseModel):
    id: str
    start_date: datetime
    end_date: Optional[datetime]
    id_para_man: str
    id_para_women: str
    id_gallery: Optional[str]
    class Config:
        orm_mode = True
