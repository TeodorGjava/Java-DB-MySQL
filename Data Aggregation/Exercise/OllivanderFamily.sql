select 
`deposit_group`, round(sum(`deposit_amount`),2) as "total_sum"
from 
	`wizzard_deposits`
where `magic_wand_creator` = 'Ollivander family' 
group by `deposit_group`
order by `deposit_group`;