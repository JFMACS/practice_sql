select
    a.player_id, a.event_date, SUM(b.games_played) games_played_so_far
from
    Activity a, Activity b
where
b.event_date <= a.event_date
    and a.player_id = b.player_id
group by a.player_id, a.event_date