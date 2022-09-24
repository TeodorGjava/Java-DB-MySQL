create view `v_employees_hired_after_2000` 
as select `first_name`,`last_name`
from employees
where YEAR(hire_date) between 2001 and 3000; 