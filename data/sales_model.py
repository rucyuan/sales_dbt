'''{{ config(materialized='view') }}

select * from {{ source('liquor_sales', 'sales') }}'''