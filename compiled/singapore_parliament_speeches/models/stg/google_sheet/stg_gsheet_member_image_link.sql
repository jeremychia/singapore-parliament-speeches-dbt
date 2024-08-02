with
    source as (select * from `singapore-parliament-speeches`.`google_sheets`.`member_image_link`),
    renamed as (
        select
            `member_name`, `member_image_link`

        from source
    )
select *
from renamed