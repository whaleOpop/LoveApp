from sqlalchemy import create_engine, Column, Integer, String, DateTime, ForeignKey, BLOB
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    phone = Column(String, nullable=False)
    password = Column(String, nullable=False)
    photo = Column(BLOB)
    age = Column(Integer)
    zodiac = Column(String)
    city = Column(String)
    uuid = Column(Integer, unique=True)

class Gallery(Base):
    __tablename__ = "gallery"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    description = Column(String, nullable=False)

class Photo(Base):
    __tablename__ = "photo"
    id = Column(Integer, primary_key=True, index=True)
    description = Column(String, nullable=False)
    photo = Column(BLOB, nullable=False)
    id_gallery = Column(Integer, ForeignKey('gallery.id'))

class Couple(Base):
    __tablename__ = "couple"
    id = Column(Integer, primary_key=True, index=True)
    start_date = Column(DateTime, nullable=False)
    end_date = Column(DateTime)
    id_para_man = Column(Integer, ForeignKey('user.id'))
    id_para_women = Column(Integer, ForeignKey('user.id'))
    id_gallery = Column(Integer, ForeignKey('gallery.id'))
