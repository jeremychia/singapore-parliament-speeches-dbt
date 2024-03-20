





with validation_errors as (

    select
        date, member_name
    from `singapore-parliament-speeches`.`prod_stg`.`stg_attendance`
    group by date, member_name
    having count(*) > 1

)

select *
from validation_errors


