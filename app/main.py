from fastapi import FastAPI
from app.routers import place

app = FastAPI()

app.include_router(place.router)
