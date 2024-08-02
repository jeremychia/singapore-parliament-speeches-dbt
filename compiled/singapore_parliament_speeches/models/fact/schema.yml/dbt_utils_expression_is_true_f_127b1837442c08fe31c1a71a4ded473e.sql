

    

    select 1
    from `singapore-parliament-speeches`.`prod_fact`.`fact_speeches`
     where not (count_characters > count_words)

