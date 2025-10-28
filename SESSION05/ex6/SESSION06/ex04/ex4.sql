CREATE DATABASE thong_ke_doanh_so;
USE thong_ke_doanh_so;

CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(50) NOT NULL,
    customerEmail VARCHAR(250) NOT NULL
);

CREATE TABLE categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
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

CREATE TABLE order_details(
	orderID INT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
	productID INT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    quantily INT NOT NULL,
    price FLOAT(10,2) NOT NULL
);

INSERT INTO customers(customerName,customerEmail) VALUES
('Nguyễn Văn A','a.nguyen@email.com'),
('Trần Thị B','b.tran@email.com'),
('Lê Văn C','c.le@email.com');

SELECT * FROM customers;

INSERT INTO categories(category_name) VALUES
('Điện tử'),
('Thời trang'),
('Thực phẩm');

SELECT * FROM categories;

INSERT INTO orders(customerID,order_date) VALUES
(1,'2025-10-01'),
(2,'2025-10-05'),
(3,'2025-10-07');

SELECT * FROM orders;

INSERT INTO products(productName,price,category_id) VALUES
('Tivi Samsung 55"',1200,1),
('Áo sơ mi nam',350,2),
('Gói cà phê 500g',85,3);

SELECT * FROM products;

INSERT INTO order_details(orderID,productID,quantily,price) VALUES
(1,1,2,2400),
(1,3,2,170),
(2,2,5,1750),
(2,1,1,1200),
(3,3,10,850),
(3,2,10,3500);

SELECT * FROM order_details;

-- Tính tổng doanh thu của toàn bộ cửa hàng.
SELECT SUM(price) AS tong_doanh_thu FROM order_details;

-- Tính doanh thu trung bình của mỗi đơn hàng.

SELECT o.orderID, AVG(od.price) AS average_revenue_per_order
FROM orders AS o
INNER JOIN order_details AS od
ON o.orderID = od.orderID
GROUP BY o.orderID;

-- Tìm và hiển thị thông tin của đơn hàng có doanh thu cao nhất.
SELECT o.orderID, od.quantily, od.price
FROM orders AS o
INNER JOIN order_details AS od
ON o.orderID = od.orderID
WHERE od.price =
	(
		SELECT MAX(price) FROM order_details
    );
    
-- Tìm và hiển thị danh sách 3 sản phẩm bán chạy nhất dựa trên tổng số lượng đã bán.

SELECT p.productName, SUM(od.quantily) AS total_quantily
FROM products AS p
INNER JOIN order_details AS od
ON p.productID = od.productID
GROUP BY p.productName
ORDER BY total_quantily DESC
LIMIT 3;