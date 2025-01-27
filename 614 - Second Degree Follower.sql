select
    followee follower, count(distinct follower) num
from
    follow
where
followee in
(
    select distinct follower
from follow
)
group by followee
order by followee