create database QuanLyCuaHang;
use QuanLyCuaHang;

create table SanPham(
	MaSP int primary key auto_increment,
    TenSP varchar(100) not null,
    Gia decimal(10,2),
    SoLuongTon int default 0 -- giá trị mặc định là 0
);

INSERT INTO SanPham(TenSP,Gia) value ('Ao caro',100);
INSERT INTO SanPham(TenSP,Gia) value ('quan kaki',50);
INSERT INTO SanPham(TenSP,Gia,SoLuongTon) value ('quan jean',100,10);

-- lay ra tat ca san pham
SELECT * FROM SanPham;

-- lay ra san pham co gia lon hon 50
SELECT * FROM SanPham WHERE Gia > 50;

ALTER TABLE SanPham
ADD MoTa varchar(255);
