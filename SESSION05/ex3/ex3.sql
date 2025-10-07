CREATE DATABASE quan_ly_nhan_vien;
USE quan_ly_nhan_vien;

CREATE TABLE departments(
	departmentID INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(50) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE employeeSalaries(
	employeeID INT PRIMARY KEY AUTO_INCREMENT,
    departmentID INT NOT NULL,
    FOREIGN KEY (departmentID) REFERENCES departments(departmentID),
    salary DECIMAL(10,2) NOT NULL
);

INSERT INTO departments(departmentName,quantity) VALUES
('Phòng Kỹ thuật',12),
('Phòng Kinh doanh',8),
('Phòng Nhân sự',5)	;

SELECT * FROM departments;

INSERT INTO employeeSalaries(departmentID,salary) VALUES
(1,36000),
(2,28000),
(3,15000);

SELECT * FROM employeeSalaries;

SELECT departmentID, SUM(salary) AS 'total_salary', AVG (salary) AS 'average_salary'
FROM employeeSalaries
GROUP BY departmentID;

