with
    source as (select * from `singapore-parliament-speeches`.`sg_govt_dir`.`metadata`),
    renamed as (
        select
            `table_name`,
            `ministry_name`,
            `num_rows`,
            `_accessed_at`

        from source
    )
select *
from renamed