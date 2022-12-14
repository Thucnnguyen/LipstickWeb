USE [master];
GO
/****** Object:  Database [Lipstick]    Script Date: 7/21/2022 9:21:09 AM ******/
CREATE DATABASE [Lipstick]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lipstick', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Lipstick.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lipstick_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Lipstick_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lipstick] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lipstick].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lipstick] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lipstick] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lipstick] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lipstick] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lipstick] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lipstick] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lipstick] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lipstick] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lipstick] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lipstick] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lipstick] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lipstick] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lipstick] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lipstick] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lipstick] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Lipstick] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lipstick] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lipstick] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lipstick] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lipstick] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lipstick] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lipstick] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lipstick] SET RECOVERY FULL 
GO
ALTER DATABASE [Lipstick] SET  MULTI_USER 
GO
ALTER DATABASE [Lipstick] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lipstick] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lipstick] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lipstick] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lipstick] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lipstick] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lipstick', N'ON'
GO
ALTER DATABASE [Lipstick] SET QUERY_STORE = OFF
GO
USE [Lipstick]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/21/2022 9:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [nvarchar](50) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 7/21/2022 9:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[OderID] [nvarchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantitty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/21/2022 9:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OderID] [nvarchar](50) NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone Number] [int] NOT NULL,
	[address] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/21/2022 9:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductListID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](200) NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[Detail] [nvarchar](1000) NULL,
	[image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/21/2022 9:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Location] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (N'1', N'Son Dior')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (N'2', N'Son Burberry')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (N'3', N'Son Gucci')
