CREATE DATABASE QL_Cua_Hang_Ban_DT
GO

USE QL_Cua_Hang_Ban_DT
GO

-- Create table
CREATE TABLE Hang(
	MaHang VARCHAR(20) NOT NULL,
	TenHang NVARCHAR(50) ,
	PRIMARY KEY(MaHang)

)
GO

CREATE TABLE NhaCungCap(
	MaNhaCungCap VARCHAR(20) NOT NULL,
	TenNhaCungCap NVARCHAR(100),
	SDT	NVARCHAR(20),
	DiaChiNCC NVARCHAR(100),

	PRIMARY KEY(MaNhaCungCap)
)
GO

CREATE TABLE SanPham(
	MaSanPham VARCHAR(20) NOT NULL,
	TenSanPham NVARCHAR(50),
	Gia DECIMAL,
	SoLuong INT,
	MaNhaCungCap VARCHAR(20),
	MaHang VARCHAR(20)

	PRIMARY KEY(MaSanPham)
)
GO

CREATE TABLE NhanVien(
	MaNhanVien VARCHAR(20) NOT NULL,
	TenNhanVien NVARCHAR(50),
	NamSinhNV INT,
	GioiTinh BIT NOT NULL,
	SDT NVARCHAR(10),
	DiaChi NVARCHAR(100)

	PRIMARY KEY(MaNhanVien)
)
GO

CREATE TABLE KhachHang(
	MaKhachHang VARCHAR(20) NOT NULL,
	TenKhachHang NVARCHAR(70),
	NamSinhKH INT,
	DiaChiKH NVARCHAR(100),
	GioiTinh BIT NOT NULL,
	SDT NVARCHAR(10),
	MaNhanVien VARCHAR(20)

	PRIMARY KEY(MaKhachHang)
)
GO

CREATE TABLE HoaDon(
	MaHoaDon VARCHAR(20) NOT NULL,
	TongTien DECIMAL,
	Ngay DATE,
	TienShip DECIMAL,
	DiaChi NVARCHAR(100),
	MaKhachHang VARCHAR(20),
	MaGG VARCHAR(20)

	PRIMARY KEY(MaHoaDon)
)
GO

CREATE TABLE ChiTietHoaDon(
	MaChiTietHD VARCHAR(20) NOT NULL,
	SoLuong INT,
	ThanhTien DECIMAL,
	MaSanPham VARCHAR(20),
	MaHoaDon VARCHAR(20)

	PRIMARY KEY(MaChiTietHD)
)
GO

CREATE TABLE MaGiamGia(
	MaGG VARCHAR(20) NOT NULL,
	SoLuong INT,
	SotienGiam DECIMAL,
	Code INT,
	HanSuDung DATE

	PRIMARY KEY(MaGG)
)
GO
------------------------------------------------------------------------------------

-- set up foreign key
ALTER TABLE dbo.SanPham ADD FOREIGN KEY(MaHang) REFERENCES dbo.Hang
ALTER TABLE dbo.SanPham ADD FOREIGN KEY(MaNhaCungCap) REFERENCES dbo.NhaCungCap
ALTER TABLE dbo.KhachHang ADD FOREIGN KEY(MaNhanVien) REFERENCES dbo.NhanVien
ALTER TABLE dbo.HoaDon ADD FOREIGN KEY(MaKhachHang) REFERENCES dbo.KhachHang
ALTER TABLE dbo.HoaDon ADD FOREIGN KEY(MaGG) REFERENCES dbo.MaGiamGia
ALTER TABLE dbo.ChiTietHoaDon ADD FOREIGN KEY(MaSanPham) REFERENCES dbo.SanPham
ALTER TABLE dbo.ChiTietHoaDon ADD FOREIGN KEY(MaHoaDon) REFERENCES dbo.HoaDon
GO
------------------------------------------------------------------------------------

