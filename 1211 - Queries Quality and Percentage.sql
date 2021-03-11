select
    query_name, ROUND(AVG(rating / position), 2) quality, ROUND(AVG(rating < 3) * 100, 2) poor_query_percentage
from
    Queries
group by query_name