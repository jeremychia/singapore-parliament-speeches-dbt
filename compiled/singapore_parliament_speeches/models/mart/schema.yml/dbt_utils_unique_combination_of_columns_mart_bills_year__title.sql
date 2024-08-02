

    
    

    with
        validation_errors as (

            select year, title
            from (select * from `singapore-parliament-speeches`.`prod_mart`.`mart_bills` where bill_number is null) dbt_subquery
            group by year, title
            having count(*) > 1

        )

    select *
    from validation_errors

