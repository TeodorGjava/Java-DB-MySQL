select avg(salary)as 'min_average_salary' from employees group by department_id
order by avg(salary)
limit 1;