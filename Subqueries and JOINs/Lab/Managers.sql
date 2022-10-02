select 
	d.manager_id,
    concat_ws(' ',e.first_name,e.last_name) as 'full_name',
    d.department_id,
    d.name `department_name`
 from departments 
as d
join employees as e 
on d.manager_id = e.employee_id
order by e.employee_id
limit 5;