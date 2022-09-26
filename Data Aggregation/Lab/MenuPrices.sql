select category_id, ROUND(AVG(PRICE),2) AS "Average Price",
ROUND(MIN(price),2) as "Cheapest Product",
ROUND(MAX(price),2) as "Most Expensive Product"
from products
GROUP BY `category_id`
ORDER BY `category_id`