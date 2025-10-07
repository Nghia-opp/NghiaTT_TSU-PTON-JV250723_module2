CREATE DATABASE thdtt;
USE thdtt;

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
	productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT NOT NULL,
    FOREIGN KEY (productID) REFERENCES products(productID),
    orderName VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales(
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    saleDate DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products(productName,price) VALUES
('Apple AirPods Pro',249),
('Samsung SSD 1TB NVMe',129),
('Anker Power Bank 20,000mAh',59);

SELECT * FROM products;

INSERT INTO orders(productID,orderName,quantity,amount) VALUES
(1,'Apple',4,996),
(2,'Samsung',3,387),
(1,'Apple',2,498),
(2,'Samsung',4,516),
(3,'Anker Power',6,354);

SELECT * FROM orders;

INSERT INTO sales(orderID,saleDate,price) VALUES
(1,'2025-10-01',996),
(2,'2025-10-02',387),
(1,'2025-10-03',498),
(2,'2025-10-04',516),
(3,'2025-10-05',354),
(2,'2025-10-06',387),
(1,'2025-10-07',996);

SELECT * FROM sales;

SELECT 
COUNT(orderID) AS order_number,
SUM(price) AS total_revenue,
AVG(price) AS average_revenue
FROM sales;