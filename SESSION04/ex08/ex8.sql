CREATE DATABASE QuanLyHoaDon;
USE QuanLyHoaDon;

CREATE TABLE Invoices(
	InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    InvoiceDate DATETIME,
    customerName VARCHAR(100) NOT NULL
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE InvoiceDetails(
	DetailID INT PRIMARY KEY AUTO_INCREMENT,
	InvoiceID INT,
    ProductID INT,
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	quantily INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO Invoices (InvoiceDate,customerName) VALUES
('2025-10-01 10:15:25','DEVIL'),
('2025-10-03 14:45:57','CALI');

SELECT * FROM Invoices;

INSERT INTO Products (ProductName,price) VALUES
('Bluetooth Speaker','49.99'),
('Gaming Headset','79.5'),
('Portable SSD 1TB','129');

SELECT * FROM Products;

INSERT INTO InvoiceDetails (InvoiceID,ProductID,quantily,price) VALUES
(1,1,2,'99.98'),
(2,2,1,'79.5'),
(2,1,1,'49.99'),
(1,3,2,'258');

SELECT * FROM InvoiceDetails;

-- Update:

UPDATE Products
SET price = 55
WHERE ProductID = 1;

SELECT * FROM Products;

UPDATE InvoiceDetails
SET quantily = 10
WHERE DetailID = 2;

UPDATE InvoiceDetails
SET price = 795
WHERE DetailID = 2;

SELECT * FROM InvoiceDetails;

