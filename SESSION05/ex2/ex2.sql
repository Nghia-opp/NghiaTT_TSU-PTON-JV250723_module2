CREATE DATABASE quan_ly_doanh_thu;
USE quan_ly_doanh_thu;

CREATE TABLE products (
	productiID INT PRIMARY KEY AUTO_INCREMENT,
    productiName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales(
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    productiID INT NOT NULL,
    FOREIGN KEY (productiID) REFERENCES products(productiID),
    saleDate DATE NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO products(productiName, price) VALUES
('Galaxy Tab S9', 799),
('MX Master 3S Mouse', 99);

SELECT * FROM products;

INSERT INTO sales(productiID, saleDate, quantity, amount) VALUES
(1,'2025-10-01',3,2397),
(2,'2025-10-02',5,495),
(1,'2025-10-03',2,1598),
(2,'2025-10-04',4,396),
(1,'2025-10-05',1,799);

SELECT * FROM sales;
SELECT COUNT(saleID) AS 'total', productiID
FROM sales
GROUP BY productiID;


