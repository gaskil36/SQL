#1
SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

#2
SELECT CONCAT(last_name, ', ', first_name) AS full_name 
FROM customers
WHERE last_name  > 'M'
ORDER BY last_name ASC;

#3
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

#4
SELECT product_name, list_price, discount_percent,
	   ROUND(list_price * (discount_percent / 100), 2) AS discount_amount,
       ROUND(list_price - (list_price * (discount_percent / 100)), 2) AS discount_price
FROM products
ORDER BY discount_price DESC
LIMIT 5;

#5
SELECT item_id, item_price, discount_amount, quantity,
	   (item_price * quantity) AS price_total,
       (discount_amount * quantity) AS discount_total,
	   ((item_price - discount_amount) * quantity) AS item_total
FROM order_items
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY item_total DESC;
 
#6 
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS null;

#7
SELECT now() AS today_unformatted,
       date_format(now(), '%d-%b-%y') AS today_formatted;

#8 
SELECT (100) AS price,
       (.07) AS tax_rate,
       (100 * .07) AS tax_amount,
       (100 + (100 * .07)) AS total;

#1 (Chapter 8)
SELECT list_price, FORMAT(list_price, 1), CONVERT(list_price, UNSIGNED), CAST(list_price AS UNSIGNED)
FROM products; 

#2 (Chapter 8)
SELECT date_added, CAST(date_added AS DATE), 

DATE_FORMAT(date_added, '%y-%b'), 
CAST(date_added AS TIME)
FROM products;
