select
    country_name,
    case when AVG(weather_state) <= 15 then 'Cold'
when AVG(weather_state) >= 25 then 'Hot'
else 'Warm' end weather_type
from
    Countries c, Weather w
where c.country_id = w.country_id
    and day >= '2019-11-01' and day <= '2019-11-30'
group by c.country_id