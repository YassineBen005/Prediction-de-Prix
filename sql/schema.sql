CREATE TABLE IF NOT EXISTS housing_data (
    id              SERIAL PRIMARY KEY,
    longitude       FLOAT NOT NULL,
    latitude        FLOAT NOT NULL,
    housing_age     FLOAT,
    total_rooms     FLOAT,
    total_bedrooms  FLOAT,
    population      FLOAT,
    households      FLOAT,
    median_income   FLOAT,
    median_price    FLOAT NOT NULL,
    inserted_at     TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS training_runs (
    id          SERIAL PRIMARY KEY,
    run_date    TIMESTAMP DEFAULT NOW(),
    model_name  VARCHAR(100),
    model_path  VARCHAR(255),
    rmse        FLOAT,
    mae         FLOAT,
    r2_score    FLOAT,
    n_samples   INT,
    notes       TEXT
);