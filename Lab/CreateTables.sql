CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50)
);

CREATE TABLE `categories`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `products`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`category_id` INT 
references `id`.`categories`
);
insert into `categories`(id,name)values
 (1,"pesho"),
 (2,"goshov"),
 (3,"toshov")
;
insert into `employees`(id, first_name, last_name) values
 (1,"pesho","peshov"),
 (2,"pesho","goshov"),
 (3,"pesho","toshov")
;
insert into `products`(id,name,category_id)values
 (1,"pesho",3),
 (2,"goshov",2),
 (3,"toshov",1);
