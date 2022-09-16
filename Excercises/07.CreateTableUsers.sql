CREATE TABLE `users`(
	`id` INT PRIMARY KEY auto_increment,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN 
);
INSERT INTO `users` (`username`,`password`)
VALUES
	("Pesho","madafaka"),
   ("Pesho","madafaka1"),
   ("Pesho","madafaka2"),
   ("Pesho","madafaka3"),
   ("Pesho","madafaka4");
