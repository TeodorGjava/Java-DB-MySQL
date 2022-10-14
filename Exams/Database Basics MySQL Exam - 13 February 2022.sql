create table customers(
id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone varchar(30) not null unique,
address varchar(60) not null,
discount_card bit not null default 0);

create table orders(
id int primary key auto_increment,
order_datetime datetime not null,
customer_id int not null,
constraint fk_orders_customers
foreign key (customer_id)
references customers(id));

create table categories(
id int primary key auto_increment,
name varchar(40) not null unique);

create table brands(
id int primary key auto_increment,
name varchar(40) not null unique);

create table reviews(
id int primary key auto_increment,
content text,
rating decimal(10,2)not null,
picture_url varchar(80) not null,
published_at datetime not null);

create table products(
id int primary key auto_increment,
name varchar(40) not null,
price decimal(19,2) not null,
quantity_in_stock int,
description text,
brand_id int not null,
category_id int not null,
review_id int,
constraint fk_products_brands
foreign key (brand_id)
references brands(id),
constraint fk_products_categories
foreign key (category_id)
references categories(id),
constraint fk_products_rewiews
foreign key (review_id)
references reviews(id));

create table orders_products(
order_id int,
product_id int,
constraint fk_orders_products_orders
foreign key (order_id)
references orders(id),
constraint fk_orders_products_products
foreign key (product_id)
references products(id));

#Insert 

insert into reviews (content, picture_url,published_at,rating)
select substring(description ,1,15), reverse(name),date('2010/10/10') , price/8
from products where id>=5;

# update 
update products set quantity_in_stock = quantity_in_stock-5 where
quantity_in_stock between 60 and 70;

# delete 

delete from customers where id not in(select customer_id from orders);

# select categories
SELECT * FROM categories
order by name desc;

#quantity

select id, brand_id, name,quantity_in_stock from products 
where price >1000 and quantity_in_stock<30
order by quantity_in_stock , id;

#review

select id, content, rating, picture_url , published_at from reviews 
where char_length(content)>61 and content like 'My%'
order by rating desc;

select concat(c.first_name," ",c.last_name) as full_name,c.address,o.order_datetime 
from customers c 
join orders o on c.id=o.customer_id
where year(o.order_datetime)<=2018
order by full_name desc;

#⦁	Best categories

select count(c.id) as 'items_count', c.name, sum(p.quantity_in_stock) as 'total_quantity'
from categories c 
	join products p 
    on c.id = p.category_id
    group by c.id
    order by items_count desc,
    total_quantity 
    limit 5;
    
    delimiter $$
    create function udf_customer_products_count(name VARCHAR(30))
    returns int
    deterministic 
    begin
		DECLARE products_count int;
        
        set products_count := (select count(c.id) from customers c 
        join orders o on c.id = o.customer_id
        join orders_products orp on o.id= orp.order_id
        where c.first_name = name);
        return products_count;
    end$$
    
# reduce price
    
create procedure udp_reduce_price(category_name varchar(50))
begin 
update products p join categories c on p.category_id =c.id 
join reviews r on p.review_id = r.id
set p.price = p.price-(price*0.3)
where c.name = category_name and r.rating<4;
end$$
    
    
    