-- set up constraint
ALTER TABLE dbo.SanPham ADD CONSTRAINT check_gia_sl_sp CHECK (Gia >= 0 AND SoLuong >= 0)
ALTER TABLE dbo.NhanVien ADD CONSTRAINT check_namsinhNV CHECK (NamSinhNV < YEAR(GETDATE()))
ALTER TABLE dbo.MaGiamGia ADD CONSTRAINT check_sl_tien_mgg CHECK (SoLuong >= 0 AND SotienGiam >= 0)
ALTER TABLE dbo.KhachHang ADD CONSTRAINT check_namsinhKH CHECK (NamSinhKH < YEAR(GETDATE()))
ALTER TABLE dbo.HoaDon ADD CONSTRAINT check_tongtien_tienship CHECK (TongTien >= 0 AND TienShip >= 0)
------------------------------------------------------------------------------------

-- Insert data into table
--Hãng
INSERT INTO dbo.Hang(MaHang,TenHang ) VALUES  ( 'MH01' ,N'Apple')
INSERT INTO dbo.Hang VALUES  ( 'MH02' ,N'Samsung')
INSERT INTO dbo.Hang VALUES  ( 'MH03' ,N'Realme')
INSERT INTO dbo.Hang VALUES  ( 'MH04' ,N'Oppo')
INSERT INTO dbo.Hang VALUES  ( 'MH05' ,N'VSmart')
INSERT INTO dbo.Hang VALUES  ( 'MH06' ,N'Nokia')
INSERT INTO dbo.Hang VALUES  ( 'MH07' ,N'Xiaomi')
INSERT INTO dbo.Hang VALUES  ( 'MH08' ,N'LG')
INSERT INTO dbo.Hang VALUES  ( 'MH09' ,N'Sony')
INSERT INTO dbo.Hang VALUES  ( 'MH10' ,N'Huawei')

--Nhà Cung Cấp
INSERT INTO dbo.NhaCungCap(MaNhaCungCap,TenNhaCungCap ,SDT ,DiaChiNCC)
VALUES  ('MNCC01', N'FPT' ,N'0993214343' ,N'12 - Cù Lao -Phú Nhuận -Tp.HCM')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC02', N'FPT' ,N'0993214243' ,N'32 - Nguyễn Văn Trỗi -Q.3 -Tp.HCM')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC03', N'FPT' ,N'0993201234' ,N'432 - Lê Văn Việt -Q.9 -Tp.HCM')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC04', N'Phong Vũ' ,N'0993214340' ,N'450 - Lê Văn Việt -Q.9 -Tp.HCM')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC05', N'Thế Giới di Động' ,N'0993214350' ,N'195 - Nguyễn Kim Thiện -Tp.BMT')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC06', N'Thế Giới di Động' ,N'0993214377' ,N'77 - Phạm Thành Trung -Tp.Pleiku')
INSERT INTO dbo.NhaCungCap VALUES  ('MNCC07', N'Thế Giới di Động' ,N'0993214312' ,N'12 - Nguyễn Tứ Tấn Tài - Tiền Giang')

--Nhân viên
INSERT INTO dbo.NhanVien(MaNhanVien,TenNhanVien ,NamSinhNV ,GioiTinh ,SDT ,DiaChi)
VALUES  ('NV01', N'Nguyễn Văn Ti' ,1990 ,1 ,N'0924533628' ,N'Quận 9 - Tp.HCM')
INSERT INTO dbo.NhanVien VALUES  ('NV02', N'Nguyễn Thị Hiền' ,1996 ,0 ,N'0924533687' ,N'Quận 9 - Tp.HCM')
INSERT INTO dbo.NhanVien VALUES  ('NV03', N'Vũ Văn Thanh' ,1993 ,1 ,N'0954235688' ,N'Quận 2 - Tp.HCM')
INSERT INTO dbo.NhanVien VALUES  ('NV04', N'Lê Ngọc Thanh' ,1995 ,0 ,N'0983998237' ,N'Quận 9 - Tp.HCM')
INSERT INTO dbo.NhanVien VALUES  ('NV05', N'Phạm Mỹ Ân' ,1996 ,0 ,N'0924533629' ,N'Quận 2 - Tp.HCM')
INSERT INTO dbo.NhanVien VALUES  ('NV06', N'Nguyễn Lê Thanh Mỹ' ,1992 ,0 ,N'0924533630' ,N'Quận 9 - Tp.HCM')

