create database thu_vien;
use thu_vien;

-- tao bang sach
create table sach(
	MaSach int primary key,
    TenSach varchar(100) not null unique,
    NamXuatBan date
);

create table TacGia(
	MaTacGia int primary key,
    TenTacGia varchar(100) not null
);

-- bang trung gian
create table Sach_TacGia(
	MaSach int,
    MaTacGia int,
    -- tao khoa ngoai
    foreign key (MaSach) references sach(MaSach),
    foreign key (MaTacGia) references TacGia(MaTacGia)
);

-- them du lieu vao sach
insert into sach (MaSach,TenSach,NamXuatBan) value (1,'ALICE IN WONDERLAND','2001-01-22');
insert into sach (MaSach,TenSach,NamXuatBan) value (2,'GONE WITH THE WIND','1952-09-04');
insert into sach (MaSach,TenSach,NamXuatBan) value (3,'GRIMM’S FAIRY STORIES','1812-12-20');

-- lay danh sach sach
SELECT * FROM sach;

-- them du lieu bang tac gia
insert into TacGia (MaTacGia,TenTacGia) value (1,' Charles Lutwidge Dodgson');
insert into TacGia (MaTacGia,TenTacGia) value (2,' Lewis Carroll');
insert into TacGia (MaTacGia,TenTacGia) value (3,' Margaret Mitchell');
insert into TacGia (MaTacGia,TenTacGia) value (4,' Brothers Grimm');

-- lay danh sach tac gia
SELECT * FROM TacGia;

-- them moi bang Sach_TacGia
INSERT INTO Sach_TacGia (MaSach,MaTacGia) VALUES 
(1,1),
(1,2),
(2,3),
(3,4);

-- lay danh sach sach
SELECT * FROM sach;
-- lay danh sach tac gia
SELECT * FROM TacGia;
-- lay danh sach Sach_TacGia
SELECT * FROM Sach_TacGia;

-- xoa thuoc tinh
-- DELETE FROM sach WHERE MaSach;
