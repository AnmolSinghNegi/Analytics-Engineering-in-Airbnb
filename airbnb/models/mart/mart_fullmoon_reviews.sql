{{
    config(
        materialized='table'
    )
}}

With fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews')}}
),
full_moon_dates AS(
    SELECT * FROM {{ref('seed_full_moon_dates')}}
)
--- Logic: Review date will be full moon date +1 and full moon date will be as it is .
SELECT
    r.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM
    fct_reviews r
LEFT JOIN
    full_moon_dates fm
ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date)) --- Review Date = Full Moon Date + 1 