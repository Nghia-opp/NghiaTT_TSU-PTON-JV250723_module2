CREATE DATABASE so_luong_sp;
USE so_luong_sp;

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
    (1, 'USB 64GB', 100),
    (2, 'Chuột không dây', 50),
    (3, 'Bàn phím cơ', 30);

INSERT INTO InventoryChanges (productID, oldQuantity, newQuantity, changeDate)
VALUES 
    (1, 100, 120, NOW()),
    (2, 50, 45, NOW());
    
DELIMITER $$

CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.quantity <> NEW.quantity THEN
        INSERT INTO InventoryChanges (
            productID,
            oldQuantity,
            newQuantity,
            changeDate
        )
        VALUES (
            NEW.productID,
            OLD.quantity,
            NEW.quantity,
            NOW()
        );
    END IF;
END$$

DELIMITER ;

UPDATE Products
SET quantity = 120
WHERE productID = 1;

SELECT * FROM InventoryChanges;