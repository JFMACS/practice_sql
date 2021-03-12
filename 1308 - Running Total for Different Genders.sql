select
    a.gender, a.day, sum(b.score_points) total
from
    (select
        gender, day, sum(score_points) score_points
    from
        Scores
    group by gender, day) a, (select
        gender, day, sum(score_points) score_points
    from
        Scores
    group by gender, day) b
where a.day >= b.day and a.gender = b.gender
group by a.day, a.gender
order by gender, day