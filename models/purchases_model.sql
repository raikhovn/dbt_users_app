
-- Use the `ref` function to select from other models



{{ config(materialized='table') }}

with source_data as (
    select
        purchase_id,
        product_id,
        user_id,
        count,
        dt as purchase_date,
        st as purchase_state
    from user_purchases    
)


select * from source_data
