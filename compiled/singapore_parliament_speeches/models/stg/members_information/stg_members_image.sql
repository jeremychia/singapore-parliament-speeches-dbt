with
    source as (select * from `singapore-parliament-speeches`.`raw`.`members_image`),
    gsheet as (select * from `singapore-parliament-speeches`.`prod_stg`.`stg_gsheet_member_image_link`),
    renamed as (
        select
            `member_name` as member_name,
            `image_link` as member_image_link
        from source
    ),
    unioned as (
        select member_name, member_image_link
        from renamed
        union all
        select member_name, member_image_link
        from gsheet
    )
select *
from unioned