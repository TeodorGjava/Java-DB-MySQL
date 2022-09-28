create table `new_table` as
select * from employees
where salary >30000; 

delete from `new_table`
where  `manager_id` =42;

update `new_table`
set `salary` = `salary` +5000
where `department_id` = 1;

select `department_id`, avg(salary) as `avg_salary`
from `new_table`
group by `department_id`
order by `department_id`;