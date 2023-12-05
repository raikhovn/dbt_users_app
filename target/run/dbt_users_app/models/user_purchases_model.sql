
  create view "userdb"."dbt"."user_purchases_model__dbt_tmp"
    
    
  as (
    /*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/



with user_data as (

    select username, user_id, userphone from "userdb"."dbt"."users_model"

), ranked_data as (

    select s.username, s.user_id, s.userphone, up.count * p.price as userspent, 
    RANK() OVER (PARTITION BY up.purchase_state ORDER BY up.count * p.price DESC) 

    from user_data s
    inner join "userdb"."dbt"."purchases_model" up on s.user_id = up.user_id
    inner join "userdb"."dbt"."products_model" p on up.product_id = p.product_id

)

select * from ranked_data



/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
  );