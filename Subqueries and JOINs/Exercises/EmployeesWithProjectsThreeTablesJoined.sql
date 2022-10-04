select e.employee_id,e.first_name,p.name as 'project_name' from employees e
join employees_projects ep 
on e.employee_id = ep.employee_id
join projects p 
on ep.project_id=p.project_id
where date(p.start_date)>'2002-08-13' and p.end_date is null
order by e.first_name,p.name
limit 5