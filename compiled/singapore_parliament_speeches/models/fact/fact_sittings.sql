

with source as (
    select
        date,
        datetime,
        parliament,
        session,
        volume,
        sittings
    from `singapore-parliament-speeches`.`prod_stg`.`stg_sittings`
)

select *
from source