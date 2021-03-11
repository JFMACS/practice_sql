select
    name
from
    salesperson
where
sales_id not in (
select
    sales_id
from
    orders o, company c
where
o.com_id = c.com_id and c.name = 'RED')