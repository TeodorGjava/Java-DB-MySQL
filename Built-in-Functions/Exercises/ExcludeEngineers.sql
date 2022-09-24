select `first_name`,`last_name` from `employees`
where `job_title` not like '%engineer%'
order by `employee_id`;