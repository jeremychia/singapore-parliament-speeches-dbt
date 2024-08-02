

    
    

    with
        validation_errors as (

            select member_name, member_committee, parliament, session
            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_select_committee`
            group by member_name, member_committee, parliament, session
            having count(*) > 1

        )

    select *
    from validation_errors

