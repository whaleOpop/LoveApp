# app/routers/__init__.py

from .user import router as user_router
from .gallery import router as gallery_router
from .photo import router as photo_router
from .couple import router as couple_router

routers = [user_router, gallery_router, photo_router, couple_router]
