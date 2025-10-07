CREATE DATABASE quan_ly_don_hang;
USE quan_ly_don_hang;

CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATE NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

INSERT INTO customers (customerName,contactEmail) VALUES
('Nguyen Van Hung','nguyenvanh@example.com'),
('Tran Thi Hoa','tranthih@example.com'),
('Nguyen Truong Minh','nguyentruongm@example.com');

SELECT * FROM customers;

INSERT INTO orders (customerID,orderDate,totalAmount) VALUES
(1,'2025-09-15',250),
(2,'2025-10-01',150),
(1,'2025-09-29',500),
(2,'2025-10-05',50);

SELECT c.customerName, c.contactEmail, o.orderDate, o.totalAmount FROM customers AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID;