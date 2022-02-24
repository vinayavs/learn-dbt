{{ config(materialized='table' , alias='customer_model') }}

with customer_data as (

    select c_custkey, c_mktsegment, c_acctbal
    from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF100"."CUSTOMER"

)

select *
from customer_data