from sqlalchemy import Column, String, Integer, LargeBinary, ForeignKey, DateTime
from sqlalchemy.orm import relationship
from database import Base

class User(Base):
    __tablename__ = "users"
    id = Column(String(255), primary_key=True, index=True)
    name = Column(String, nullable=False)
    phone = Column(String(255), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    photo = Column(LargeBinary, nullable=True)
    age = Column(Integer, nullable=True)
    zodiac = Column(String(255), nullable=True)
    city = Column(String(255), nullable=True)
    uuid = Column(String(255), nullable=True)
    sessionid = Column(String(45), unique=True, nullable=False)

class Gallery(Base):
    __tablename__ = "gallery"
    id = Column(String(255), primary_key=True, index=True)
    name = Column(String, nullable=False)
    description = Column(String, nullable=False)

class Couple(Base):
    __tablename__ = "couple"
    id = Column(String(255), primary_key=True, index=True)
    start_date = Column(DateTime, nullable=False)
    end_date = Column(DateTime, nullable=True)
    id_para_man = Column(String(255), ForeignKey('users.id'), nullable=False)
    id_para_women = Column(String(255), ForeignKey('users.id'), nullable=False)
    id_gallery = Column(String(255), ForeignKey('gallery.id'), nullable=True)

class Photo(Base):
    __tablename__ = "photo"
    id = Column(String(255), primary_key=True, index=True)
    description = Column(String, nullable=False)
    photo = Column(LargeBinary, nullable=False)
    id_gallery = Column(String(255), ForeignKey('gallery.id'), nullable=True)
