select e1.employee_id,e1.first_name, e1.`manager_id`, m.first_name as 'manager_name'
from `employees` e1, `employees` m
where e1.manager_id = m.employee_id and e1.manager_id in (3,7)
order by e1.first_name;