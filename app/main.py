from fastapi import FastAPI
from app.database import engine, Base
from app.routers import user, gallery, photo, couple


app = FastAPI()


app.include_router(user.router, prefix="/users", tags=["users"])
app.include_router(gallery.router, prefix="/gallery", tags=["gallery"])
app.include_router(photo.router, prefix="/photo", tags=["photo"])
app.include_router(couple.router, prefix="/couple", tags=["couple"])


Base.metadata.create_all(bind=engine)
