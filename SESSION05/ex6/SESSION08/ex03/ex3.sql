CREATE DATABASE IF NOT EXISTS SalesDB_ex03;
USE SalesDB_ex03;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
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
    DiscountPercentage DECIMAL(5,2)
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
    SaleDate DATE,
    SaleAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE INDEX idx_sales_customer_date ON Sales(CustomerID, SaleDate);

DELIMITER //

CREATE PROCEDURE UpdateOrderTotalAmount (
    IN inOrderID INT,
    IN inNewTotalAmount DECIMAL(10,2)
)
BEGIN
    UPDATE Orders
    SET TotalAmount = inNewTotalAmount
    WHERE OrderID = inOrderID;
END //

DELIMITER ;

CALL UpdateOrderTotalAmount(1001, 299.99);