--Mã Giảm Giá
INSERT INTO dbo.MaGiamGia(MaGG, SoLuong ,SotienGiam ,Code ,HanSuDung)
VALUES  ('MGG01' ,30 ,500000 ,84001 ,'20200701')
INSERT INTO dbo.MaGiamGia(MaGG, SoLuong ,SotienGiam ,Code ,HanSuDung)
VALUES  ('MGG02' ,20 ,250000 ,84002 ,'20200920')
INSERT INTO dbo.MaGiamGia(MaGG, SoLuong ,SotienGiam ,Code ,HanSuDung)
VALUES  ('MGG03' ,5 ,1000000 ,84003 ,'20200820')

--Sản Phẩm
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP01', N'Iphone X' ,15000000 ,100 ,'MNCC01' ,'MH01')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP02', N'Iphone 7' ,10000000 ,70 ,'MNCC02' ,'MH01')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP03', N'Iphone 8' ,12000000 ,80 ,'MNCC06' ,'MH07')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP04', N'Iphone 11' ,25000000 ,110 ,'MNCC03' ,'MH08')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP05', N'Sam Sung Galaxy A01' ,2790000 ,100 ,'MNCC05' ,'MH10')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP06', N'Sam Sung Galaxy A10s' ,3690000 ,100 ,'MNCC07' ,'MH04')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP07', N'Sam Sung Galaxy S20 ultra' ,25900000 ,100 ,'MNCC04' ,'MH06')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP08', N'Sam Sung Galaxy Note 10+' ,17990000 ,100 ,'MNCC01' ,'MH08')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP09', N'Sam Sung Galaxy Fold' ,50000000 ,50 ,'MNCC01' ,'MH05')
INSERT INTO dbo.SanPham(MaSanPham,TenSanPham ,Gia ,SoLuong ,MaNhaCungCap , MaHang)
VALUES  ('MSP010', N'Xiaomi Realme 9' ,3990000 ,90 ,'MNCC05' ,'MH10')

--Khách Hàng
INSERT INTO dbo.KhachHang(MaKhachHang, TenKhachHang , NamSinhKH , DiaChiKH ,GioiTinh ,SDT ,MaNhanVien)
VALUES  ('MKH01',N'Nguyễn Kim Thiện' ,1997 ,N'Hòa Phú-Tp.BMT' ,1 ,N'0363240826' ,'NV01')
INSERT INTO dbo.KhachHang(MaKhachHang, TenKhachHang , NamSinhKH , DiaChiKH ,GioiTinh ,SDT ,MaNhanVien)
VALUES  ('MKH02',N'Nguyễn Ngọc Mi' ,1993 ,N'Quận 3-Tp.HCM' ,0 ,N'0363240836' ,'NV03')
INSERT INTO dbo.KhachHang(MaKhachHang, TenKhachHang , NamSinhKH , DiaChiKH ,GioiTinh ,SDT ,MaNhanVien)
VALUES  ('MKH03',N'Lê Ngọc Minh' ,1997 ,N'Quận 9-Tp.HCM' ,0 ,N'0363248236' ,'NV04')
INSERT INTO dbo.KhachHang(MaKhachHang, TenKhachHang , NamSinhKH , DiaChiKH ,GioiTinh ,SDT ,MaNhanVien)
VALUES  ('MKH04',N'Lê Thị Dung' ,1996 ,N'Quận 9-Tp.HCM' ,0 ,N'0363249853' ,'NV05')
INSERT INTO dbo.KhachHang(MaKhachHang, TenKhachHang , NamSinhKH , DiaChiKH ,GioiTinh ,SDT ,MaNhanVien)
VALUES  ('MKH05',N'Nguyễn Ánh' ,1992 ,N'Quận 9-Tp.HCM' ,0 ,N'0363240621' ,'NV02')

