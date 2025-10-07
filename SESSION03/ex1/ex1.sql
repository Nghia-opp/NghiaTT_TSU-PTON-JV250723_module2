-- tao csdl qlbh
CREATE SCHEMA Quan_Ly_Cua_Hang;
use Quan_Ly_Cua_Hang;

 
CREATE TABLE KhachHang(
	MaKH int primary key,
    TenKH varchar(50) not null,
    NgaySinh date,
    DiaChi varchar(100)
 );
 -- CRUD (CREATE-INSERT INTO, R-SSELECT,U-UPDATE,D-DELETE
 -- cau lenh them moi vao bang
INSERT INTO KhachHang(MaKH,TenKH,NgaySinh,DiaChi) VALUE (1,'Thu Phuokhachhangng','2000-12-05','Ha Noi');
INSERT INTO KhachHang(MaKH,TenKH,NgaySinh,DiaChi) VALUES 
(2,'Thu Hang','2001-01-05','Hai Duong'),
(3,'Hai','2002-08-15','Hai Phong');
