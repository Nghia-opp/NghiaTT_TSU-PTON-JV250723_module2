CREATE DATABASE san_pham_danh_muc;
USE san_pham_danh_muc;

CREATE TABLE categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(50) NOT NULL,
    price FLOAT(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_name) VALUES
('Smartphone'),
('Sport shoes'),
('Household appliances');

SELECT * FROM categories;

INSERT INTO products(productName,price,category_id) VALUES
('Apple iPhone 15 Pro Max',2500,1),
('Nike Air Zoom Pegasus 40',350,2),
('Panasonic Nanoe Hair Dryer EH-NA0J',500,3);

SELECT * FROM products;

UPDATE products
SET price = 450
WHERE productID = 2;

SELECT * FROM products;


DELETE FROM products WHERE productID = 2;
SELECT * FROM products;

SELECT productName
FROM products
ORDER BY price ASC;

SELECT c.category_name, COUNT(p.productName) AS total
FROM categories AS c
LEFT JOIN products AS p
ON c.category_id = p.productID
GROUP BY category_name;