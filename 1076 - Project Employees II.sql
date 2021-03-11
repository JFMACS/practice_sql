select
    project_id
from
    Project p
group by
project_id
having
count(1) = (
    select
    count(1)
    from
    Project
    group by
    project_id
    order by count(1) desc
    limit 1
    )