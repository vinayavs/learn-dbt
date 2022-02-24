{{ config(materialized='table') }}

SELECT 
    C.C_CUSTKEY,
    C.C_NAME,
    C.C_NATIONKEY AS NATION,
    SUM(O.O_TOTALPRICE) AS TOTAL_ORDER_PRICE 
FROM {{ source('sample', 'customer') }} C
LEFT JOIN {{ source('sample', 'orders') }} O
ON C.C_CUSTKEY = O.O_CUSTKEY
{{ group_by(3) }}
-- GROUP BY
--     C.C_CUSTKEY,
--     C.C_NAME,
--     C.C_NATIONKEY