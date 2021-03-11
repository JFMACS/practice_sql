select
    customer_id
from
    (
    select customer_id, count(distinct product_key) count_key
    from Customer
    group by customer_id
) n
where
count_key = (select count(1)
from Product)