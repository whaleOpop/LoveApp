from pydantic import BaseModel

class PlaceRequest(BaseModel):
    latitude: float
    longitude: float

class PlaceResponse(BaseModel):
    name: str
    address: str
    fsq_id: str
    icon: str
