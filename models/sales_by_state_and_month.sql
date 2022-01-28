with parsed_sales as (
    SELECT
        extract(month from date) as month,
        extract(year from date) as year,
        * 
    FROM {{ ref('sales_model') }}
),

grouped_sales as (
    select 
        county_number,
        year,
        month,
        sum(sale_dollars) as sale_dollars
    from parsed_sales
        where county_number is not null
        group by county_number, year, month
)


select * from grouped_sales