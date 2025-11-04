CREATE DATABASE LateUpdated;
USE LateUpdated;

CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    LastUpdated DATETIME
);

DELIMITER $$

CREATE TRIGGER AfterProductUpdateSetDate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    UPDATE Products
    SET LastUpdated = NOW()
    WHERE productID = NEW.productID;
END$$

DELIMITER ;