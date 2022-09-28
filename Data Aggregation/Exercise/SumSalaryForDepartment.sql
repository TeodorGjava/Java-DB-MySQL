select `department_id`, sum(salary) as `total_salary`
from `employees`
group by `department_id`
order by `department_id`