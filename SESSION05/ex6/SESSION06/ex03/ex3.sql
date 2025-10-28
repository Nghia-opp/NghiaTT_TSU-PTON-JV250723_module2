CREATE DATABASE san_pham_nang_cao;
USE san_pham_nang_cao;

CREATE TABLE categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price FLOAT(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_name) VALUES
('Smartphone'),
('Sport Shoes'),
('Household Appliances'),
('Electronics'),
('Kitchenware');

INSERT INTO products(productName,price,category_id) VALUES
('Apple iPhone 15 Pro Max',2500,1),
('Nike Air Zoom Pegasus 40',350,2),
('Panasonic Nanoe Hair Dryer EH-NA0J',500,3),
('Sony WH-1000XM5 Noise Cancelling Headphones',750,4),
('Lock&Lock Ceramic Non-Stick Frying Pan',120,5),
('Samsung Galaxy S23 Ultra',2200,1),
('Xiaomi 13T Pro',1600,1),
('Adidas Ultraboost Light',400,2),
('Puma Velocity Nitro 2',320,2),
('LG Smart Inverter Washing Machine 9kg',820,3),
('Sharp Plasmacluster Air Purifier FP-J80EV-H',780,3),
('Logitech MX Master 3S Wireless Mouse',280,4),
('Kindle Paperwhite Signature Edition',420,4),
('Philips HD9252 Air Fryer',320,5),
('Elmich SmartCook IH-3870 Induction Cooker',290,5);

SELECT * FROM categories;
SELECT * FROM products;

-- Tìm các sản phẩm có giá nằm trong một khoảng cụ thể.
SELECT * FROM products WHERE price BETWEEN 250 AND 1000;

-- Tìm các sản phẩm có tên chứa một chuỗi ký tự nhất định.
SELECT * FROM products WHERE productName LIKE '%d%y%';

-- Tính giá trung bình của sản phẩm cho mỗi danh mục.
SELECT c.category_name, AVG(p.price) AS gia_trung_binh
FROM categories AS c
INNER JOIN products AS p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- Tìm những sản phẩm có giá cao hơn mức giá trung bình của toàn bộ sản phẩm.
SELECT c.category_name,p.productName, p.price
FROM categories AS c
INNER JOIN products AS p
ON c.category_id = p.category_id
WHERE p.price > 
	(
		SELECT AVG(price) FROM products
    );
    
-- Tìm sản phẩm có giá thấp nhất cho từng danh mục.
SELECT c.category_name,p.productName, p.price
FROM categories AS c
INNER JOIN products AS p
ON c.category_id = p.category_id
WHERE p.price =
	(
		SELECT MIN(pp.price) 
        FROM products AS pp
        WHERE c.category_id = pp.category_id
    );