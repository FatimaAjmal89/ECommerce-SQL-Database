CREATE DATABASE ECommerceDB;

CREATE TABLE Customers(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(50),
Customer_email VARCHAR(50),
Customer_number INT,
Customer_location VARCHAR(50),
date DATE
);
 
ALTER TABLE Customers
MODIFY Customer_number VARCHAR(15);

	
    
    
    
    
CREATE TABLE Products(
Productid INT PRIMARY KEY,
Products_name VARCHAR(50),
category VARCHAR(50),
price INT,
stock_quantity INT,
added_date DATE
);

CREATE TABLE Orders(
Order_id INT PRIMARY KEY,
Customer_id INT,
order_date DATE,
total_amount INT,
status ENUM ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
ON DELETE CASCADE 
ON UPDATE CASCADE 
);

CREATE TABLE Order_Items(
Order_item_id INT PRIMARY KEY,
Order_id INT,
Products_id INT,
quantity INT,
price_at_purchase INT,
FOREIGN KEY (Order_id) REFERENCES  Orders(Order_id),
FOREIGN KEY (Products_id) REFERENCES Products(Products_id)
);

CREATE TABLE Payments(
Payment_id INT PRIMARY KEY,
Order_id INT, 
payment_method  ENUM ('CASH', 'CARD') NOT NULL DEFAULT 'CASH',
amount_paid INT NOT NULL,
payment_date DATE, 
payment_status ENUM ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
FOREIGN KEY (Order_id) REFERENCES  Orders(Order_id)
);

CREATE TABLE Reviews(
Review_id INT PRIMARY KEY,
Customer_id INT, 
Products_id INT, 
rating INT CHECK (rating BETWEEN 1 AND 5),
comment VARCHAR(50), 
review_date DATE
);

INSERT INTO Customers
(Customer_id ,Customer_name ,Customer_number ,Customer_location)
VALUES 
(101, 'Ali Khan', 'ali.khan@gmail.com', '03001234567', 'Karachi, Pakistan', '2024-01-10'),
(102, 'Sara Ahmed', 'sara.ahmed@yahoo.com', '03019876543', 'Lahore, Pakistan', '2024-02-15'),
(103, 'Bilal Hussain', 'bilal.hussain@hotmail.com', '03014569874', 'Islamabad, Pakistan', '2024-03-05'),
(104, 'Ayesha Noor', 'ayesha.noor@gmail.com', '03022334455', 'Faisalabad, Pakistan', '2024-04-20'),
(105, 'Hamza Ali', 'hamza.ali@gmail.com', '03033445566', 'Rawalpindi, Pakistan', '2024-05-11');

INSERT INTO Products
(Products_id,Products_name ,price ,added_date)
VALUES
(201, 'iPhone 14', 'Electronics', 250000, 15, '2024-01-20'),
(202, 'Samsung Galaxy S23', 'Electronics', 220000, 10, '2024-01-25'),
(203, 'Dell XPS 13', 'Laptops', 280000, 8, '2024-02-01'),
(204, 'Nike Air Max', 'Shoes', 18000, 25, '2024-02-10'),
(205, 'Levi’s Jeans', 'Clothing', 6000, 30, '2024-02-15'),
(206, 'Apple AirPods Pro', 'Electronics', 60000, 20, '2024-03-05'),
(207, 'Wooden Study Table', 'Furniture', 25000, 12, '2024-03-12'),
(208, 'Harry Potter Book Set', 'Books', 12000, 40, '2024-04-01');

INSERT INTO Orders
(Order_id ,Customer_id ,category,order_date ,total_amount)
VALUES
(301, 101, '2024-03-12', 250000, 'Delivered'),
(302, 102, '2024-03-15', 6000, 'Delivered'),
(303, 103, '2024-04-02', 220000, 'Shipped'),
(304, 104, '2024-04-05', 18000, 'Delivered'),
(305, 105, '2024-04-08', 37000, 'Pending');

INSERT INTO Order_Items
(Order_item_id,Order_id ,Products_id ,quantity,price_at_purchase )
VALUES
(401, 301, 201, 1, 250000),
(402, 302, 205, 1, 6000),
(403, 303, 202, 1, 220000),
(404, 304, 204, 1, 18000),
(405, 305, 206, 1, 60000),
(406, 305, 207, 1, 25000);

INSERT INTO Payments
(Payment_id ,Order_id, payment_method  ,payment_date , payment_status)
VALUES
(501, 301, 'Credit Card', 250000, '2024-03-12', 'Successful'),
(502, 302, 'Cash on Delivery', 6000, '2024-03-15', 'Successful'),
(503, 303, 'Credit Card', 220000, '2024-04-02', 'Pending'),
(504, 304, 'Wallet', 18000, '2024-04-05', 'Successful'),
(505, 305, 'Credit Card', 37000, '2024-04-08', 'Pending');

INSERT INTO Reviews
(Review_id ,Products_id , rating , review_date)
VALUES
(601, 101, 201, 5, 'Amazing phone, worth the price!', '2024-03-20'),
(602, 102, 205, 4, 'Good quality jeans, very comfortable.', '2024-03-25'),
(603, 103, 202, 5, 'Best Samsung phone ever!', '2024-04-06'),
(604, 104, 204, 3, 'Shoes are stylish but a bit tight.', '2024-04-10'),
(605, 105, 206, 4, 'AirPods have great sound quality.', '2024-04-12');