GO
INSERT [dbo].[Order_Details] ([OderID], [ProductID], [Quantitty]) VALUES (N'gOfYp', 2, 1)
GO
INSERT [dbo].[orders] ([OderID], [Owner], [Email], [Phone Number], [address]) VALUES (N'gOfYp', N'Minh Hai', N'john@gmail.com', 123, N'df')
GO
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (1, N'1', N'Son Dior Addict Lip Tattoo Màu 351 Natural Nude Unbox', 700000, 5, N'Dior vừa cập nhật diện mạo mới nhấy 2022 cho dòng Dior Addict Lip Tattoo để tiếp nối sự thành công của dòng lại cang thêm rực rỡ hơn.Son Dior Addict Lip Tattoo 351 Natural Nude mang tone hồng đất cực cực trendy hòa với xu hương môi mọng cực nóng bỏng thỏi Son DiorTattoo 351 sẽ lấy lòng chị em trong 1 nốt nhạc mà thoi.', N'images/sondior.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (2, N'1', N'Son Dior Rouge 772 Classic gloss 120 Natural bling', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (3, N'1', N'Son Dior Rouge Satin 312 Incandescent Limited Edition', 1400000, 10, N'Các Nàng cùng chiêm ngưỡng vẻ đẹp của son Dior 312 Incandescent    Satin Rouge Dior lần đầu tiên được trải nghiệm một diện mạo hoàn toàn mới với cảm hứng từ “New Look" ”. một phiên bản edition đẹp hơn cả mong đợi. Với hoạ tiết houndstooth cao cấp bao phủ lấy vỏ son cực đẳng cấp. Son Dior 312 limited tông son màu cam cháy dẫn đầu xu hướng cực HOT,  mà còn bị đốn tim bởi chất son Satin siêu mịn siêu mướt khi lên môi tạo hiệu ứng căng mọng cho môi cực nóng bỏng.', N'images/sondior2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (4, N'1', N'Son Dior Rouge Velvet 720 Icóne', 849000, 0, N'Các Nàng cùng chiêm ngưỡng vẻ đẹp của son Dior 720 Icóne Velvet, chẳng những ngây ngất với sắc hồng nâu thơ mộng mà còn bị đốn tim bởi chất son velvet nhung mịn siêu mướt khi lên môi và với chất son được bao bọc bằng nhung mịn màng tiên phong trong dòng son cao cấp.', N'images/sondior3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (5, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (6, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior5.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (7, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior6.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (8, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (9, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (10, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (11, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (12, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (13, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior5.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (14, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior6.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (15, N'1', N'Son Dior Rouge 772 Classic Matte', 900000, 4, N'Son Dior Rouge 772 Classic Matte là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo và nổi bật như son Dior 772.', N'images/sondior.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (16, N'1', N'Son Dior Lip Glow dưỡng môi màu 05 Hot Glam', 900000, 4, N'Son Dior Lip Glow là một màu son mới nhất của hãng Dior. Đây là một màu theo xu hướng thời thượng hiện nay. Một màu hồng nude hoàn hảo.', N'images/sondior1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (17, N'2', N'Son Burberry Kisses Matte 93 Russet Hot Trend', 1150000, 10, N'Burberry lại chiều lòng phái đẹp trong BTS mới nhất 2022 là dòng Burberry Kisses Matte phiên bản kết cấu lì mang hiệu ứng nhung mịn cực mướt. 93 Russet sự pha trộn hoàn hảo giữa sắc đỏ pha hồng nâu cực kỳ lạ mắt mới mẻ hứa hẹn sẽ hot trong năm nay.', N'images/sonBurberry.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (18, N'2', N'Son Burberry Kisses Matte Màu 109 Military Red', 1150000, 10, N'Burberry lại chiều lòng phái đẹp trong BTS mới nhất 2022 là dòng Burberry Kisses Matte phiên bản kết cấu lì mang hiệu ứng nhung mịn cực mướt. Son Burberry Kisses Matte 109 Military Red  tone đỏ tươi pha chút ánh hồng cực ngọt ngào. Màu Son Burberry 109 màu son tươi tắn và cực kì tôn da cho nàng đấy nhé.', N'images/sonBurberry1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (19, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (20, N'2', N'Son Burberry Kisses Matte Màu 17 TB Orange', 899000, 0, N'Burberry lại chiều lòng phái đẹp trong BTS mới nhất 2022 là dòng Burberry Kisses Matte phiên bản kết cấu lì mang hiệu ứng nhung mịn cực mướt. Son Burberry Kisses Matte 17 TB Orange với cam san hô trẻ trung. Màu Son Burberry 17 chắn chắn sẽ là màu son được nàng ưu ái lựa chọn nhất dòng đây ạ.', N'images/sonBurberry3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (21, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (22, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (23, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (24, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (25, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (26, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (27, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (28, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (29, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (30, N'2', N'Son Burberry Lip Velvet Matte Màu 434 Ruby', 1000000, 10, N'Chất son lì của Burberry nhẹ và mượt như nhung! Nó đặc biệt hợp với các bạn môi khô, mướt môi, không khô tẹo nào. Độ giữ màu của son Burberry 429 Military Red khá tốt, khi phai đi sẽ hơi có sắc hồng các Nàng nhé. ', N'images/sonBurberry3.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (31, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (32, N'3', N'Son Gucci Rouge De Beauté Brillant 214 Call It A Day', 799000, 0, N'Bùng nổ son Gucci đình đám đã quen mặt từ lâu, nay Gucci tái xuất với diện mạo đẹp xuất sắc trong bộ sưu tập Rouge De Beauté Brillant mới lạ chưa từng thấy trước đó với những tông màu siêu hot. Gucci 214 Call It A Day mang màu trà sữa nhẹ nhàng cực xinh và nhận được nhiều lời khen từ những tín đồ phái đẹp trên toàn thế giới.', N'images/sonGucci1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (33, N'3', N'Son Kem Lì Gucci Rouge Liquid Matte Màu 208 They Met in Argentina', 899000, 8, N'Son Kem Lì Gucci Rouge Liquid Matte Màu 208 They Met in Argentina thuộc BST mới nhất 2022 của nhà Gucci với chất son lì nhưng kết cấu siêu mướt mịn.  Son kem Lì 208 They Met in Argentina với màu cam hồng đất nhẹ nhàng cực xinh , tone màu đất chính là sự lựa chọn hoàn hảo phù hợp với xu hướng trang điểm tự nhiên hiện nay', N'images/sonGucci2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (34, N'3', N'Bảng Màu Son Gucci Đẹp Mê Mẩn Từ Trong Ra Ngoài', 899000, 0, N'Gucci vừa cho ra mắt 3 dòng son: Baume à Lèvres, Rouge à Lèvres Satin và Rouge à Lèvres Voile và đã ngay lập tức được các chị em tìm mua. Thừa thắng xông lên, trong dịp cuối năm cũ – đầu năm mới vừa qua, Gucci lại tiếp tục tung ra dòng son mới là Gucci Rouge À Lèvres Mat Mattle. Nếu như 3 dòng son trước thiên về chất son mịn mượt, mỏng nhẹ và có độ bóng thì dòng son mới của Gucci lại có chất son lì, tiệp vào môi.  Từ vỏ son đến chất son đều khiến dân tình mê đắm từ cái nhìn đầu tiên', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (35, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (36, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (37, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (38, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci1.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (39, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci2.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (40, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (41, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (42, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (43, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (44, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (45, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (46, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (47, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (48, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (49, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
INSERT [dbo].[Products] ([ProductID], [ProductListID], [ProductName], [price], [discount], [Detail], [image]) VALUES (50, N'3', N'Son Dưỡng Gucci Rouge Baume Lip Balm 05 Ester Rosewood', 699000, 5, N'Son dưỡng môi Gucci 05 Ester Rosewood có tông màu cánh hồng khô mới mẻ xinh xắn của một phiên bản son môi mới được gia nhập trong bộ sưu tập son dưỡng môi nhà Gucci, không gây bết dính giúp cho đôi môi thêm phần căng mọng lại có màu cực xinh.', N'images/sonGucci.png')
GO
INSERT [dbo].[Users] ([account], [Password], [Email], [PhoneNumber], [Location]) VALUES (N'abc', N'1', N'asfa@gmail.com', N'123', N'1213')
INSERT [dbo].[Users] ([account], [Password], [Email], [PhoneNumber], [Location]) VALUES (N'admin', N'123', N'admin@gmail.com', N'123456', N'21/2/25 Lương Hoàng, Quận 1, TpHCM')
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([OderID])
REFERENCES [dbo].[orders] ([OderID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductListID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
USE [master]
GO
ALTER DATABASE [Lipstick] SET  READ_WRITE 
GO
