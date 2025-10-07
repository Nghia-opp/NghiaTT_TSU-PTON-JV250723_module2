CREATE DATABASE QuanLySanPham;
USE QuanLySanPham;

CREATE TABLE Suppliers(
	SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL UNIQUE,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    price DECIMAL(10,2) NOT NULL,
    stock 	INT NOT NULL
);

INSERT INTO Suppliers (SupplierName,contactEmail) VALUES
('TechNova Co.','contact@technova.com'),
('GreenLeaf Supplies','info@greenleafsupplies.com'),
('Skyline Traders','sales@skylinetraders.com');

SELECT * FROM Suppliers;

INSERT INTO Products (ProductName,SupplierID,price,stock) VALUES
('Wireless Mouse',1,20,150),
('Mechanical Keyboard',2,85,50),
('USB-C Hub',3,40,200),
('27-inch Monitor',2,50,44);

SELECT * FROM Products;

-- Update:

UPDATE Products
SET price = 45.99
WHERE ProductID = 2;

SELECT * FROM Products;

UPDATE Suppliers
SET SupplierName = 'NovaTech Solutions'
WHERE SupplierID = 1;

SELECT * FROM Suppliers;

-- Delete:

DELETE FROM Products WHERE SupplierID = 3;
DELETE FROM Suppliers WHERE SupplierID = 3;

SELECT * FROM Suppliers;

DELETE FROM Products WHERE ProductID = 4;
SELECT * FROM Products;
