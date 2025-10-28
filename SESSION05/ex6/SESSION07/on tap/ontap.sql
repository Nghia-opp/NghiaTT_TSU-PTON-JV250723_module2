CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;

CREATE TABLE student(
	student_id VARCHAR(4) PRIMARY KEY,
    student_name VARCHAR(4) NOT NULL,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phone_number varchar(45) unique
);

create table subjects(
	subject_id varchar(4) PRIMARY KEY,
    subject_name varchar(45) unique not null,
    priority int not null
);

create table marks(
	student_id VARCHAR(4),
    subject_id varchar(4),
    point float not null,
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

-- them du lieu
insert into student(student_id,student_name,birthday,gender,address,phone_number)
values 
('S001','NGUYEN THE ANH','1999-1-11',1,'HN','0330145524'),
('S002','DANG BAO TRAM','1998-1-11',0,'LAO CAI','0330554524'),
('S003','TRAN HA PHUONG','2000-1-11',0,'NGHE AN','03305544844');

-- chinh sua bang
alter table marks add column mh01 float not null;
alter table marks add column mh02 float not null;
alter table marks add column mh03 float not null;
alter table marks add column mh04 float not null;
alter table marks add column mh05 float not null;

-- xoa cot
alter table marks drop column mh01;
alter table marks drop column mh02;
alter table marks drop column mh03;
alter table marks drop column mh04;
alter table marks drop column mh05;

insert into subjects(subject_id,subject_name,priority)
values 
('MH01','Toan',2),
('MH02','Vat ly',2),
('MH03','Hoa Hoc',1),
('MH04','Ngu Van',1),
('MH05','Anh',2);

insert into marks(student_id,subject_id,point) values
('S001','MH01',8.5),
('S001','MH02',7),
('S001','MH03',9),
('S001','MH04',9),
('S001','MH05',5);

insert into marks(student_id,subject_id,point) values
('S002','MH01',9),
('S002','MH02',8),
('S002','MH03',6.5),
('S002','MH04',8),
('S002','MH05',6);

insert into marks(student_id,subject_id,point) values
('S003','MH01',7.5),
('S003','MH02',6.5),
('S003','MH03',8),
('S003','MH04',7),
('S003','MH05',7);

-- cap nhat thong tin
update subjects set subject_name = 'Ngoai Ngu', priority = 1 WHERE subject_id = 'MH05';

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh  
-- này ở bảng STUDENT.  
delete from marks where student_id = 'S003';
delete from student where student_id = 'S003';

-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm] 
select * from student;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm] 
select subject_id, subject_name from subjects where priority = 1;
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ 
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm] 
select student_id as ma_hs,student_name as ten_hs,
    birthday(year(curdate()- birthday) as age,
    gender(case when then,
    address,
    phone_number
-- hien thi thong tin hoc sinh bao gom: ma hoc sinh, ten hoc sinh, tuoi( bang nam hien tai tru
-- nam nam sinh)