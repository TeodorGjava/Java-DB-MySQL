#•	first_name
#•	last_name
#•	town
#•	address_text 
select e.first_name,e.last_name, t.name,a.address_text from employees as e
join addresses as a
on e.address_id=a.address_id
join towns as t on t.town_id = a.town_id
order by e.first_name, e.last_name
limit 5;
