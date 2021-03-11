select
employee_id,team_size
from
Employee e,
(
  select
  team_id, count(team_id) team_size
  from
  Employee
  group by
  team_id
) t
where
e.team_id = t.team_id