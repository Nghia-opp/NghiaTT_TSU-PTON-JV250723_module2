CREATE DATABASE accountsTransactions;
USE accountsTransactions;

CREATE TABLE Accounts (
    accountID INT PRIMARY KEY,
    balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    transactionID INT AUTO_INCREMENT PRIMARY KEY,
    fromAccountID INT NOT NULL,
    toAccountID INT NOT NULL,
    amount DECIMAL(10,2),
    transactionDate DATETIME,
    FOREIGN KEY (fromAccountID) REFERENCES Accounts(accountID),
    FOREIGN KEY (toAccountID) REFERENCES Accounts(accountID)
);

CREATE TABLE Budgets (
    budgetID INT AUTO_INCREMENT PRIMARY KEY,
    accountID INT,
    category VARCHAR(50),
    `limit` DECIMAL(10,2),
    FOREIGN KEY (accountID) REFERENCES Accounts(accountID)
);

CREATE TABLE Expenses (
    expenseID INT AUTO_INCREMENT PRIMARY KEY,
    accountID INT,
    category VARCHAR(50),
    amount DECIMAL(10,2),
    expenseDate DATETIME,
    FOREIGN KEY (accountID) REFERENCES Accounts(accountID)
);


DELIMITER $$

CREATE PROCEDURE SpendFromAccount (
    IN accID INT,
    IN spendCategory VARCHAR(50),
    IN spendAmount DECIMAL(10,2)
)
BEGIN
    DECLARE currentBalance DECIMAL(10,2);
    DECLARE currentLimit DECIMAL(10,2);

    -- Bắt đầu transaction
    START TRANSACTION;

    -- Lấy số dư tài khoản
    SELECT balance INTO currentBalance
    FROM Accounts
    WHERE accountID = accID
    FOR UPDATE;

    -- Kiểm tra số dư đủ chi tiêu
    IF currentBalance < spendAmount THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số dư tài khoản không đủ để chi tiêu.';
    ELSE
        -- Trừ tiền khỏi tài khoản
        UPDATE Accounts
        SET balance = balance - spendAmount
        WHERE accountID = accID;

        -- Ghi nhận chi tiêu
        INSERT INTO Expenses (accountID, category, amount, expenseDate)
        VALUES (accID, spendCategory, spendAmount, NOW());

        -- Cập nhật ngân sách nếu tồn tại
        SELECT `limit` INTO currentLimit
        FROM Budgets
        WHERE accountID = accID AND category = spendCategory
        FOR UPDATE;

        IF currentLimit IS NOT NULL THEN
            UPDATE Budgets
            SET `limit` = `limit` - spendAmount
            WHERE accountID = accID AND category = spendCategory;
        END IF;

        -- Hoàn tất transaction
        COMMIT;
    END IF;
END$$

DELIMITER ;

INSERT INTO Accounts VALUES (1, 1000.00);
INSERT INTO Budgets (accountID, category, `limit`) VALUES (1, 'Ăn uống', 300.00);

CALL SpendFromAccount(1, 'Ăn uống', 150.00);