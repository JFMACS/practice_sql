select
    ROUND(POW(MIN(POW((a.x - b.x), 2) + POW((a.y - b.y), 2)), 0.5), 2) shortest
from
    point_2d a, point_2d b
where a.x != b.x or a.y != b.y