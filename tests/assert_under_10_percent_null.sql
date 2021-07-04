select

sum( case when ID is null then 1 else 0 end) / count(*) as total_nulls

from {{ ref('my_first_dbt_model') }}

having sum( case when ID is null then 1 else 0 end) / count(*) > .4
