
    
    

with dbt_test__target as (

  select speech_id as unique_field
  from `singapore-parliament-speeches`.`prod_stg`.`stg_speeches`
  where speech_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


