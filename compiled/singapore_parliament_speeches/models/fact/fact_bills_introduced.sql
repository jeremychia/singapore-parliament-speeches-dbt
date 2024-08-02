with
    source as (
        select
            bill_number,
            title,
            first_reading_date,
            second_reading_date,
            passed_date,
            bill_pdf_link
        from `singapore-parliament-speeches`.`prod_stg`.`stg_parliamentary_business_bills_introduced`
    )

select *
from source