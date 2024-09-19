from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class UserCreate(BaseModel):
    name: str
    phone: str
    password: str
    age: int
    zodiac: str
    city: str
    uuid: int

class UserResponse(BaseModel):
    id: int
    name: str
    phone: str
    age: int
    zodiac: str
    city: str
    uuid: int
    class Config:
        orm_mode = True

class GalleryCreate(BaseModel):
    name: str
    description: str

class GalleryResponse(BaseModel):
    id: int
    name: str
    description: str
    class Config:
        orm_mode = True

class PhotoCreate(BaseModel):
    description: str
    photo: bytes
    id_gallery: int

class PhotoResponse(BaseModel):
    id: int
    description: str
    id_gallery: int
    class Config:
        orm_mode = True

class CoupleCreate(BaseModel):
    start_date: datetime
    end_date: Optional[datetime]
    id_para_man: int
    id_para_women: int
    id_gallery: Optional[int]

class CoupleResponse(BaseModel):
    id: int
    start_date: datetime
    end_date: Optional[datetime]
    id_para_man: int
    id_para_women: int
    id_gallery: Optional[int]
    class Config:
        orm_mode = True
