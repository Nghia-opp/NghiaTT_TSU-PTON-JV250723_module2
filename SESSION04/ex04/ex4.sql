CREATE DATABASE INSERTBASIC;
USE INSERTBASIC;

-- exercise01

CREATE TABLE Students(
	 StudentID INT PRIMARY KEY AUTO_INCREMENT,
     Name VARCHAR(50),
     Age FLOAT CHECK (Age > 0),
     Major VARCHAR(100)
);

INSERT INTO Students (Name,Age,Major) VALUES
('Alice',20,'Computer Science'),
('Bob',22,'Mathematics'),
('Charlie',21,'Physics');

SELECT * FROM Students;

-- exercise02

UPDATE Students 
SET Age = 23
WHERE StudentID = 2;

SELECT * FROM Students;

-- exercise03

DELETE FROM Students WHERE StudentID = 1;

SELECT * FROM Students;

-- exercise04
INSERT INTO Students (Name,Age,Major) VALUES
('Alice',20,'Computer Science'),
('Bob',22,'Mathematics'),
('Charlie',21,'Physics');

SELECT * FROM Students;
