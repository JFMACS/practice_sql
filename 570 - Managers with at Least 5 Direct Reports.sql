select
    m.Name
from
    Employee m, Employee e
where
m.Id = e.ManagerId
group by m.Id
having(count(1) >= 5)