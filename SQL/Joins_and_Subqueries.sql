# 1. Order details with customer, seller, and product info
SELECT 
  o.order_id,
  c.customer_id,
  p.product_id,
  s.seller_id,
  pr.product_category_name
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON pr.product_id = oi.product_id
JOIN sellers s ON s.seller_id = oi.seller_id
JOIN customers c ON c.customer_id = o.customer_id;


# 2. Customers who only ordered once
SELECT 
  customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1;


# 3. Most expensive product per category
SELECT product_id, product_category_name, max_price
FROM (
  SELECT 
    pr.product_id,
    pr.product_category_name,
    MAX(oi.price) OVER (PARTITION BY pr.product_category_name) AS max_price,
    ROW_NUMBER() OVER (PARTITION BY pr.product_category_name ORDER BY oi.price DESC) AS rn
  FROM products pr
  JOIN order_items oi ON pr.product_id = oi.product_id
) sub
WHERE rn = 1;

# 4. Average review score per seller
SELECT 
  seller_id,
  (SELECT AVG(review_score)
   FROM order_reviews r
   JOIN order_items oi ON r.order_id = oi.order_id
   WHERE oi.seller_id = oi.seller_id) AS avg_score
FROM order_items oi
GROUP BY seller_id;
