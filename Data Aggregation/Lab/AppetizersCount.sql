select count(`id`) as 'Appetizers'
FROM `products`
where `category_id`= 2 and `price`>8
GROUP BY `category_id`;