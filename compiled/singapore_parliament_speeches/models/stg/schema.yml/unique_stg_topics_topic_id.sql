
    
    

with dbt_test__target as (

  select topic_id as unique_field
  from `singapore-parliament-speeches`.`prod_stg`.`stg_topics`
  where topic_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


