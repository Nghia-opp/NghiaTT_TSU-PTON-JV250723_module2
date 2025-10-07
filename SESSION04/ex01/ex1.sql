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

