# 1. Rank sellers by number of orders each month
SELECT 
  seller_id,
  DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS month,
  COUNT(DISTINCT o.order_id) AS order_count,
  RANK() OVER (PARTITION BY DATE_TRUNC('month', o.order_purchase_timestamp) ORDER BY COUNT(DISTINCT o.order_id) DESC) AS ranked
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY seller_id, month
LIMIT 50;

# 2.  Identify returning customers using ROW_NUMBER 
SELECT 
  customer_id,
  order_id,
  order_purchase_timestamp,
  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_purchase_timestamp) AS purchase_rank
FROM orders
LIMIT 50;


# 3. Cumulative number of orders per day
SELECT 
  DATE(order_purchase_timestamp) AS purchase_date,
  COUNT(order_id) AS daily_orders,
  SUM(COUNT(order_id)) OVER (ORDER BY DATE(order_purchase_timestamp)) AS cumulative_orders
FROM orders
GROUP BY purchase_date
ORDER BY purchase_date;

# 5. Time to delivery in days
SELECT 
  order_id,
  order_purchase_timestamp,
  order_delivered_customer_date,
  DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
LIMIT 50;


