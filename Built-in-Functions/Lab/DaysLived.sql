select concat_ws(' ',first_name,last_name) as "Full Name",
timestampdiff(day,born,died) AS 'Days Lived'
from authors;


#case when isnull(died) then `(NULL)` 
#else timestampdiff(day,born,died)
#from authors;