# 1. Count total number of orders, customers, products and sellers
SELECT 
  (SELECT COUNT(*) FROM orders) AS total_orders,
  (SELECT COUNT(*) FROM customers) AS total_customers,
  (SELECT COUNT(*) FROM products) AS total_products,
  (SELECT COUNT(*) FROM sellers) AS total_sellers;
  
  
# 2. Number of products per category
SELECT 
  product_category_name, 
  COUNT(*) AS product_count
FROM products
GROUP BY product_category_name
ORDER BY product_count DESC;


# 3. Number of reviews per score
SELECT 
  review_score, 
  COUNT(*) AS review_count
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;


# 4. Top 10 sellers by number of orders
SELECT 
  seller_id, 
  COUNT(order_id) AS order_count
FROM order_items
GROUP BY seller_id
ORDER BY order_count DESC
LIMIT 10













