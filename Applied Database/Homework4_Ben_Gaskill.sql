#1
SELECT COUNT(order_id) AS total_orders, SUM(tax_amount) AS total_tax
FROM orders;

#2
SELECT category_name, COUNT(p.category_id) AS num_products, MAX(p.list_price) AS most_expensive
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY category_name
ORDER BY COUNT(*) desc;

#3
SELECT email_address, SUM((item_price * quantity)) AS item_price_total, SUM((discount_amount * quantity)) AS item_discount_total
FROM customers c		-- Relate customers (email address) to order items, using the shared values in orders in the middle
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY item_price_total desc;

#4
SELECT email_address, COUNT(o.order_id) AS number_of_orders, SUM((item_price - discount_amount) * quantity) AS total_amount
FROM customers c		-- Relate customers (email address) to order items, using the shared values in orders in the middle
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(o.order_id) >= 2
ORDER BY SUM(item_price) desc;

#5
SELECT email_address, COUNT(o.order_id) AS number_of_orders, SUM((item_price - discount_amount) * quantity) AS total_amount
FROM customers c		-- Relate customers (email address) to order items, using the shared values in orders in the middle
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(o.order_id) >= 2
ORDER BY SUM(item_price) desc;

#6
SELECT product_name, SUM((item_price - discount_amount) * quantity) AS each_product_total
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY product_name WITH ROLLUP;

#7
SELECT email_address, COUNT(DISTINCT p.product_id) AS distinct_products  -- should be products
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY email_address
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY email_address;

#8 
SELECT IF(GROUPING(category_name) = 1, '', category_name) as category_Name, IF(GROUPING(product_name) = 1, 'Total Quantity Purchased', product_name) AS product_Name, SUM(quantity) AS total_quantitiy
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY category_name, product_name WITH ROLLUP;