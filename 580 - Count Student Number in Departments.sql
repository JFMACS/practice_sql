select
    dept_name, count(student_id) student_number
from
    department d left join student s 
using(dept_id)
group by d.dept_id
order by student_number desc, dept_name