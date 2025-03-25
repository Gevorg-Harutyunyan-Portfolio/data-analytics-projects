# 1. Average delivery time by product category
SELECT 
  pr.product_category_name,
AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)) AS avg_delivery_days
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY pr.product_category_name
ORDER BY avg_delivery_days DESC;

# 2. 5 Products categories with highest cancellation rate
SELECT 
  pr.product_category_name,
  COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) / COUNT(*) * 1.0 AS cancel_rate
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY cancel_rate DESC
LIMIT 5;

# 3. Sellers responsible for the most late deliveries
SELECT 
  s.seller_id,
  COUNT(*) AS late_deliveries
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN sellers s ON s.seller_id = oi.seller_id
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY s.seller_id
ORDER BY late_deliveries DESC;


# 4. Average order value per region
 SELECT
 c.customer_state,
  AVG(op.payment_value) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY avg_order_value DESC;

# 5. How many orders an average customer places 
SELECT 
  AVG(order_count) AS avg_orders_per_customer
FROM (
  SELECT 
    customer_id, 
    COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
);

# 6. Revenue per product category
SELECT 
  pr.product_category_name,
  SUM(op.payment_value) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
JOIN order_payments op ON o.order_id = op.order_id
GROUP BY pr.product_category_name
ORDER BY total_revenue DESC




