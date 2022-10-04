
select e.employee_id, e.job_title, e.address_id, a.address_text from employees as e 
join addresses as a 
on e.address_id = a.address_id
order by e.address_id
limit 5;