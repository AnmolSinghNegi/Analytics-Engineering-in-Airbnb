WITH 
list AS (
    SELECT * FROM {{ ref('dim_listings_cleansed')}}  
),
host AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed')}}
)

SELECT
    list.listing_id,
    list.listing_name,
    list.room_type,
    list.minimum_nights,
    list.price,
    list.host_id,
    host.host_name,
    host.is_superhost AS host_is_superhost,
    list.created_at,
    GREATEST(list.updated_at, host.updated_at) AS updated_at
FROM list
LEFT JOIN host ON (host.host_id = list.host_id)