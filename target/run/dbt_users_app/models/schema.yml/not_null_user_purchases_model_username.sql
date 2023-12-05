select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select username
from "userdb"."dbt"."user_purchases_model"
where username is null



      
    ) dbt_internal_test