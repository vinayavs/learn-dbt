{{ config(materialized='table') }}

-- select order_date
--       ,total_price
--       ,sum(total_price) over (order by order_date rows between unbounded preceding and current row) as cumulative_sales
-- from (select o_orderdate as order_date
--             ,sum(o_totalprice) as total_price
--       from snowflake_sample_data.tpch_sf1.orders
--       group by 1
--       )
-- order by 1

with orders as (
      SELECT * FROM {{source('sample', 'orders')}}
)

SELECT DISTINCT o_orderdate,
      SUM(o_totalprice) OVER (ORDER BY o_orderdate) AS cumulative_sales 
FROM orders

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}

ORDER BY o_orderdate