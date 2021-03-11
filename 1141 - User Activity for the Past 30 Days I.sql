select
    activity_date day, count(distinct user_id) active_users
from
    Activity
where
activity_date <= '2019-07-27'
    and activity_date > subdate('2019-07-27', 30)
group by activity_date 