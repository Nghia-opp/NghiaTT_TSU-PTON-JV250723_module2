CREATE DATABASE min_max_sp;
USE min_max_sp;

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products(productName,price) VALUES
('Apple iPhone 15 Pro',999),
('Sony WH-1000XM5 Headphones',399),
('Dell XPS 13 Laptop',1199),
('Nintendo Switch OLED',349),
('Seagate 2TB External HDD',79);

SELECT * FROM products;

SELECT
MAX(price) AS 'max_price_product',
MIN(price) AS 'min_price_product'
FROM products;