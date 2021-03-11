select
    *
from
    (
                select
            id, 'Root' as 'Type'
        from
            tree
        where
    p_id is null
    union all
        select
            id, 'Inner' as 'Type'
        from
            tree
        where
    id in
    (
        select distinct p_id
            from tree
            where p_id is not null
    )
            and p_id is not null
    union all
        select
            id, 'Leaf' as 'Type'
        from
            tree
        where
    id not in
    (
        select distinct p_id
            from tree
            where p_id is not null
    )
            and p_id is not null
) t
order by id