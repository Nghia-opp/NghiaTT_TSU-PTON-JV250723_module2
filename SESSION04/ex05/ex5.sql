CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Students(
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL,
    marjor VARCHAR(50) NOT NULL
);

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    instructor VARCHAR(50) NOT NULL
);

INSERT INTO Students (StudentName,marjor) VALUES
('Kevin Nguyen','Mathematics'),
('Sophie Tran','History'),
('Nathan Le','Information Technology'),
('Anna Pham','Mathematics');

INSERT INTO Courses (CourseName,instructor) VALUES 
('Introduction to Mathematics','Dr. Emily Carter'),
('World History Overview','Prof. James Whitman'),
('Fundamentals of Information Technology','Ms. Olivia Chen');

SELECT * FROM Students;
SELECT * FROM Courses;

INSERT INTO Student_Course(StudentID,CourseID) VALUES
(1,1),
(2,2),
(3,3),
(4,1);

SELECT *FROM Student_Course;

-- U - Cập nhật
UPDATE Students 
SET marjor = 'Engineering'
WHERE StudentID = 3;

SELECT * FROM Students;

UPDATE Courses 
SET CourseName = 'Advanced Mathematics'
WHERE CourseID = 2;

SELECT * FROM Courses;

-- D - XOÁ

DELETE FROM Students WHERE StudentID = 1;
SELECT * FROM Students;

DELETE FROM Courses WHERE CourseID = 3;
SELECT * FROM Courses;
