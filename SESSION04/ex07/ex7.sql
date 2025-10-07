CREATE DATABASE QuanLyDonHang;
USE QuanLyDonHang;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    joinDate DATE
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    orderDate DATETIME,
    totalAmount decimal(10,2) NOT NULL
);

INSERT INTO Customers (name,email,joinDate) VALUES 
('Nguyen Van A','a.nguyen@example.com','2025-09-15'),
('Tran Thi B','b.tran@example.com','2025-09-21'),
('Le Van C','c.le@example.com','2025-10-02'),
('Pham Thi D','d.pham@example.com','2025-09-12');

SELECT * FROM Customers;

INSERT INTO Orders (CustomerID,orderDate,totalAmount) VALUES
(1,'2025-10-02 10:30:00',150),
(2,'2025-10-03 14:25:10',50),
(3,'2025-10-01 09:30:20',250),
(1,'2025-10-02 17:40:50',550),
(4,'2025-10-04 11:56:22',80);

SELECT * FROM Orders;

-- Update:

UPDATE Orders
SET totalAmount = 350
WHERE OrderID = 3;

SELECT * FROM Orders;

UPDATE Customers
SET email = 'bAOBINHtran@example.com'
WHERE CustomerID = 2;

SELECT * FROM Customers;

-- Delete:

DELETE FROM Orders WHERE CustomerID = 4;
DELETE FROM Customers WHERE CustomerID = 4;

SELECT * FROM Customers;

DELETE FROM Orders WHERE OrderID = 1;
SELECT * FROM Orders;

SELECT * FROM Orders;
SELECT CustomerID, SUM(totalAmount)
FROM Orders
GROUP BY CustomerID;