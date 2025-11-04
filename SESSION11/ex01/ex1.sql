CREATE DATABASE transaction_01;
USE transaction_01;

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

DELIMITER $$

CREATE PROCEDURE TransferFunds (
    IN senderID INT,
    IN receiverID INT,
    IN transferAmount DECIMAL(10,2)
)
BEGIN
    DECLARE senderBalance DECIMAL(10,2);

    -- Bắt đầu transaction
    START TRANSACTION;

    -- Kiểm tra số dư tài khoản nguồn
    SELECT balance INTO senderBalance
    FROM Accounts
    WHERE accountID = senderID
    FOR UPDATE;

    IF senderBalance < transferAmount THEN
        -- Nếu không đủ tiền, rollback và báo lỗi
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số dư tài khoản không đủ để thực hiện giao dịch.';
    ELSE
        -- Trừ tiền tài khoản nguồn
        UPDATE Accounts
        SET balance = balance - transferAmount
        WHERE accountID = senderID;

        -- Cộng tiền tài khoản đích
        UPDATE Accounts
        SET balance = balance + transferAmount
        WHERE accountID = receiverID;

        -- Ghi nhận giao dịch
        INSERT INTO Transactions (
            fromAccountID,
            toAccountID,
            amount,
            transactionDate
        )
        VALUES (
            senderID,
            receiverID,
            transferAmount,
            NOW()
        );

        -- Hoàn tất transaction
        COMMIT;
    END IF;
END$$

DELIMITER ;

