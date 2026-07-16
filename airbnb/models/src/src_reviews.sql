WITH raw_reviews AS (
   SELECT * FROM {{source('airbnb', 'reviews')}}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS review_id,
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews