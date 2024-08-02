
    
    

with dbt_test__target as (

  select member_name as unique_field
  from `singapore-parliament-speeches`.`prod_stg`.`stg_members_full_name`
  where member_name is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


