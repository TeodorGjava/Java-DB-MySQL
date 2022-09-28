select `first_name`, `last_name` , `department_id`
from `employees` e
where salary > (
select avg(salary)
from `employees` s
where s.department_id= e.department_id)
order by `department_id`, `employee_id`
limit 10;