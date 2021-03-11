select
    user_id id, count(friend_id) num
from
    (
        select
            requester_id user_id, accepter_id friend_id
        from
            request_accepted
    union all
        select
            accepter_id user_id, requester_id friend_id
        from
            request_accepted
) c
group by user_id
order by count(friend_id) desc
limit 1