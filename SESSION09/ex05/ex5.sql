USE `Chinook`;

-- Tạo VIEW
CREATE VIEW View_Album_Artist
AS 
SELECT 
	al.AlbumId,
    al.Title AS Album_Title,
    ar.Name AS Artist_Name
FROM album al
JOIN artist ar ON al.ArtistId = ar.ArtistId;

SELECT * FROM View_Album_Artist;

CREATE VIEW View_Customer_Spending
AS
SELECT
	c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email,
    inv.Total AS Total_Spending
FROM customer c
JOIN invoice inv ON c.CustomerId = inv.CustomerId;

SELECT * FROM View_Customer_Spending;

-- Tạo INDEX
CREATE INDEX idx_Employee_LastName ON employee(LastName);
EXPLAIN
SELECT * FROM employee WHERE LastName = 'KING';