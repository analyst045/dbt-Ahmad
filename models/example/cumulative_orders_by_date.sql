


with base_table as (
SELECT
O_ORDERDATE as order_date,
 sum(O_TOTALPRICE) as total_price
FROM
 "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
 group by order_date
 order by order_date asc
)
select
order_date,
total_price,
sum(total_price) over (order by order_date rows between unbounded preceding and current row)    as cum_sales
from base_table
order by order_date
