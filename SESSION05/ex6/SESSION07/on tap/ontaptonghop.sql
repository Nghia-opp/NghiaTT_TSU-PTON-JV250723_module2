-- TAO CSDL 
CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;

create table students(
	student_id varchar(4) primary key,
    student_name varchar(100) not null,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phone_number varchar(45) unique
);

create table subjects(
	subject_id varchar(4) primary key,
    subject_name varchar(45) unique not null,
    priority int not null
);

create table marks(
	student_id varchar(4),
    subject_id varchar(4),
    point float not null,
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

-- Them du lieu 
INSERT INTO 
students (student_id,student_name,birthday,gender,address,phone_number) 
VALUES 
('S001','Nguyen The Anh','1999/1/11',1,'Ha Noi','0339513657'),
('S002','Dang Bao Tram','1998/1/11',0,'Lao Cai','0339513658'),
('S003','Tran Ha Phuong','2000/1/11',1,'Nghe An','0339513659');

insert into subjects (subject_id,subject_name,priority) values 
('MH01','Toan',2),
('MH02','Vat Ly',2),
('MH03','Hoa Hoc',1),
('MH04','Ngu Van',1),
('MH05','Anh',2);

-- them du lieu vao bang marks 
-- Nguyen The anh
insert into marks (student_id,subject_id,point) values 
('S001','MH01',8.5),
('S001','MH02',7),
('S001','MH03',9),
('S001','MH04',9),
('S001','MH05',5);
-- Dang bao tram 
insert into marks (student_id,subject_id,point) values 
('S002','MH01',9),
('S002','MH02',8),
('S002','MH03',6.5),
('S002','MH04',8),
('S002','MH05',6);
-- Tran Ha Phuong
insert into marks (student_id,subject_id,point) values 
('S003','MH01',7.5),
('S003','MH02',6.5),
('S003','MH03',8),
('S003','MH04',7),
('S003','MH05',7);

-- Cap nhat thong tin 

update subjects set subject_name = 'Ngoai Ngu', priority = 1 WHERE subject_id = 'MH05';

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh  
-- này ở bảng STUDENT.  
-- B1 Xoa bang marks 
DELETE FROM marks WHERE student_id = 'S001';
-- B2 Xoa bang sinh vien voi student_id = 'S001'
DELETE FROM students WHERE student_id = 'S001';

--  Truy vấn dữ liệu  
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm] 
SELECT * FROM students;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]   
SELECT subject_name,subject_id FROM subjects WHERE priority = 1;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ 
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]  

SELECT student_id, student_name, TIMESTAMPDIFF (YEAR,birthday,CURDATE()) as age FROM students;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn 
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]  

SELECT st.student_name,sb.subject_name,m.point as 'diem_toan'
FROM marks m
JOIN students st ON m.student_id = st.student_id
JOIN subjects sb ON sb.subject_id = m.subject_id
WHERE sb.subject_id = 'MH01' order by m.point DESC;
-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).  [4 
-- điểm]
SELECT 'Nam' as gioi_tinh, SUM(CASE WHEN gender = 1 THEN 1 ELSE 0 END) AS so_luong 
FROM students
union all
SELECT 'Nu' as gioi_tinh, SUM(CASE WHEN gender = 0 THEN 1 ELSE 0 END)  
FROM students;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm 
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]

SELECT s.student_id,s.student_name,sum(m.point) as tong_diem,round(avg(m.point),2) as diem_tb
FROM students s
JOIN marks m ON s.student_id = m.student_id 
group by s.student_id,s.student_name;

-- . Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học 
-- sinh, giới tính , quê quán . [3 điểm]   
create view STUDENT_VIEW
AS 
	SELECT student_id as ma_sv,student_name as ten_sv,
    CASE 
		WHEN gender = 1 THEN 'NAM'
        ELSE 'NU'
	END as
    gioi_tinh,address as dia_chi from students;

select * FROM STUDENT_VIEW;

CREATE VIEW AVERAGE_MARK_VIEW
AS 
SELECT s.student_id,s.student_name,round(avg(m.point),2) as diem_tb
FROM students s
JOIN marks m ON s.student_id = m.student_id 
group by s.student_id,s.student_name;

SELECT * FROM AVERAGE_MARK_VIEW;

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]  
alter table students ADD INDEX idx_phone_number(phone_number);