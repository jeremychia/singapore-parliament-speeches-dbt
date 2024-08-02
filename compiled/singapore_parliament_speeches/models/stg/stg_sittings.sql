

with
    type_cast as (
        select
            cast(parliament as int64) as parliament,
            cast(session as int64) as session,
            cast(volume as int64) as volume,
            cast(sittings.sittings as int64) as sittings,
            date(date) as date,
            datetime(datetime) as datetime
        from `singapore-parliament-speeches`.`raw`.`sittings`
    )

select *
from type_cast