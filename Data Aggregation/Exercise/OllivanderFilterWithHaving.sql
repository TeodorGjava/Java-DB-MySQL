select 
`deposit_group`, round(sum(`deposit_amount`),2) as "total_sum"
from 
	`wizzard_deposits`
where `magic_wand_creator` = 'Ollivander family' 
group by `deposit_group`
having `total_sum`<150000
order by `total_sum` desc;