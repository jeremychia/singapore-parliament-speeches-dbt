

    
    

    with
        validation_errors as (

            select member_name, member_constituency, effective_from_date
            from `singapore-parliament-speeches`.`prod_stg`.`stg_members_member_of_parliament`
            group by member_name, member_constituency, effective_from_date
            having count(*) > 1

        )

    select *
    from validation_errors

