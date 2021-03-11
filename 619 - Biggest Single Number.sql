select
MAX(num) num
from
(select num, count(1) count_num from my_numbers group by num) n
where
count_num = 1