use soft_uni
create view v_employees_job_titles
 as select concat_ws(' ',first_name,middle_name,last_name) 
 as full_name, job_title
from employees;
