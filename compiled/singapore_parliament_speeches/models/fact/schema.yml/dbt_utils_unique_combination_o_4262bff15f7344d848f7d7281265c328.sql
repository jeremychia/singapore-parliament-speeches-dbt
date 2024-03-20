





with validation_errors as (

    select
        date, topic_id, reading
    from `singapore-parliament-speeches`.`prod_fact`.`fact_bill_activity`
    group by date, topic_id, reading
    having count(*) > 1

)

select *
from validation_errors


