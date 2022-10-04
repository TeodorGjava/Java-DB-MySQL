select e.employee_id, e.first_name, e.salary, d.name as department_name from employees as e 
join departments as d 
on d.department_id=e.department_id
where e.salary>15000
order by e.department_id desc,e.first_name
limit 5;