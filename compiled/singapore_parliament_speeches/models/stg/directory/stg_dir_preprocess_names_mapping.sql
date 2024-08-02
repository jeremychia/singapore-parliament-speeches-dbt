with
    source as (select * from `singapore-parliament-speeches`.`sg_govt_dir_preprocess`.`names_mapping`),
    renamed as (
        select `extracted_name`, `name`

        from source
    )
select *
from renamed