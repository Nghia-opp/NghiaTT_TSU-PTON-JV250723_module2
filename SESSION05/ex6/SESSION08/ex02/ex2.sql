CREATE DATABASE IF NOT EXISTS SalesDB_ex02;
USE SalesDB_ex02;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100)
);
CREATE INDEX idx_customers_email ON Customers(Email);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PromotionID INT
);
CREATE INDEX idx_products_price ON Products(Price);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    DiscountPercentage INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE INDEX idx_orders_customer_date ON Orders(CustomerID, OrderDate);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    SaleDate DATETIME,
    SaleAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE INDEX idx_sales_customer_date ON Sales(CustomerID, SaleDate);

DELIMITER //

CREATE PROCEDURE AddNewCustomer (
    IN inFirstName VARCHAR(50),
    IN inLastName VARCHAR(50),
    IN inEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email)
    VALUES (inFirstName, inLastName, inEmail);
END //

DELIMITER ;

CALL AddNewCustomer('Nguyen', 'Van A', 'vana@example.com');