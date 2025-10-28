CREATE DATABASE salesDB02;
USE salesDB02;

CREATE TABLE customers(
	customersID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customersID INT,
    FOREIGN KEY (customersID) REFERENCES customers(customersID),
    totalAmount DECIMAL(10,2) NOT NULL,
    orderDate DATE
);

CREATE TABLE orderItems(
	orderItemID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    productID INT NOT NULL,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantily INT,
    price DECIMAL(10,2)
);

CREATE INDEX idx_order ON orders(orderID);

INSERT INTO customers(firstName, lastName, email) VALUES
('Alice', 'Nguyen', 'alice.nguyen@example.com'),
('Bob', 'Tran', 'bob.tran@example.com'),
('Charlie', 'Le', 'charlie.le@example.com');

INSERT INTO products (productName, price) VALUES
('Laptop Dell XPS', 1200.00),
('iPhone 15 Pro', 999.99),
('Samsung Galaxy Tab', 650.50),
('Wireless Mouse', 25.75);

INSERT INTO orders (customersID, orderDate, totalAmount) VALUES
(1, '2025-10-01', 1225.75),
(2, '2025-10-02', 999.99),
(3, '2025-10-03', 676.25);

INSERT INTO orderItems (orderID, productID, quantily, price) VALUES
(1, 1, 1, 1200.00),
(1, 4, 1, 25.75),
(2, 2, 1, 999.99),
(3, 3, 1, 650.50),
(3, 4, 1, 25.75);

CREATE VIEW vw_OrderDetails AS
SELECT 
    o.orderID,
    o.orderDate,
    c.firstName,
    c.lastName,
    p.productName,
    oi.quantily,
    oi.price
FROM orders o
JOIN customers c ON o.customersID = c.customersID
JOIN orderItems oi ON o.orderID = oi.orderID
JOIN products p ON oi.productID = p.productID;

SELECT * FROM  vw_OrderDetails;
