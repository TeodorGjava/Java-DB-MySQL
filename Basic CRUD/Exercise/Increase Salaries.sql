use soft_uni
update employees
set salary = salary*1.12 
where department_id in (1,2,4,11);
select salary from employees;
