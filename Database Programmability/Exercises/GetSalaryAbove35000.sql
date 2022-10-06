# 1. Employees with salary above 35000
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT first_name,last_name from employees
    where salary >35000
    order by first_name,last_name,employee_id;
END$$
DELIMITER ;
CALL `soft_uni`.`usp_get_employees_salary_above_35000`();
# 2. Emps with salary above input
DELIMITER $$
create procedure usp_get_employees_salary_above(target_salary DECIMAL(19,4))
begin
	select `first_name`, `last_name` from `employees`
    where salary >= target_salary
    order by `first_name`,`last_name`,`employee_id`;
end$$
CALL soft_uni.usp_get_employees_salary_above(30000)$$

# town names Starting with
create procedure usp_get_towns_starting_with(starting_text varchar(42))
begin 
select `name` from `towns`
where name like concat(starting_text,'%')
order by `name`;
end$$

# 4. Employees from Town
create procedure usp_get_employees_from_town(town_name varchar(50))
begin
	select first_name,last_name from employees e join
    addresses a on e.address_id = a.address_id
    join towns t on a.town_id =t.town_id
    where t.name = town_name
    order by e.first_name,e.last_name,e.employee_id desc;
    end$$
    
   #5. Salary Level Function
   
   create function ufn_get_salary_level(salary decimal(19,4))
   returns varchar(11)
   deterministic
   begin
	declare salary_level varchar(11);
    if salary < 30000 then set salary_level :='Low';
    elseif salary <= 50000 then set salary_level :='Average';
    else set salary_level := 'High';
		end if;
        return salary_level;

end$$


create procedure usp_get_employees_by_salary_level(salary_level varchar(11))
begin 
select first_name,last_name from employees
where ufn_get_salary_level(salary)= salary_level
order by `first_name` desc, `last_name` desc;
end$$

# Define Function

create function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
returns int 
deterministic
begin
 return word regexp(concat('^[',set_of_letters,']+$'));
end$$
 