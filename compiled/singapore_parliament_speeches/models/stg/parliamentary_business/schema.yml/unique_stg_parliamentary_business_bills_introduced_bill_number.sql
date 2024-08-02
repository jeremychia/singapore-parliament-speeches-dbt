
    
    

with dbt_test__target as (

  select bill_number as unique_field
  from `singapore-parliament-speeches`.`prod_stg`.`stg_parliamentary_business_bills_introduced`
  where bill_number is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


