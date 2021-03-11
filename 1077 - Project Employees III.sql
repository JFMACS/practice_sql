select
    project_id, e.employee_id
from
    Project p, Employee e
where
p.employee_id = e.employee_id
    and
    (project_id, experience_years) in
(select
        project_id, MAX(experience_years) experience_years
    from
        Project p, Employee e
    where
p.employee_id = e.employee_id
    group by project_id)