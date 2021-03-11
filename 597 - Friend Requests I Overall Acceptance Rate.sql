select
    round(
    ifnull(
    (select count(1)
    from (select requester_id, accepter_id
        from RequestAccepted
        group by requester_id, accepter_id) r)
    /
    (select count(1)
    from (select sender_id, send_to_id
        from FriendRequest
        group by sender_id, send_to_id) as f)
    , 0)
, 2) accept_rate