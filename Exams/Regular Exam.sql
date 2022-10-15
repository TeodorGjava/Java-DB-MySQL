create table `products` (
`id` int primary key auto_increment,
`name` varchar(30) not null unique,
`type` varchar(30) not null,
`price` decimal(10,2) not null);

create table `clients` (
`id` int primary key auto_increment,
`first_name` varchar(50) not null,
`last_name` varchar(50) not null,
`birthdate` date not null,
`card` varchar(50),
`review` text
);

create table `tables`(
`id` int primary key auto_increment,
`floor` int not null,
`reserved` boolean,
`capacity` int not null
);

create table `waiters`(
`id` int primary key auto_increment,
`first_name` varchar(50) not null,
`last_name` varchar(50) not null,
`email` varchar(50) not null,
`phone` varchar(50),
`salary` decimal(10,2)
);

create table `orders`(
`id` int primary key auto_increment,
`table_id` int not null,
`waiter_id` int not null,
`order_time` time not null,
`payed_status` boolean,
constraint fk_orders_tables
foreign key (table_id)
references tables(id),
constraint fk_orders_waiters
foreign key (waiter_id)
references waiters(id)
);


create table `orders_clients`(
`order_id` int,
`client_id` int ,
constraint fk_order_clients_to_orders
foreign key (`order_id`)
references orders(`id`),
constraint fk_order_clients_to_clients
foreign key (`client_id`)
references clients(`id`));

create table `orders_products`(
`order_id` int,
`product_id` int ,
constraint fk_order_products_to_orders
foreign key (`order_id`)
references orders(`id`),
constraint fk_order_products_to_products
foreign key (`product_id`)
references products(`id`));

# insert 

insert into products (`name`,`type`,`price`)
select concat(w.last_name," specialty"),"Cocktail", ceil(w.salary/100) from waiters w
where w.salary is not null and w.id>6;

SELECT * FROM products p
Where p.id >=200;


#update

update orders set table_id = table_id-1 
where id between 12 and 23;

#delete

delete from waiters w where w.id not in(select o.waiter_id from orders o);

## QUERYING	

# 05 CLIENTS

select id, first_name, last_name, birthdate,card,review from clients
order by birthdate desc,id desc;



select length("SoftUni");
select char_length("SoftUni");


#

## 06 BIRTHDATE 

select first_name,last_name,birthdate, review from clients
where card is null and year(birthdate) between 1978 and 1993
order by last_name desc, id
limit 5;

## 07 Accounts

select concat(last_name,first_name,length(first_name),"Restaurant") as 'username',
	reverse(substring(email,1,12)) as 'password' from waiters 
    where `salary` is not null
    order by `password` desc;
    
    #
    select p.id, p.name, count(o.id) as 'count' from products p 
    join orders_products op on p.id=op.product_id
    join orders o on op.order_id = o.id
    group by p.id
    having `count` >=5
    order by `count` desc,p.name;
    
    # availability
    
    select t.id,t.capacity,count(c.id) as 'count_clients',case when capacity > count(c.id) then "Free seats" 
    when capacity = count(c.id) then "Full" when capacity < count(c.id) then "Extra seats"end as 'availability' from `tables` t join
    `orders` o on t.id =o.table_id 
    join orders_clients oc on o.id = oc.order_id
    join clients c on oc.client_id=c.id 
    where t.`floor` = 1 
    group by t.id
    order by t.id desc;
    
    ## PROGRAMMABILITY
	#10 extract bill
    delimiter $$
    create function udf_client_bill(full_name varchar(50))
    returns int
    deterministic
    begin
    declare total_sum int;
    set total_sum := (select round(sum(p.price),2) from products p 
    join orders_products op on p.id=op.product_id
    join orders_clients oc on op.order_id=oc.order_id
    join clients c on oc.client_id=c.id
    where concat(c.first_name,' ',c.last_name) = full_name);
    return total_sum;
    end$$
    
    #11 happy hour 
    
    create procedure udp_happy_hour(type varchar(50))
    begin
    update products p set p.price = p.price - (p.price*0.2)
    where p.type = type and price >=10;
    end$$
    
    select concat(last_name,first_name,length(first_name),"Restaurant") as 'username',
	reverse(substring(email,2,12)) as 'password' from waiters 
    where `salary` is not null
    order by `password` desc;
    
    