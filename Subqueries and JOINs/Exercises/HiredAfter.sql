select e.first_name,e.last_name,e.hire_date,d.name as "dept_name" from 
employees e 
inner join departments d
on e.department_id=d.department_id
where d.name in ("Finance", "Sales")
and e.hire_date > '1999-01-01 00:00:00'
order by e.hire_date;