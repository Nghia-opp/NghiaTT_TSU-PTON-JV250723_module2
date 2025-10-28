CREATE DATABASE khach_hang_va_don_hang;
USE khach_hang_va_don_hang;

CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(50) NOT NULL,
    customerEmail VARCHAR(250) NOT NULL
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID),
    order_date DATE NOT NULL
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price FLOAT(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

CREATE TABLE order_details(
	orderID INT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
	productID INT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantily INT NOT NULL,
    price FLOAT(10,2) NOT NULL
);

INSERT INTO customers(customerName,customerEmail) VALUES
('Nguyễn Văn A','nguyena@example.com'),
('Trần Thị B','tranb@example.com'),
('Lê Hoàng C','lehoangc@example.com');

SELECT * FROM customers;

INSERT INTO orders(customerID,order_date) VALUES
(1,'2025-10-01'),
(2,'2025-10-03'),
(1,'2025-10-05'),
(3,'2025-10-05'),
(1,'2025-10-07'),
(2,'2025-10-10'),
(3,'2025-10-10'),
(1,'2025-10-12'),
(2,'2025-10-15'),
(3,'2025-10-15');
SELECT * FROM orders;

INSERT INTO categories(category_name) VALUES
('Smartphone'),
('Sport Shoes'),
('Household Appliances');
SELECT * FROM categories;

INSERT INTO products(productName,price,category_id) VALUES
('Apple iPhone 15 Pro Max','2500',1),
('Samsung Galaxy S23 Ultra','2200',1),
('Nike Air Zoom Pegasus 40','350',2),
('Adidas Ultraboost Light','400',2),
('Panasonic Nanoe Hair Dryer EH-NA0J','500',3);
SELECT * FROM products;

INSERT INTO order_details(orderID,productID,quantily,price) VALUES
(1,1,2,5000),
(1,3,2,700),
(2,2,4,8800),
(2,4,3,1200),
(3,5,2,1000),
(3,1,1,2500),
(4,3,2,700),
(4,2,1,2200),
(5,3,5,1700),
(6,4,2,800),
(6,5,5,5000),
(7,1,1,2500),
(8,2,2,4400),
(8,5,2,1000),
(9,4,12,4800),
(10,5,7,3500),
(10,1,5,12500);

SELECT * FROM order_details;

-- Thêm 2 khách hàng mới vào bảng customers
INSERT INTO customers(customerName,customerEmail) VALUES
('Phạm Minh D','phamd@example.com'),
('Hoàng Lan E','hoangl@example.com');
SELECT * FROM customers;

-- Liệt kê những khách hàng đã có ít nhất một đơn hàng.
SELECT c.customerID, c.customerName, c.customerEmail, COUNT(o.orderID) AS so_luong_don_hang
FROM customers AS c 
INNER JOIN orders AS o
ON c.customerID = o.customerID
GROUP BY c.customerID, c.customerName, c.customerEmail;


-- Tìm những khách hàng chưa từng đặt đơn hàng nào.
SELECT c.customerID, c.customerName, c.customerEmail, COUNT(o.orderID) AS so_luong_don_hang
FROM customers AS c 
LEFT JOIN orders AS o
ON c.customerID = o.customerID
WHERE o.orderID IS NULL;


-- Tính toán tổng doanh thu mà mỗi khách hàng đã mang lại
SELECT c.customerID, c.customerName, SUM(od.price) AS tong_doanh_thu
FROM customers AS c 
LEFT JOIN orders AS o ON c.customerID = o.customerID
LEFT JOIN order_details AS od ON o.orderID = od.orderID
GROUP BY c.customerID, c.customerName;

-- Xác định khách hàng đã mua sản phẩm có giá cao nhất.
SELECT c.customerID, c.customerName, p.productName, p.price
FROM customers AS c 
INNER JOIN orders AS o ON c.customerID = o.customerID
INNER JOIN order_details AS od ON o.orderID = od.orderID
INNER JOIN products AS p ON od.productID = p.productID
WHERE p.price =
	(
		SELECT MAX(price) FROM products
    )
;


