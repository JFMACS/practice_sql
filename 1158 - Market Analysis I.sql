select
    user_id buyer_id, join_date, ifnull(count(order_id), 0) orders_in_2019
from
    Users left join Orders on user_id = buyer_id and order_date >= '2019-01-01' and order_date < '2020-01-01'
group by user_id