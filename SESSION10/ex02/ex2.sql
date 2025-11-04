CREATE  DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT
);

CREATE TABLE InventoryChanges (
    changeID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    oldQuantity INT,
    newQuantity INT,
    changeDate DATETIME,
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

INSERT INTO Products (productID, productName, quantity)
VALUES 
    (1, 'USB 64GB', 5),
    (2, 'Chuột không dây', 15);

INSERT INTO Products (productID, productName, quantity)
VALUES 
    (1, 'USB 64GB', 5),
    (2, 'Chuột không dây', 15);

DELETE FROM Products WHERE productID = 1;

DELIMITER $$

CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    IF OLD.quantity > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa sản phẩm có số lượng lớn hơn 10.';
    END IF;
END$$

DELIMITER ;

DELETE FROM Products WHERE productID = 1;

