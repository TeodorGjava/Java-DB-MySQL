SELECT `user_name`, substring_index(`email`,'@',-1)as"email provider" FROM users
order by `email provider`,`user_name`;