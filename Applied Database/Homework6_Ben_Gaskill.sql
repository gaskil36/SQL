#1 
SELECT list_price, discount_percent, ROUND(list_price * (.01 * discount_percent), 2) AS discount_amount
FROM products;

#2 
SELECT 
	DATE_FORMAT(order_date, "%Y") AS year_format,
    DATE_FORMAT(order_date, "%b-%d-%Y") AS full_format,
    DATE_FORMAT(order_date, "%l:%i %p") AS time_format,
    DATE_FORMAT(order_date, "%m/%d/%y %H:%i") AS date_time_format
FROM orders;

#3
SELECT card_number, LENGTH(card_number) AS length, RIGHT(card_number, 4) AS last_4,
IF(LENGTH(card_number) = 16, CONCAT('XXXX-XXXX-XXXX-', RIGHT(card_number, 4)) , CONCAT('XXXX-XXXXXX-X', RIGHT(card_number, 4))) AS final_format
FROM orders;

#4
SELECT order_id, order_date, 
	DATE_ADD(order_date , INTERVAL 2 DAY) AS approx_ship, 
    IFNULL(ship_date, 'Not yet Shipped') as ship_date,
    DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders
WHERE MONTH(order_date)= 3 AND YEAR(order_date) = 2018;

#5
SELECT email_address, 
	SUBSTR(email_address, 1, LOCATE('@', email_address) - 1) AS user_name,
	SUBSTR(email_address, LOCATE('@', email_address) + 1) AS domain_name
FROM administrators;

SELECT REGEXP_SUBSTR('bengaskillmyguitarshop.com', '^[A-Z]'); -- why does this only return b? I see that it starts from the beginning (^)
SELECT REGEXP_SUBSTR('abc123', '[A-D][1-9]*$');