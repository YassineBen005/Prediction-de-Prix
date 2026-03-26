from sklearn.datasets import fetch_california_housing
from sqlalchemy import create_engine
import pandas as pd

BD_URL = "postgresql://bubu:mlops123@localhost/maison"

def charger_en_BD():
    data = fetch_california_housing(as_frame=True)
    df = data.frame.rename(columns={
        "MedHouseVal": "median_price",
        "MedInc":      "median_income",
        "HouseAge":    "housing_age",
        "AveRooms":    "total_rooms",
        "AveBedrms":   "total_bedrooms",
        "Population":  "population",
        "AveOccup":    "households",
        "Latitude":    "latitude",
        "Longitude":   "longitude"
    })
    engine = create_engine(BD_URL)
    df.to_sql("housing_data", engine, if_exists="append", index=False)
    print(f"{len(df)} lignes insérées dans housing_data")

if __name__ == "__main__":
    charger_en_BD()