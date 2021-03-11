select
    extra report_reason, count(distinct post_id) report_count
from
    Actions
where
action = 'report'
    and action_date = subdate('2019-07-05', 1)
group by extra