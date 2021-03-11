-- 一个有效会话指一个session_id
select
    IFNULL(ROUND(count(distinct session_id) / (count(distinct user_id)), 2), 0) average_sessions_per_user
from
    Activity
where 
activity_date <= '2019-07-27'
    and activity_date > subdate('2019-07-27', 30)