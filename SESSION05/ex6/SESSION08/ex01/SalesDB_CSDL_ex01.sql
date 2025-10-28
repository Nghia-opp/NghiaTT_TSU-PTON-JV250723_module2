CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
CREATE INDEX idx_customer_email ON Customers(Email);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    PromotionID INT
);
CREATE INDEX idx_product_price ON Products(Price);


CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100),
    DiscountPercentage DECIMAL(5,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE INDEX idx_orders_customer_date ON Orders(CustomerID, OrderDate);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    TotalAmount DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE INDEX idx_sales_customer_date ON Sales(CustomerID, SaleDate);