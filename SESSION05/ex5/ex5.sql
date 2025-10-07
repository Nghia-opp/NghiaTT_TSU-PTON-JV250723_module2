CREATE DATABASE sp_ban_chay;
USE sp_ban_chay;

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL
);

CREATE TABLE orderDetails(
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT NOT NULL,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantily INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products(productName) VALUES
('Apple AirPods Pro'),
('Logitech MX Keys Keyboard'),
('Samsung SSD 1TB NVMe'),
('Kindle Paperwhite'),
('Anker Power Bank 20,000mAh');

SELECT * FROM products;

INSERT INTO orderDetails(productID,quantily,price) VALUES
(1,4,996),
(2,2,218),
(3,3,387),
(4,5,695),
(5,6,354);

SELECT * FROM orderDetails;

SELECT p.productName, q.quantily FROM products AS p
INNER JOIN orderDetails AS q
ON p.productID = q.productID
GROUP BY q.quantily
ORDER BY q.quantily DESC;
