select
    product_id, SUM(quantity) total_quantity
from
    Sales
group by
product_id