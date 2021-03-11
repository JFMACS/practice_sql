-- 该命令成立的前提是boss的manager_id也得是1 否则只能用union连接
select
    distinct e4.employee_id EMPLOYEE_ID
from
    Employees e1, Employees e2, Employees e3, Employees e4
where
e1.manager_id = 1
    and e2.manager_id = e1.employee_id
    and e3.manager_id = e2.employee_id
    and e4.manager_id = e3.employee_id
    and e4.employee_id != 1