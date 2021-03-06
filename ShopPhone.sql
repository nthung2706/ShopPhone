USE [master]
GO
/****** Object:  Database [ShopPhone]    Script Date: 6/8/2021 2:31:04 PM ******/
CREATE DATABASE [ShopPhone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopPhone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopPhone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopPhone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopPhone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopPhone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopPhone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopPhone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopPhone] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopPhone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopPhone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopPhone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopPhone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopPhone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopPhone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopPhone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopPhone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopPhone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopPhone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopPhone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopPhone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopPhone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopPhone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopPhone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopPhone] SET  MULTI_USER 
GO
ALTER DATABASE [ShopPhone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopPhone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopPhone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopPhone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopPhone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopPhone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopPhone] SET QUERY_STORE = OFF
GO
USE [ShopPhone]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan_ID] [int] NULL,
	[KhachHang_ID] [int] NULL,
	[DienThoaiGiaoHang] [nvarchar](255) NULL,
	[DiaChiGiaoHang] [nvarchar](255) NULL,
	[NgayDatHang] [datetime] NULL,
	[TinhTrang] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang_ChiTiet]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatHang_ID] [int] NULL,
	[SanPham_ID] [int] NULL,
	[SoLuong] [smallint] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](255) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[TenDangNhap] [nvarchar](255) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiSanXuat]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiSanXuat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[XuatXu] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Loai_ID] [int] NULL,
	[Hang_ID] [int] NULL,
	[NoiSanXuat_ID] [int] NULL,
	[TenSanPham] [nvarchar](255) NULL,
	[NgayNhap] [datetime] NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[GioiGianBaoHanh] [int] NULL,
	[MoTa] [nvarchar](255) NULL,
	[HinhAnhBia] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/8/2021 2:31:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChucVu] [int] NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[TenDangNhap] [nvarchar](255) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](255) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([ID], [TaiKhoan_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (1, NULL, 1, N'0944444444', N'Long Xuyên', CAST(N'2021-06-06T23:00:38.363' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [TaiKhoan_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (2, NULL, 1, N'0944444444', N'Long Xuyên', CAST(N'2021-06-06T23:43:56.877' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [TaiKhoan_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (3, NULL, 1, N'0944444444', N'Long Xuyên', CAST(N'2021-06-08T12:59:07.540' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [TaiKhoan_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (4, NULL, 4, N'0944444444', N'Long Xuyên', CAST(N'2021-06-08T13:53:26.170' AS DateTime), 0)
INSERT [dbo].[DatHang] ([ID], [TaiKhoan_ID], [KhachHang_ID], [DienThoaiGiaoHang], [DiaChiGiaoHang], [NgayDatHang], [TinhTrang]) VALUES (5, NULL, 1, N'0944444444', N'Long Xuyên', CAST(N'2021-06-08T14:03:52.280' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DatHang_ChiTiet] ON 

INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [SanPham_ID], [SoLuong], [DonGia]) VALUES (1, 1, 1, 1, 16000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [SanPham_ID], [SoLuong], [DonGia]) VALUES (4, 4, 2, 1, 12000000)
INSERT [dbo].[DatHang_ChiTiet] ([ID], [DatHang_ID], [SanPham_ID], [SoLuong], [DonGia]) VALUES (5, 5, 3, 3, 18000000)
SET IDENTITY_INSERT [dbo].[DatHang_ChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[Hang] ON 

INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (1, N'Iphone')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (2, N'Oppo')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (3, N'Xiaomi')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (4, N'Bphone')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (5, N'SamSung')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (6, N'Huawei')
INSERT [dbo].[Hang] ([id], [TenHang]) VALUES (7, N'Vivo')
SET IDENTITY_INSERT [dbo].[Hang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [HoTen], [SoDienThoai], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (1, N'Trần quốc đạt', N'0373856186', N'Long Xuyên', N'user', N'356a192b7913b04c54574d18c28d46e6395428ab')
INSERT [dbo].[KhachHang] ([ID], [HoTen], [SoDienThoai], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (4, N'Trương quốc duy', N'0373856186', N'Long Xuyên', N'user1', N'7110eda4d09e062aa5e4a390b0a572ac0d2c0220')
INSERT [dbo].[KhachHang] ([ID], [HoTen], [SoDienThoai], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (5, N'Nguyễn Hoàng Long', N'0373856186', N'Long Xuyên', N'user2', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (1, N'Cảm ứng')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (2, N'Phím Thường')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
SET IDENTITY_INSERT [dbo].[NoiSanXuat] ON 

INSERT [dbo].[NoiSanXuat] ([id], [XuatXu]) VALUES (1, N'Mỹ')
INSERT [dbo].[NoiSanXuat] ([id], [XuatXu]) VALUES (2, N'Hàn Quốc')
INSERT [dbo].[NoiSanXuat] ([id], [XuatXu]) VALUES (3, N'Việt Nam')
INSERT [dbo].[NoiSanXuat] ([id], [XuatXu]) VALUES (4, N'Trung Quốc')
SET IDENTITY_INSERT [dbo].[NoiSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (1, 1, 1, 1, N'Iphone 12 promax', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 13000000, 1000, 3, N'Màn hình:

OLED6.1"Super Retina XDR
Hệ điều hành:

iOS 14
Camera sau:

2 camera 12 MP
Camera trước:

12 MP
Chip:

Apple A14 Bionic
RAM:

4 GB
Bộ nhớ trong:

64 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 5G
Pin, Sạc:

2815 mAh20 W', N'Storage/a4d54106-5504-4e1a-8463-3e98f1d2b862.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (2, 1, 1, 1, N'Iphone XS Max', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 12000000, 100, 3, N'OLED6.5"Super Retina
Hệ điều hành:

iOS 14
Camera sau:

2 camera 12 MP
Camera trước:

7 MP
Chip:

Apple A12 Bionic
RAM:

4 GB
Bộ nhớ trong:

64 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 4G
Pin, Sạc:

3174 mAh', N'Storage/70f40e62-d7c6-406c-8c39-72d7074c62e8.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (3, 1, 3, 4, N'Xiaomi BlackShark 3', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 18000000, 200, 6, N'Màn hình:

AMOLED6.67"Full HD+
Hệ điều hành:

Android 10
Camera sau:

Chính 64 MP & Phụ 13 MP, 5 MP
Camera trước:

20 MP
Chip:

Snapdragon 865
RAM:

8 GB
Bộ nhớ trong:

128 GB
SIM:

2 Nano SIMHỗ trợ 5G
Pin, Sạc:

4720 mAh', N'Storage/ae290ba9-5278-4d7b-870c-d7178a94a246.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (8, 1, 5, 4, N'Realme C2', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 14000000, 50, 3, N'Màn hình:

IPS LCD6.5"HD+
Hệ điều hành:

Android 10
Camera sau:

Chính 12 MP & Phụ 2 MP, 2 MP
Camera trước:

5 MP
Chip:

MediaTek Helio G70
RAM:

3 GB
Bộ nhớ trong:

32 GB
SIM:

2 Nano SIMHỗ trợ 4G
Pin, Sạc:

5000 mAh10 W', N'Storage/dcdf8e5e-7588-4860-b5b2-4fcd76555aec.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (9, 1, 3, 4, N'Xiaomi Redmi Note 10', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 23000000, 120, 3, N'Màn hình: AMOLED6.67"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 64 MP & Phụ 13 MP, 5 MP Camera trước: 20 MP Chip: Snapdragon 865 RAM: 8 GB Bộ nhớ trong: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4720 mAh', N'Storage/b6ba7f30-ca20-4927-abe3-e115caeda327.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (10, 1, 2, 4, N'Oppo Reno 5', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 12990000, 30, 3, N'Màn hình:

IPS LCD6.5"HD+
Hệ điều hành:

Android 10
Camera sau:

Chính 12 MP & Phụ 2 MP, 2 MP
Camera trước:

5 MP
Chip:

MediaTek Helio G70
RAM:

3 GB
Bộ nhớ trong:

32 GB
SIM:

2 Nano SIMHỗ trợ 4G
Pin, Sạc:

5000 mAh10 W', N'Storage/ca5f6f70-9a67-43c4-b352-dd55cacd40b1.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (11, 1, 2, 2, N'Oppo A94', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 23000000, 12, 3, N'Màn hình: AMOLED6.67"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 64 MP & Phụ 13 MP, 5 MP Camera trước: 20 MP Chip: Snapdragon 865 RAM: 8 GB Bộ nhớ trong: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4720 mAh', N'Storage/4e7faaef-4593-4a90-9a56-2d6ec8069419.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (12, 1, 1, 1, N'Iphone XS Max Hồng', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 8600000, 21, 6, N'Màn hình: AMOLED6.67"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 64 MP & Phụ 13 MP, 5 MP Camera trước: 20 MP Chip: Snapdragon 865 RAM: 8 GB Bộ nhớ trong: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4720 mAh', N'Storage/1fc32cd4-b388-4507-a55b-e2dd47179f16.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (13, 1, 1, 1, N'SamSung Note 20 Ultra', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 18000000, 30, 8, N'Màn hình:

IPS LCD6.5"HD+
Hệ điều hành:

Android 10
Camera sau:

Chính 12 MP & Phụ 2 MP, 2 MP
Camera trước:

5 MP
Chip:

MediaTek Helio G70
RAM:

3 GB
Bộ nhớ trong:

32 GB
SIM:

2 Nano SIMHỗ trợ 4G
Pin, Sạc:

5000 mAh10 W', N'Storage/fb3cf824-b4c1-4f6e-b54d-63350a6d0723.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (14, 1, 1, 1, N'Iphone 7 Plus', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 6700000, 50, 3, N'Màn hình: OLED6.1"Super Retina XDR Hệ điều hành: iOS 14 Camera sau: 2 camera 12 MP Camera trước: 12 MP Chip: Apple A14 Bionic RAM: 4 GB Bộ nhớ trong: 64 GB SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc: 2815 mAh20 W', N'Storage/d813f3f5-99ff-4fe8-8556-09ba23732c3b.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (15, 1, 7, 4, N'Vivo I51', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 7600000, 20, 6, N'Màn hình: AMOLED6.67"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 64 MP & Phụ 13 MP, 5 MP Camera trước: 20 MP Chip: Snapdragon 865 RAM: 8 GB Bộ nhớ trong: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4720 mAh', N'Storage/2e3238f0-c9aa-4cee-b146-88cb39a5ede0.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (16, 1, 7, 4, N'Vivo V21', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 6200000, 30, 6, N'OLED6.5"Super Retina Hệ điều hành: iOS 14 Camera sau: 2 camera 12 MP Camera trước: 7 MP Chip: Apple A12 Bionic RAM: 4 GB Bộ nhớ trong: 64 GB SIM: 1 Nano SIM & 1 eSIMHỗ trợ 4G Pin, Sạc: 3174 mAh', N'Storage/4665abed-884c-4b6f-b85d-cd2d7a5d54f2.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (17, 1, 1, 1, N'SamSung Galaxy Z Fold', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 13990000, 50, 6, N'Màn hình: IPS LCD6.5"HD+ Hệ điều hành: Android 10 Camera sau: Chính 12 MP & Phụ 2 MP, 2 MP Camera trước: 5 MP Chip: MediaTek Helio G70 RAM: 3 GB Bộ nhớ trong: 32 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh10 W', N'Storage/22a9d51e-8509-49dc-9758-3e15483016aa.png')
INSERT [dbo].[SanPham] ([ID], [Loai_ID], [Hang_ID], [NoiSanXuat_ID], [TenSanPham], [NgayNhap], [DonGia], [SoLuong], [GioiGianBaoHanh], [MoTa], [HinhAnhBia]) VALUES (18, 1, 1, 1, N'Oppo Find X3', CAST(N'2021-06-08T00:00:00.000' AS DateTime), 12990000, 12, 3, N'Màn hình: OLED6.1"Super Retina XDR Hệ điều hành: iOS 14 Camera sau: 2 camera 12 MP Camera trước: 12 MP Chip: Apple A14 Bionic RAM: 4 GB Bộ nhớ trong: 64 GB SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc: 2815 mAh20 W', N'Storage/37e2495c-0e38-4d57-b5de-ba599702ea2e.png')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [ChucVu], [HoTen], [TenDangNhap], [MatKhau], [SoDienThoai], [DiaChi]) VALUES (1, 1, N'Trần quốc đạt', N'admin', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'0373856186', N'Long Xuyên')
INSERT [dbo].[TaiKhoan] ([ID], [ChucVu], [HoTen], [TenDangNhap], [MatKhau], [SoDienThoai], [DiaChi]) VALUES (2, 1, N'Trương quốc duy', N'duy', N'8cb2237d0679ca88db6464eac60da96345513964', N'0373856186', N'Long Xuyên')
INSERT [dbo].[TaiKhoan] ([ID], [ChucVu], [HoTen], [TenDangNhap], [MatKhau], [SoDienThoai], [DiaChi]) VALUES (3, 0, N'Nguyễn Hoàng Long', N'staff', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'0373856186', N'Long Xuyên')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD FOREIGN KEY([KhachHang_ID])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD FOREIGN KEY([TaiKhoan_ID])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD FOREIGN KEY([DatHang_ID])
REFERENCES [dbo].[DatHang] ([ID])
GO
ALTER TABLE [dbo].[DatHang_ChiTiet]  WITH CHECK ADD FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([Hang_ID])
REFERENCES [dbo].[Hang] ([id])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([Loai_ID])
REFERENCES [dbo].[Loai] ([ID])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([NoiSanXuat_ID])
REFERENCES [dbo].[NoiSanXuat] ([id])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [CHK_POSITION] CHECK  (([ChucVu]=(1) OR [ChucVu]=(0)))
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [CHK_POSITION]
GO
USE [master]
GO
ALTER DATABASE [ShopPhone] SET  READ_WRITE 
GO
