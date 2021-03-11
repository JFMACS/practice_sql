select
    business_id
from
    Events e,
    (select event_type, SUM(occurences) / count(business_id) avg_count
    from Events
    group by event_type) n
where
e.event_type = n.event_type
    and occurences > avg_count
group by business_id
having count(1) > 1