from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class UserBase(BaseModel):
    name: str
    phone: str
    age: Optional[int]
    zodiac: Optional[str]
    city: Optional[str]

    class Config:
        orm_mode = True


class UserCreate(UserBase):
    password: str

    class Config:
        orm_mode = True


class UserOut(UserBase):
    id: str
    sessionid: str

    class Config:
        orm_mode = True


class UserAuth(BaseModel):
    phone: str
    password: str

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
