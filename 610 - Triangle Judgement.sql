select
    x, y, z,
    case (ABS(x) + ABS(y) > ABS(z)) + (ABS(x) + ABS(z) > ABS(y)) + (ABS(y) + ABS(z) > ABS
(x))
    when '3' then 'Yes'
    else 'No'
end triangle
from
triangle