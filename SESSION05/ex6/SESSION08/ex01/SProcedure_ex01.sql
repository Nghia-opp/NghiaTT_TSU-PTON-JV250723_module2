DELIMITER //

CREATE PROCEDURE GetCustomerTotalRevenue (
    IN inCustomerID INT,
    IN inStartDate DATE,
    IN inEndDate DATE,
    OUT outTotalRevenue DECIMAL(10,2)
)
BEGIN
    DECLARE tempRevenue DECIMAL(10,2);

    SELECT IFNULL(SUM(TotalAmount), 0)
    INTO tempRevenue
    FROM Sales
    WHERE CustomerID = inCustomerID
      AND SaleDate BETWEEN inStartDate AND inEndDate;

    SET outTotalRevenue = tempRevenue;
END //

DELIMITER ;

CALL GetCustomerTotalRevenue(101, '2025-01-01', '2025-12-31', @DoanhThu);
SELECT @DoanhThu AS TongDoanhThu;