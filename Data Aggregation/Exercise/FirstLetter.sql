select distinct substring(`first_name`,1,1) as first_letter from `wizzard_deposits`
where `deposit_group` = "Troll Chest" order by `first_letter`;