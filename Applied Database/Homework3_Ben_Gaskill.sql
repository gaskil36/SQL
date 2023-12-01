#1
SELECT c.category_name, p.product_name, p.list_price
FROM products p
JOIN categories c ON c.category_id = p.category_id
ORDER BY category_name ASC, product_name ASC; 

#2
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM addresses a
JOIN customers c ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';

#3 
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM addresses a 
JOIN customers c ON c.customer_id = a.customer_id
WHERE c.shipping_address_id = a.address_id;

#4 
SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id 
ORDER BY last_name, order_date, product_name; 

#5
SELECT p1.product_name, p1.list_price
FROM products p1 JOIN products p2
ON p1.product_id <> p2.product_id
AND p1.list_price = p2.list_price
ORDER BY product_name;

#6
SELECT c.category_name, p.product_id
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

#7
	SELECT 'SHIPPED' AS ship_status, order_id, order_date
	FROM orders 
	WHERE ship_date IS NOT NULL
UNION
	SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
	FROM orders
	WHERE ship_date IS NULL
ORDER BY order_date ASC;