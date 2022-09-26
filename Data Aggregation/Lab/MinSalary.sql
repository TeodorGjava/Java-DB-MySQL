SELECT `department_id`, ROUND(MIN(`salary`),2) as "Min salary"
FROM 
`employees`
where 
`salary` > 800
GROUP BY `department_id`
ORDER BY `department_id`
limit 1;