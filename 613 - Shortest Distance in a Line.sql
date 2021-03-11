select
    MIN(dis) shortest
from
    (select
        ABS(p1.x-p2.x) dis
    from
        point p1 join point p2 
    where p1.x != p2.x) p