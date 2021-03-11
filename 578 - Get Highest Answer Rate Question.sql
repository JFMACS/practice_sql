select
    question_id survey_log
from(
select
        question_id,
        SUM(case action when 'answer' then 1 else 0 end) / SUM(case action when 'show' then 1 else 0 end) rate
    from
        survey_log
    group by question_id
    order by rate desc
limit 1
) n