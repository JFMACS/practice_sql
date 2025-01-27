select
    player_id, device_id
from
    Activity
where
(player_id, event_date)
in
(
    select
    player_id, MIN(event_date)
from
    Activity
group by player_id
)