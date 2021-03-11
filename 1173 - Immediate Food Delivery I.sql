select
ROUND(immediate * 100 / count(1), 2) immediate_percentage
from
Delivery,
(select
count(1) immediate
from
Delivery
where
order_date = customer_pref_delivery_date) i