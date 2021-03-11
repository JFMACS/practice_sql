select
    activity_date login_date, count(user_id) user_count
from
    (
select
        user_id, MIN(activity_date) activity_date
    from
        Traffic
    where
activity = 'login'
    group by user_id
) n
where activity_date >= subdate('2019-06-30', 90)
group by activity_date