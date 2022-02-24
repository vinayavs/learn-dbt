
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
    
*/



{{ config(materialized='table', alias='first_model', tags=["nightly","demo"] ) }}
-- , post_hook='grant select on {{this}} to role analyst'

with source_data as (

    select 1 as id, 'CA' as state, '2022-01-01 00:00:00.000'::timestamp as updated_at
    union all
    select null as id, 'CT' as state, '2022-01-01 00:00:00.000'::timestamp as updated_at
    union all
    select 3 as id, 'VT' as state, '2022-01-01 00:00:00.000'::timestamp as updated_at
    -- select 1 as id

)

select * -- , {{ var('my_first_variable') }} as first_variable
from source_data
-- where id >= {{ var('my_third_variable') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

