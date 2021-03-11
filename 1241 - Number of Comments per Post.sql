select
    p.sub_id post_id, count(distinct s.sub_id) number_of_comments
from
    Submissions s right join (select distinct sub_id
    from Submissions
    where parent_id is null) p on s.parent_id = p.sub_id
group by p.sub_id