-- In model materialization, we can set the materialization type and other configurations for this model.
-- on_schema_change='fail' means the model run will fail if upstream changes the schema.
{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='review_id',
    on_schema_change='fail'
) }}
WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews')}}
)

SELECT * FROM src_reviews
WHERE review_text IS NOT NULL
-- to tell how to handle incremental data load, if the model is incremental then it will only load the new data based on the condition below.
{% if is_incremental() %} 
     AND review_date > (SELECT  MAX(review_date) FROM {{ this }})
{% endif %}