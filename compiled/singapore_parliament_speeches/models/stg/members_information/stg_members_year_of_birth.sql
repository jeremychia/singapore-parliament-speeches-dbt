with
    source as (select * from `singapore-parliament-speeches`.`raw`.`members_year_of_birth`),
    renamed as (
        select
            `member_name` as member_name,
            cast(`year_of_birth` as int) as member_birth_year,

        from source
    ),
    -- union manually-filled information
    manual_gsheet as (
        select member_name, member_birth_year from `singapore-parliament-speeches`.`prod_stg`.`stg_gsheet_year_of_birth`
    ),

    unioned as (
        select member_name, member_birth_year
        from renamed
        union all
        select member_name, member_birth_year
        from manual_gsheet
    )
select *
from unioned