CREATE DATABASE salesDB;
USE salesDB;

CREATE TABLE customers(
	customersID INT PRIMARY KEY AUTO_INCREMENT,
    customersName VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    createdAt datetime
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customersID INT,
    FOREIGN KEY (customersID) REFERENCES customers(customersID),
    totalAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orderDetails(
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    productID INT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantily INT NOT NULL,
    unitPrice DECIMAL(10,2) NOT NULL
);

-- exercise01
ALTER TABLE customers ADD email VARCHAR(255);
CREATE INDEX idx_email ON customers(email); 
ALTER TABLE orders ADD orderDate DATETIME;
CREATE INDEX idx_date ON orders(orderDate);

INSERT INTO customers(customersName,phone,createdAt,email) VALUES
('Andrew','0901234567','2025-10-01 08:30:00','AD@gmail.com'),
('Bella','0902345678','2025-10-02 09:15:00','bella145@gmail.com'),
('Charles','0903456789','2025-10-03 10:00:00','charl758@gmail.com');

SELECT * FROM customers;

INSERT INTO orders(customersID,totalAmount,orderDate) VALUES
(1, 2570, '2025-10-05'),
(2, 1550, '2025-10-06'),
(3, 3585, '2025-10-07');

SELECT * FROM orders;

INSERT INTO products(productName,category,price) VALUES
('Tivi Samsung 55"', 'Điện tử', 1200.00),
('Áo sơ mi nam', 'Thời trang', 350.00),
('Gói cà phê 500g', 'Thực phẩm', 85.00);

SELECT * FROM products;

INSERT INTO orderDetails(orderID,productID,quantily,unitPrice) VALUES
(1, 1, 2, 1200),
(1, 3, 2, 85),
(2, 2, 5, 350),  
(3, 3, 10, 85),  
(3, 2, 10, 350);

SELECT * FROM orderDetails;
-- exercise02

CREATE VIEW customerOrders
AS
SELECT o.orderID,c.customersName,o.orderDate,o.totalAmount
FROM orders AS o
INNER JOIN customers AS c
ON o.customersID = c.customersID;

SELECT * FROM customerOrders;
