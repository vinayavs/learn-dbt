-- Styling with common table expression
with sample_customer as (
    SELECT * FROM {{ source('sample', 'customer') }}
)

SELECT 
    c_custkey,
    c_mktsegment,
    {{ rename_segments('c_mktsegment') }} mkt_segment_adjusted
FROM sample_customer