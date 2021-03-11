select
    actor_id, director_id
from
    (
    select
        actor_id, director_id, count(1) count_num
    from
        ActorDirector
    group by
    actor_id, director_id
) n
where
count_num > 2