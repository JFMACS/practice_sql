select
    ROUND(
    (select
        count(1)
    from
        (select
            MIN(a.event_date) first_date, b.event_date event_date
        from
            Activity a, Activity b
        where
    a.player_id = b.player_id
        group by a.player_id, b.event_date) f
    where adddate(first_date, 1) = event_date)
    /
    (select
        count(1)
    from
        (select
            count(1)
        from
            Activity
        group by player_id) c)
, 2) fraction