select book_id, name
from
    (select *
    from Books
    where available_from < '2019-05-23') b
    left join
    (select book_id, SUM(quantity) quantity
    from Orders
    where dispatch_date >= '2018-06-23'
    group by book_id) o 
using(book_id)
where quantity < 10 or quantity is null