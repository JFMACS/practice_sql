select
    student_id, MIN(course_id) course_id, grade
from
    Enrollments
where
(student_id, grade) in
(
    select student_id, MAX(grade) grade
from Enrollments
group by student_id
)
group by student_id
order by student_id