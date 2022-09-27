select v.driver_id,v.vehicle_type,concat(c.first_name," " ,c.last_name) as driver_name
from vehicles as v
join 
campers as c on v.driver_id =c.id