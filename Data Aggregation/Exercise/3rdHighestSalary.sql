select distinct `department_id` , 
( select distinct `salary`
from employees e
where e.department_id = employees.department_id
order by salary desc
limit 1 offset 2
) as `third_highest_salary` 
from employees
having `third_highest_salary` 
order by `department_id`