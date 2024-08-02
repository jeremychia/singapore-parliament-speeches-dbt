with
    unioned as (
        

        (
            select
                    cast(
                        '`singapore-parliament-speeches`.`prod_stg`.`stg_members_member_of_parliament`' as string
                    ) as type,

                
                    cast(`member_name` as STRING) as `member_name`
                    ,
                    cast(`member_constituency` as STRING) as `member_constituency`
                    ,
                    cast(`effective_from_date` as DATE) as `effective_from_date`
                    ,
                    cast(`effective_to_date` as DATE) as `effective_to_date`
                    ,
                    cast(`is_latest_constituency` as BOOLEAN) as `is_latest_constituency`
                    ,
                    cast(null as STRING) as `member_appointment`
                    ,
                    cast(null as BOOLEAN) as `is_latest_appointment`
                    ,
                    cast(null as STRING) as `parliament`
                    ,
                    cast(null as STRING) as `session`
                    ,
                    cast(null as STRING) as `member_committee`
                    ,
                    cast(null as ARRAY<STRING>) as `member_committee_position`
                    ,
                    cast(null as BOOLEAN) as `is_latest_committee`
                    

            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_member_of_parliament`

            
        )

        union all
        

        (
            select
                    cast(
                        '`singapore-parliament-speeches`.`prod_stg`.`stg_members_office_holding`' as string
                    ) as type,

                
                    cast(`member_name` as STRING) as `member_name`
                    ,
                    cast(null as STRING) as `member_constituency`
                    ,
                    cast(`effective_from_date` as DATE) as `effective_from_date`
                    ,
                    cast(`effective_to_date` as DATE) as `effective_to_date`
                    ,
                    cast(null as BOOLEAN) as `is_latest_constituency`
                    ,
                    cast(`member_appointment` as STRING) as `member_appointment`
                    ,
                    cast(`is_latest_appointment` as BOOLEAN) as `is_latest_appointment`
                    ,
                    cast(null as STRING) as `parliament`
                    ,
                    cast(null as STRING) as `session`
                    ,
                    cast(null as STRING) as `member_committee`
                    ,
                    cast(null as ARRAY<STRING>) as `member_committee_position`
                    ,
                    cast(null as BOOLEAN) as `is_latest_committee`
                    

            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_office_holding`

            
        )

        union all
        

        (
            select
                    cast(
                        '`singapore-parliament-speeches`.`prod_stg`.`stg_members_select_committee`' as string
                    ) as type,

                
                    cast(`member_name` as STRING) as `member_name`
                    ,
                    cast(null as STRING) as `member_constituency`
                    ,
                    cast(`effective_from_date` as DATE) as `effective_from_date`
                    ,
                    cast(`effective_to_date` as DATE) as `effective_to_date`
                    ,
                    cast(null as BOOLEAN) as `is_latest_constituency`
                    ,
                    cast(null as STRING) as `member_appointment`
                    ,
                    cast(null as BOOLEAN) as `is_latest_appointment`
                    ,
                    cast(`parliament` as STRING) as `parliament`
                    ,
                    cast(`session` as STRING) as `session`
                    ,
                    cast(`member_committee` as STRING) as `member_committee`
                    ,
                    cast(`member_committee_position` as ARRAY<STRING>) as `member_committee_position`
                    ,
                    cast(`is_latest_committee` as BOOLEAN) as `is_latest_committee`
                    

            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_select_committee`

            
        )

        
    ),

    renamed as (
        select
            member_name,
            case
                when
                    type
                    = '`singapore-parliament-speeches`.`prod_stg`.`stg_members_member_of_parliament`'
                then 'constituency'
                when
                    type
                    = '`singapore-parliament-speeches`.`prod_stg`.`stg_members_office_holding`'
                then 'appointment'
                when
                    type
                    = '`singapore-parliament-speeches`.`prod_stg`.`stg_members_select_committee`'
                then 'select_committee'
            end as type,
            coalesce(
                member_constituency, member_appointment, member_committee
            ) as member_position,
            effective_from_date,
            effective_to_date,
            coalesce(
                is_latest_constituency, is_latest_appointment, is_latest_committee
            ) as is_latest_position
        from unioned
    )

select *
from renamed
-- temporary filter so it's not confusing
-- information from earlier parliaments are not included
where not (effective_from_date is null and effective_to_date is null)