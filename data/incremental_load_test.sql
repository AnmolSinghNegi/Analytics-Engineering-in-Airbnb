SELECT * FROM AIRBNB.DEV.FCT_REVIEWS WHERE listing_id = 3176;
INSERT INTO AIRBNB.RAW.RAW_REVIEWS VALUES(
    3176,
    CURRENT_TIMESTAMP(),
    'REMP',
    'Excellent stay, very clean and comfortable.',
    'positive'
);