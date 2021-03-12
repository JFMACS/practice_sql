select
    ROUND(ifnull(count(delivery_id), 0) * 100 / count(1), 2) immediate_percentage
from
    (select customer_id, MIN(order_date) order_date
    from Delivery
    group by customer_id) f
    left join
    (select *
    from Delivery
    where order_date = customer_pref_delivery_date) d 
using(customer_id, order_date)