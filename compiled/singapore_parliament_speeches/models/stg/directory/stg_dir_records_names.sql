with
    source as (select * from `singapore-parliament-speeches`.`sg_govt_dir`.`names`),
    renamed as (
        select
            `name`,
            `email`,
            `position`,
            `url` as department_url,
            `ministry_name`,
            `_accessed_at`

        from source
    ),
    latest_flag as (
        select
            *,
            _accessed_at
            = max(_accessed_at) over (partition by ministry_name) as is_latest
        from renamed
    )
select *
from latest_flag