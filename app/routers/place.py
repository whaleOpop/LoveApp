from fastapi import APIRouter, HTTPException
import requests
from app.models import PlaceRequest, PlaceResponse

router = APIRouter()

API_URL = "https://api.foursquare.com/v3/places/search"
HEADERS = {
    "accept": "application/json",
    "Authorization": "fsq3VJrDFj2pQ+RywCOIL7XErPKVeTs2gclz/okGfCjqxsY="
}

@router.post("/places", response_model=list[PlaceResponse])
async def get_nearby_places(request: PlaceRequest):
    params = {
        "ll": f"{request.latitude},{request.longitude}",
        "categories": "16032,16034,16035,16036,16039",
        "radius": 5000,
        "limit": 20,
        "sort": "distance"
    }

    response = requests.get(API_URL, headers=HEADERS, params=params)
    if response.status_code != 200:
        raise HTTPException(status_code=500, detail="Error fetching places")

    places = response.json().get("results", [])
    return [
        PlaceResponse(
            name=place["name"],
            address=place["location"]["formatted_address"],
            fsq_id=place["fsq_id"],
            icon=place["categories"][0]["icon"]["prefix"] + "bg_64" + place["categories"][0]["icon"]["suffix"]
        )
        for place in places
    ]