--Hóa Đơn
-- Tổng tiền và tiền ship sẽ được tính sau (dùng hàm để tính) nên ở đây để NULL.
-- Mã giảm giá (Ma) áp dụng cho đơn hàng xxx với tổng tiền trên xxx sẽ được tính sau (dùng hàm)
INSERT INTO dbo.HoaDon(MaHoaDon,TongTien ,Ngay ,TienShip , DiaChi ,MaKhachHang ,MaGG)
VALUES  ('MHD01', NULL ,'20200520' ,NULL ,N'Quận 9- Tp.HCM' ,'MKH01' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD02', NULL ,'20200520' ,NULL ,N'Quận 2- Tp.HCM' ,'MKH04' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD03', NULL ,'20200620' ,NULL ,N'Quận 5- Tp.HCM' ,'MKH05' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD04', NULL ,'20200620' ,NULL ,N'Quận 10- Tp.HCM' ,'MKH02' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD05', NULL ,'20200720' ,NULL ,N'Quận Phú Nhuận - Tp.HCM' ,'MKH03' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD06', NULL ,'20200720' ,NULL ,N'Quận 2- Tp.HCM' ,'MKH05' ,NULL)
INSERT INTO dbo.HoaDon VALUES  ('MHD07', NULL ,'20200520' ,NULL ,N'Quận 2- Tp.HCM' ,'MKH04' ,NULL)

--Chi Tiết Hóa Đơn
-- Thành tiền = số lượng * đơn giá
-- Dùng hàm tính sau
INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT01' ,1 ,NULL ,'MSP01' ,'MHD01'),
		('MCT02' ,3 ,NULL ,'MSP02' ,'MHD01'),
		('MCT03' ,1 ,NULL ,'MSP05' ,'MHD01'),
		('MCT04' ,5 ,NULL ,'MSP06' ,'MHD01'),
		('MCT05' ,2 ,NULL ,'MSP03' ,'MHD01')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT06' ,1 ,NULL ,'MSP03' ,'MHD02'),
		('MCT07' ,1 ,NULL ,'MSP02' ,'MHD02'),
		('MCT08' ,1 ,NULL ,'MSP01' ,'MHD02'),
		('MCT09' ,1 ,NULL ,'MSP05' ,'MHD02')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT10' ,1 ,NULL ,'MSP05' ,'MHD03'),
		('MCT11' ,10 ,NULL ,'MSP01' ,'MHD03'),
		('MCT12' ,6 ,NULL ,'MSP02' ,'MHD03'),
		('MCT13' ,2 ,NULL ,'MSP06' ,'MHD03')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT14' ,1 ,NULL ,'MSP07' ,'MHD04'),
		('MCT15' ,1 ,NULL ,'MSP08' ,'MHD04'),
		('MCT16' ,1 ,NULL ,'MSP09' ,'MHD04')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT17' ,1 ,NULL ,'MSP01' ,'MHD05'),
		('MCT18' ,1 ,NULL ,'MSP02' ,'MHD05'),
		('MCT19' ,1 ,NULL ,'MSP05' ,'MHD05')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT20' ,3 ,NULL ,'MSP04' ,'MHD06'),
		('MCT21' ,5 ,NULL ,'MSP01' ,'MHD06'),
		('MCT22' ,1 ,NULL ,'MSP02' ,'MHD06')

INSERT INTO dbo.ChiTietHoaDon(MaChiTietHD, SoLuong ,ThanhTien , MaSanPham , MaHoaDon )
VALUES  ('MCT23' ,10 ,NULL ,'MSP01' ,'MHD07'),
		('MCT24' ,4 ,NULL ,'MSP06' ,'MHD07'),
		('MCT25' ,2 ,NULL ,'MSP04' ,'MHD07'),
		('MCT26' ,5 ,NULL ,'MSP07' ,'MHD07'),
		('MCT27' ,1 ,NULL ,'MSP09' ,'MHD07')

------------------------------------------------------------------------------------

-- Truy vấn từ các bảng
SELECT * FROM dbo.ChiTietHoaDon
SELECT * FROM dbo.HoaDon
SELECT * FROM dbo.MaGiamGia
SELECT * FROM dbo.Hang
SELECT * FROM dbo.NhaCungCap
SELECT * FROM dbo.SanPham
SELECT * FROM dbo.KhachHang
SELECT * FROM dbo.NhanVien
GO
------------------------------------------------------------------------------------
