/* Total number of unique customer by state */

SELECT 
	customer_state,
	COUNT(customer_zip_code_prefix) AS  Total_Customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

/* Top 10 product categories most ordered by customers*/

SELECT  products.product_category_name, SUM(order_items.order_item_id) AS TOTAL_ORDERS FROM customers 

	JOIN orders
	ON customers.customer_id = orders.customer_id
	JOIN order_items
	ON orders.order_id = order_items.order_id
	JOIN products
	ON products.product_id = order_items.product_id
GROUP BY products.product_category_name
ORDER BY TOTAL_ORDERS DESC
LIMIT 10;

/* Average customer order price by state */
SELECT SUM(order_payments.payment_value)/COUNT(orders.customer_id) AS Average_order_price,
		customers.customer_state FROM order_payments
	JOIN orders
	ON orders.order_id = order_payments.order_id
	JOIN customers
	ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_state 
ORDER BY Average_order_price DESC;

/* Frequency credit card payment by state */

SELECT customers.customer_state, COUNT(payment_type) AS total_credit_card_payments  
FROM order_payments
	JOIN orders
	ON orders.order_id = order_payments.order_id
	JOIN customers
	ON orders.customer_id = customers.customer_id
	WHERE payment_type = 'credit_card'
GROUP BY customers.customer_state
ORDER BY total_credit_card_payments DESC;

/* Proportion of customers paying in more than one installment by state */

SELECT customer_state,
       count,
       (count/total_order) AS proportion
FROM(WITH payment AS(SELECT customer_state,
                            payment_installments
                     FROM orders AS od
                     JOIN customers AS cu USING(customer_id)
                     JOIN order_payments AS pay USING(order_id)
                     WHERE payment_installments > 1)
    SELECT customer_state,
           COUNT(payment_installments)::real AS count,
           (SELECT COUNT(order_id) FROM orders)::real AS total_order
    FROM payment
    GROUP BY customer_state
    ORDER BY count DESC) AS g2
WHERE count > 1000
ORDER BY proportion DESC

/* Frequency Of Orders */
/*Frequency of orders delivered every month */

SELECT date_part('year',order_delivered_customer_date)::int AS "year",
date_part('month',order_delivered_customer_date)::int AS "month",
COUNT(*) order_status
FROM orders
WHERE order_status = 'delivered'
GROUP BY year,month
ORDER BY year,month

/*Top 5 cities with most number of orders */
SELECT customers.customer_city, COUNT(*)order_status  FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_city
ORDER BY order_status DESC 
LIMIT 5

/* Deliveries per hour */
SELECT date_part('hour',order_delivered_customer_date)::real AS "hour",
		COUNT(*) AS order_delivered_customer_date
FROM orders
WHERE order_status = 'delivered'
GROUP BY hour
ORDER BY hour
