select
    a.person_name
from
    Queue a, Queue b
where
b.turn <= a.turn
group by a.person_id
having sum(b.weight) <= 1000
order by a.turn desc
limit 1