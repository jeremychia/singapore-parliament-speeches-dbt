with
    source as (select * from `singapore-parliament-speeches`.`raw`.`members_full_name`),
    renamed as (
        select
            `original` as member_name,
            `converted` as member_name_website

        from source
    )
select *
from renamed