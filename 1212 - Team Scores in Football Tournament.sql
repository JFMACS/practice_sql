select
    *
from
    (select
        t.*, ifnull(score, 0) num_points
    from
        Teams t left join
        (
    select team_id, sum(score) score
        from (
                    select host_team team_id, (case when host_goals > guest_goals then 3 when host_goals = guest_goals then 1 else 0 end) score
                from Matches
            union all
                select guest_team team_id, (case when host_goals < guest_goals then 3 when host_goals = guest_goals then 1 else 0 end) score
                from Matches ) s
        group by team_id
) m 
using(team_id)
)r
order by num_points desc, team_id