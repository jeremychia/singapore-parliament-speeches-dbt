

with source as (
    select
        date,
        member_name,
        is_present
    from `singapore-parliament-speeches`.`prod_stg`.`stg_attendance`
)

select *
from source