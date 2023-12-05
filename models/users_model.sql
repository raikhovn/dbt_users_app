
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source_data as (

    select u.user_id, u.first_name, u.last_name, ph.mobile, cr.model, cr.price
    from users u
    inner join user_phones ph on u.user_id = ph.user_id
    inner join user_cars cr on u.user_id = cr.user_id

), trans_data as (

    select source_data.user_id, CONCAT(source_data.first_name, '  ', source_data.last_name) as username, 
            CONCAT('mobile ', ' ' , source_data.mobile) as userphone
    from source_data        
)

select * from trans_data


    

    

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
