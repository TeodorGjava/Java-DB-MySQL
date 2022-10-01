select a.town_id, t.`name` as town_name, a.address_text from addresses as a
join towns as t on a.town_id=t.town_id where t.`name` = "San Francisco"
or t.`name` = "Sofia" or t.`name` = "Carnation"
order by town_id,address_id;