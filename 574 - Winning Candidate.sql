select
    Name
from
    Candidate
where
id = (select
    CandidateId
from
    Vote
group by CandidateId
order by count(1) desc
    limit 1)