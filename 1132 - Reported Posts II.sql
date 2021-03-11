select
    ROUND(AVG(rate) * 100, 2) average_daily_percent
from
    (
    select action_date, count(remove_date >= '1970-01-01' or null) / count(post_id) rate
    from
        (select post_id, action_date
        from Actions
        where extra ='spam'
        group by post_id, action_date) a
        left join Removals using(post_id) 
    group by action_date
) n