select `first_name` from `employees` 
where (department_id= 3 or department_id = 10)
 and year(`hire_date`) between 1995 and 2005
order by employee_id;