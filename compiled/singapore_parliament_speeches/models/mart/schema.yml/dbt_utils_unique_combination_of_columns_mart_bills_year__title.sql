





with validation_errors as (

    select
        year, title
    from `singapore-parliament-speeches`.`prod_mart`.`mart_bills`
    group by year, title
    having count(*) > 1

)

select *
from validation_errors


