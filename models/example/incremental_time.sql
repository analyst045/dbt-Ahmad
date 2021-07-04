
{{ config(materialized='incremental',unique_key='time')}}

select
to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) AS time,
*
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time

{% if is_incremental() %}
  and time > (select max(time) from {{ this }})
  {% endif %}
