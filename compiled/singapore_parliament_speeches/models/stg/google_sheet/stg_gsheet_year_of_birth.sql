with
    source as (select * from `singapore-parliament-speeches`.`google_sheets`.`year_of_birth`),
    renamed as (
        select
            `member_name` as member_name,
            cast(`year_of_birth` as int) as member_birth_year,
            cast(`accessed_at` as date) as accessed_at

        from source
    )
select *
from renamed