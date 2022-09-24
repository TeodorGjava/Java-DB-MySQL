select * from towns 
where `name` not like'R%' AND `name` not like 'D%' AND `name` not like 'B%'
ORDER BY `name`;