

{{ config(materialized='incremental',unique_key='D_DATE')}}

SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
WHERE D_DATE <= current_date

{% if is_incremental() %}
  and D_DATE > (select max(D_DATE) from {{ this }})
  {% endif %}
