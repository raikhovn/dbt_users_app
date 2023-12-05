
-- Use the `ref` function to select from other models



{{ config(materialized='table') }}

with source_data as (
    select
    
        product_id,
        item,
        price
    from products    
)


select * from source_data
