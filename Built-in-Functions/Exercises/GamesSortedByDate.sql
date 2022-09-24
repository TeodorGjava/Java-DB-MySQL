select `name` ,date_format(`start`,"%Y-%m-%d") as "start" from games
where YEAR(`start`) between 2011 and 2012
order by `start` limit 50;