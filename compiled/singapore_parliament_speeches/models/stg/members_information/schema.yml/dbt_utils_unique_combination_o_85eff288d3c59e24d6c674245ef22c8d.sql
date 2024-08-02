

    
    

    with
        validation_errors as (

            select member_name, member_appointment, effective_from_date
            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_office_holding`
            group by member_name, member_appointment, effective_from_date
            having count(*) > 1

        )

    select *
    from validation_errors

