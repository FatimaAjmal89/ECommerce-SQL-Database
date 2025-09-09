# 🛒 E-Commerce Database Project

This project is a **SQL-based E-Commerce Database System** that manages customers, products, orders, payments, and reviews.  

It demonstrates:
- Database schema design  
- Sample data insertion  
- Useful queries for analysis  

---

## 📌 Features
- Manage **Customers** with details (name, email, phone, location).  
- Store **Products** with categories, prices, and stock quantities.  
- Track **Orders** and their **Order Items**.  
- Handle **Payments** (Cash/Card) with status updates.  
- Collect **Customer Reviews** and calculate average ratings.  
- Generate **reports** like revenue, top spenders, and monthly sales.  

---

## 📊 Example Queries

```sql

-- Join Orders and Products
SELECT P.Product_name, P.price, P.stock_quantity, O.Order_id
FROM Orders O
JOIN Order_Items OI ON O.Order_id = OI.Order_id
JOIN Products P ON OI.Product_id = P.Product_id;

-- Calculate total revenue
SELECT SUM(quantity * price_at_purchase) AS revenue FROM Order_Items;

-- Products with low stock
SELECT Product_id, Product_name, stock_quantity
FROM Products
WHERE stock_quantity < 5;

-- Average product rating
SELECT p.Product_id, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Products p ON p.product_id = r.product_id
GROUP BY p.product_id;

-- Top spender
SELECT Customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY Customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- Products never ordered
SELECT P.Product_id AS Product_neverordered
FROM Products P
LEFT JOIN Order_Items O ON P.Product_id = O.Product_id
WHERE O.Product_id IS NULL;

-- Monthly sales report
SELECT MONTH(order_date) AS order_month, SUM(total_amount) AS monthly_sales
FROM Orders
GROUP BY MONTH(order_date);
