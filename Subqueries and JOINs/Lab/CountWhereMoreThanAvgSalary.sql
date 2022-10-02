select count(*) as count from employees where salary>(select avg(salary) from employees);
#group by salary having salary > avg(salary);