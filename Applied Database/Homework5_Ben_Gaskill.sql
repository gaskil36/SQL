#1
SELECT DISTINCT category_name
FROM categories
WHERE category_id IN (1, 2, 3);

#2
SELECT product_id, list_price
FROM products
WHERE list_price > (
	SELECT AVG(list_price) AS average_list_price
    FROM products
)
ORDER BY list_price DESC;

#3
SELECT category_name
FROM categories c
WHERE NOT EXISTS (
	SELECT *
    FROM products p
    WHERE p.category_id = c.category_id
    );
    
#4.1
SELECT c.email_address, o.order_id, SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total
FROM customers c		
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.email_address, o.order_id;

#4.2
SELECT  email_address, MAX(order_total) AS the_largest_order
FROM (
	SELECT c.email_address, oi.order_id, SUM((item_price - discount_amount) * quantity) as order_total
		FROM order_items oi 
			JOIN orders o
			ON oi.order_id = o.order_id
			JOIN customers c 
            ON o.customer_id = c.customer_id
            GROUP BY c.email_address, oi.order_id) 
AS orders_by_email
GROUP BY email_address;

#5
SELECT p1.product_name, p1.discount_percent
FROM products p1
WHERE p1.discount_percent NOT IN (
	SELECT p2.discount_percent
	FROM products p2
    WHERE p1.product_name <> p2.product_name
    )
ORDER BY product_name;

#6
SELECT email_address, order_id, (SELECT MIN(order_date) FROM orders o WHERE c.customer_id = o.customer_id) 
AS oldest_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY oldest_order DESC;