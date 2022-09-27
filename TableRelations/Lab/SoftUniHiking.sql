select r.starting_point as route_starting_point, r.end_point as route_ending_point,
c.id, concat(c.first_name," ", c.last_name) as leader_name
from routes as r
join 
campers as c on r.leader_id=c.id