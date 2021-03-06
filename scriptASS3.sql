USE [master]
GO
/****** Object:  Database [Assignment3_HuynhTuanVu]    Script Date: 3/7/2021 6:21:13 PM ******/
CREATE DATABASE [Assignment3_HuynhTuanVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment3_HuynhTuanVu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment3_HuynhTuanVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment3_HuynhTuanVu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment3_HuynhTuanVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment3_HuynhTuanVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET QUERY_STORE = OFF
GO
USE [Assignment3_HuynhTuanVu]
GO
/****** Object:  Table [dbo].[car]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[carID] [int] IDENTITY(1,1) NOT NULL,
	[carName] [varchar](100) NOT NULL,
	[color] [varchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [varchar](300) NOT NULL,
	[description] [varchar](3000) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](30) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[discountName] [varchar](50) NOT NULL,
	[Disvalue] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[beginlDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ordDetailID] [int] IDENTITY(1,1) NOT NULL,
	[carID] [int] NOT NULL,
	[rentalDate] [date] NOT NULL,
	[returnDate] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[orderID] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[ratingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ordDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratingID] [int] IDENTITY(1,1) NOT NULL,
	[ratingValue] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[userID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ratingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [varchar](20) NOT NULL,
	[roleName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[discountID] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/7/2021 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](50) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[createdate] [date] NOT NULL,
	[verifyCode] [varchar](6) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[roleID] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[car] ON 

INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (6, N'Civic Type R', N'Vang', 2021, 200, 6, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnZ_zKTbaTKxYO6rsrve7HspQtKHqNRiKtPw&usqp=CAU', N'asd', 3, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (7, N'Ford Ranger', N'Xanh_Den', 2020, 400, 13, N'https://whatcar.vn/media/2018/07/ford-ranger-raptor-ban-tai.jpg', N'asddsa', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (8, N'Ford Mustang', N'Do', 2021, 1000, 3, N'https://vcdn-vnexpress.vnecdn.net/2020/04/21/Ford-Mustang-Shelby-GT500-1-9705-1587461778.jpg', N'dfg', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (9, N'Ford RS', N'Den', 2019, 400, 17, N'https://cdn1.mecum.com/auctions/sc0519/sc0519-371460/images/1-1553777940207.jpg?1557764952000', N'rty', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (11, N'Honda Accord', N'Den_nham', 2020, 300, 20, N'https://hondahanoivn.com/wp-content/uploads/2019/10/honda_accord_2019_16-1024x683.jpg', N'fgh', 3, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (14, N'Honda NSX', N'Vang', 2021, 1500, 2, N'https://i.vietgiaitri.com/2020/10/25/ca-nam-khong-ban-noi-mot-xe-honda-chinh-thuc-chia-tay-nsx-ff5-5324203.jpg', N'kjl', 3, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (15, N'Honda CRV', N'Trang', 2021, 190, 30, N'https://media.vov.vn/sites/default/files/styles/large/public/2020-11/1_335.jpg', N'fgh', 3, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (16, N'Lexus rx360', N'Xanh', 2019, 400, 8, N'https://cnet4.cbsistatic.com/img/kqCZ96_S2gukI8CjG5aEotv7E1M=/1200x675/2020/09/29/5b598fac-81c6-430a-890a-7fd0cf971df3/is-ogi.jpg', N'fsd', 4, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (17, N'Lexus is350', N'Trang', 2021, 2000, 3, N'https://xehay.vn/uploads/images/2018/10/01/xehay-lexus-lx-570-s-2019-051018-1.jpg', N'fsdf', 4, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (18, N'Lexus lc500', N'do', 2021, 4000, 2, N'https://c4.wallpaperflare.com/wallpaper/147/723/720/lexus-lexus-lc-500-car-grand-tourer-wallpaper-preview.jpg', N'sada', 4, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (19, N'Audi RS7', N'DO', 2020, 2000, 4, N'https://news.oto-hui.com/wp-content/uploads/2019/09/ra-mat-audi-rs7-sportback-v%C6%A1i-s%E1%BB%A9c-m%E1%BA%A1nh-591-m%C3%A3-l%E1%BB%B1c-1.jpg', N'fgdhfgh', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (20, N'Audi RS6', N'Den', 2020, 1500, 6, N'https://photo-baomoi.zadn.vn/w700_r1/2020_03_11_304_34261768/dc22b07aa4394d671428.jpg', N'dfgdfgdf', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (21, N'Audi R8', N'Xam', 2021, 4000, 3, N'https://images.honestjohn.co.uk/imagecache/file/crop/1200x800/media/14941146/Audi~R8~Performance~(01).jpg', N'asdasd', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (22, N'Ford Explorer', N'Den', 2020, 3000, 9, N'https://vcdn-vnexpress.vnecdn.net/2020/04/14/Ford-Explorer-2020-1-3042-1586857880.jpg', N'asdasd', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (23, N'Ford Fusion', N'Trang', 2020, 450, 21, N'https://alianphu.com/wp-content/uploads/2019/07/Ford-Fusion-2020-mau-trang.jpg', N'nmbnmgj', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (24, N'Ford F150', N'Xanh Den', 2021, 600, 16, N'https://static1.cafeauto.vn/cafeautoData/upload/tintuc/thitruong/2020/06/tuan-04/fordf1502021ramatthoatmacxebantai-6-1593259920.jpg', N'ghjgh', 2, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (25, N'Honda City', N'Do', 2020, 150, 30, N'https://hondaotoconghoa.com.vn/upload/images/honda%20city.jpg', N'dfsdfsdd', 3, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (26, N'Lexus UX', N'Trang', 2020, 300, 12, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY1N_eoO_YtRzsE5FBoUWYcCMRjcfURSrmNQ&usqp=CAU', N'dfgdf', 4, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (27, N'Audi Q8', N'Xanh', 2020, 400, 10, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbUF5FvpAowW7_V8uHDgM2dk62lD7JQL9cQQ&usqp=CAU', N'dfhfdghfg', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (28, N'Audi A7', N'Den', 2019, 350, 50, N'https://tuvanmuaxe.vn/upload/upload_img/images/audi-a7-sportback-2019-viet-nam-tuvanmuaxe-2.jpg', N'fgdhfgh', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (30, N'Audi Q5', N'Luc', 2020, 350, 20, N'https://media.autoexpress.co.uk/image/private/s--0tS3F7fU--/v1593179375/autoexpress/2020/06/Audi%20Q5%20facelift.jpg', N'sdsdfsd', 1, 1)
INSERT [dbo].[car] ([carID], [carName], [color], [year], [price], [quantity], [image], [description], [CategoryID], [status]) VALUES (31, N'Audi TT', N'Do', 2020, 900, 6, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxlD70ssyaPLj4n_9Nyk-HeAH2fAN4HaJNgw&usqp=CAU', N'dfdfgdfg', 1, 1)
SET IDENTITY_INSERT [dbo].[car] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [status]) VALUES (1, N'Audi', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [status]) VALUES (2, N'Ford', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [status]) VALUES (3, N'Honda', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [status]) VALUES (4, N'Lexus', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([discountID], [discountName], [Disvalue], [status], [beginlDate], [endDate]) VALUES (1, N'KM0', 1, 1, CAST(N'2021-03-07' AS Date), CAST(N'9999-03-03' AS Date))
INSERT [dbo].[Discount] ([discountID], [discountName], [Disvalue], [status], [beginlDate], [endDate]) VALUES (2, N'KM1', 10, 1, CAST(N'2021-03-07' AS Date), CAST(N'2021-08-07' AS Date))
INSERT [dbo].[Discount] ([discountID], [discountName], [Disvalue], [status], [beginlDate], [endDate]) VALUES (3, N'KM1.5', 15, 1, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-12' AS Date))
SET IDENTITY_INSERT [dbo].[Discount] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (10, 9, CAST(N'2021-03-06' AS Date), CAST(N'2021-03-07' AS Date), 1, 400, 6, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (11, 16, CAST(N'2021-03-06' AS Date), CAST(N'2021-03-07' AS Date), 2, 800, 7, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (12, 9, CAST(N'2021-03-06' AS Date), CAST(N'2021-03-07' AS Date), 3, 400, 7, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (13, 19, CAST(N'2021-03-06' AS Date), CAST(N'2021-03-07' AS Date), 1, 2000, 8, 1, 13)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (14, 21, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-08' AS Date), 1, 4000, 9, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (15, 7, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-18' AS Date), 1, 4400, 10, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (16, 7, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-08' AS Date), 1, 400, 10, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (17, 20, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-08' AS Date), 1, 1500, 11, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (18, 19, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-12' AS Date), 1, 4000, 12, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (19, 6, CAST(N'2021-03-05' AS Date), CAST(N'2021-03-06' AS Date), 1, 200, 13, 1, 11)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (20, 7, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-11' AS Date), 1, 400, 14, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (21, 9, CAST(N'2021-03-31' AS Date), CAST(N'2021-04-02' AS Date), 1, 800, 15, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (22, 30, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-08' AS Date), 1, 350, 16, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (23, 11, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-08' AS Date), 1, 300, 16, 1, NULL)
INSERT [dbo].[OrderDetail] ([ordDetailID], [carID], [rentalDate], [returnDate], [quantity], [price], [orderID], [status], [ratingID]) VALUES (24, 18, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-19' AS Date), 1, 8000, 16, 1, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([ratingID], [ratingValue], [status], [userID]) VALUES (7, 7, 1, N'vuhtse')
INSERT [dbo].[Rating] ([ratingID], [ratingValue], [status], [userID]) VALUES (8, 8, 1, N'vuhtse')
INSERT [dbo].[Rating] ([ratingID], [ratingValue], [status], [userID]) VALUES (9, 8, 1, N'vuhtse')
INSERT [dbo].[Rating] ([ratingID], [ratingValue], [status], [userID]) VALUES (11, 7, 1, N'vuhtse')
INSERT [dbo].[Rating] ([ratingID], [ratingValue], [status], [userID]) VALUES (13, 5, 1, N'test')
SET IDENTITY_INSERT [dbo].[Rating] OFF
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (N'1', N'New')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (N'2', N'Active')
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (6, CAST(N'2021-03-06' AS Date), 400, N'test', 1, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (7, CAST(N'2021-03-06' AS Date), 1200, N'test', 2, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (8, CAST(N'2021-03-06' AS Date), 2000, N'test', 2, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (9, CAST(N'2021-03-07' AS Date), 4000, N'test', 1, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (10, CAST(N'2021-03-07' AS Date), 4800, N'test', 1, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (11, CAST(N'2021-03-07' AS Date), 1500, N'test', 2, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (12, CAST(N'2021-03-07' AS Date), 4000, N'vuhtse', 1, 0)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (13, CAST(N'2021-03-07' AS Date), 200, N'vuhtse', 1, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (14, CAST(N'2021-03-07' AS Date), 400, N'vuhtse', 1, 0)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (15, CAST(N'2021-03-07' AS Date), 800, N'test', 1, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalPrice], [userID], [discountID], [status]) VALUES (16, CAST(N'2021-03-07' AS Date), 8650, N'vuhtse', 2, 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [address], [createdate], [verifyCode], [email], [roleID]) VALUES (N'test', N'TEST', N'123456', N'0123456789', N'HCM', CAST(N'2021-03-02' AS Date), N'123456', N'test@gmail.com', N'2')
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [address], [createdate], [verifyCode], [email], [roleID]) VALUES (N'vuhtse', N'Huynh Tuan Vu', N'123456', N'0967767612', N'HCM', CAST(N'2021-03-03' AS Date), N'791049', N'vuhtse140902@fpt.edu.vn', N'2')
ALTER TABLE [dbo].[car]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([carID])
REFERENCES [dbo].[car] ([carID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ratingID])
REFERENCES [dbo].[Rating] ([ratingID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment3_HuynhTuanVu] SET  READ_WRITE 
GO
