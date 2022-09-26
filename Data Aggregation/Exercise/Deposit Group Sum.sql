select 
`deposit_group`, round(sum(`deposit_amount`),2) as "total_sum"
from 
	`wizzard_deposits`
group by `deposit_group`
order by `total_sum`;