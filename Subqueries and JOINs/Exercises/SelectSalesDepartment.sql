#•	employee_id
#•	first_name
#•	last_name
#•	department_name
select e.employee_id, e.first_name, e.last_name, d.name as department_name from employees as e 
join departments as d 
on d.department_id=e.department_id
where d.name="Sales"
order by e.employee_id desc;