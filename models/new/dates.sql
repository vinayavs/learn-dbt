{{ config(materialized='incremental', unique_key='d_date') }}


SELECT *
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF100TCL"."DATE_DIM"
WHERE d_date <= CURRENT_DATE


{% if is_incremental() %}
    and d_date > (SELECT MAX(d_date) FROM {{ this }})
{% endif %}

