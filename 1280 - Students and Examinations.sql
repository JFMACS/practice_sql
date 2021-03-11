select
    s.*, count(e.student_id) attended_exams
from
    ( select *
    from Students, Subjects) s left join Examinations e on s.student_id = e.student_id and s.subject_name = e.subject_name
group by s.student_id, s.subject_name
order by s.student_id, s.subject_name