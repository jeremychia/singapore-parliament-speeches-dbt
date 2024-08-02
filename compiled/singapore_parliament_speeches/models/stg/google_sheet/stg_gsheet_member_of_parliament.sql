with
    source as (select * from `singapore-parliament-speeches`.`google_sheets`.`member_of_parliament`),
    renamed as (
        select
            `member_name` as member_name,
            `constituency` as member_constituency,
            cast(`from_date` as date) as effective_from_date,
            cast(`to_date` as date) as effective_to_date,
            cast(`accessed_at` as date) as accessed_at

        from source
    )
select *
from renamed