CREATE DATABASE IF NOT EXISTS SalesDB_ex04;
USE SalesDB_ex04;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
CREATE INDEX idx_customers_email ON Customers(Email);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    PromotionID INT
);
CREATE INDEX idx_products_price ON Products(Price);

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
    OrderID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
CREATE INDEX idx_sales_order_date ON Sales(OrderID, SaleDate);

DELIMITER //

CREATE PROCEDURE DeleteOrderAndSales (
    IN inOrderID INT
)
BEGIN
    -- Xóa bản ghi liên quan trong bảng Sales
    DELETE FROM Sales
    WHERE OrderID = inOrderID;

    -- Xóa đơn hàng trong bảng Orders
    DELETE FROM Orders
    WHERE OrderID = inOrderID;
END //

DELIMITER ;

CALL DeleteOrderAndSales(1001);