SELECT 
    e1.employee_id,
    CONCAT(e1.first_name, ' ', e1.last_name) AS 'employee_name',
    CONCAT(m.first_name, ' ', m.last_name) AS 'manager_name',
    d.name AS 'department_name'
FROM
    employees e1
        JOIN
    employees m ON e1.manager_id = m.employee_id
        JOIN
    departments d ON e1.department_id = d.department_id
WHERE
    e1.manager_id = m.employee_id
ORDER BY e1.employee_id
LIMIT 5; 