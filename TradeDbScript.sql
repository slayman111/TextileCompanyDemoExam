USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 11.05.2022 18:29:49 ******/
CREATE DATABASE [Trade]
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderCreateDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPointID] [int] NOT NULL,
	[OrderCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF3381E91D] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHasProduct]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHasProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductAmount] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A266224B3D094] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickupPoint]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[OrderPickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PostIndex] [nvarchar](10) NOT NULL,
	[CityID] [int] NOT NULL,
	[StreetID] [int] NOT NULL,
	[HouseNumber] [nvarchar](4) NULL,
 CONSTRAINT [PK_OrderPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductUnitOfMeasurementID] [int] NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[ProductMaxDiscount] [tinyint] NOT NULL,
	[ProductManufacturerID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductCurrentDiscount] [tinyint] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[ProductInfo] [nvarchar](max) NOT NULL,
	[ProductImage] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__2EA7DCD53CC2C0FC] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[StreetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitOfMeasurement]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitOfMeasurement](
	[UnitOfMeasurementID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitOfMeasurement] PRIMARY KEY CLUSTERED 
(
	[UnitOfMeasurementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserHasOrder]    Script Date: 11.05.2022 18:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHasOrder](
	[UserID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_UserHasOrder] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [Value]) VALUES (1, N'Кропоткин
')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [Value]) VALUES (1, N'БТК Текстиль')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Value]) VALUES (2, N'Империя ткани')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Value]) VALUES (3, N'Комильфо')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [Value]) VALUES (4, N'Май Фабрик')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (1, 1, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 27, 811)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (2, 1, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 5, 812)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (3, 1, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 29, 813)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (4, 1, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 10, 814)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (5, 1, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-20' AS Date), 31, 815)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (6, 1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 32, 816)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (7, 1, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, 817)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (8, 2, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 34, 818)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (9, 1, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 35, 819)
INSERT [dbo].[Order] ([OrderID], [OrderStatusId], [OrderCreateDate], [OrderDeliveryDate], [OrderPickupPointID], [OrderCode]) VALUES (10, 2, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 36, 820)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (1, N'B111C5', 5)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (1, N'T238C7', 7)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (2, N'E112C6', 5)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (2, N'T238C7', 9)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (3, N'L293S9', 8)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (3, N'M112C8', 4)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (4, N'M294G9', 6)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (4, N'S384K2', 1)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (5, N'Q836H4', 1)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (5, N'W874J3', 2)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (6, N'O947D8', 4)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (6, N'R983K4', 1)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (7, N'H497J3', 2)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (7, N'N394K2', 5)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (8, N'P495H8', 3)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (8, N'X846D3', 1)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (9, N'K284U8', 3)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (9, N'V378J3', 2)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'I483H3', 7)
INSERT [dbo].[OrderHasProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'N387I8', 6)
GO
SET IDENTITY_INSERT [dbo].[OrderPickupPoint] ON 

INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (1, N'344288', 1, 1, N'1')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (2, N'614164', 1, 2, N'30')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (3, N'394242', 1, 3, N'43')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (4, N'660540', 1, 4, N'25')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (5, N'125837', 1, 5, N'40')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (6, N'125703', 1, 6, N'49')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (7, N'625283', 1, 7, N'46')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (8, N'614611', 1, 8, N'50')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (9, N'454311', 1, 9, N'19')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (10, N'660007', 1, 10, N'19')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (11, N'603036', 1, 11, N'4')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (12, N'450983', 1, 12, N'26')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (13, N'394782', 1, 1, N'3')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (14, N'603002', 1, 13, N'28')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (15, N'450558', 1, 14, N'30')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (16, N'394060', 1, 15, N'43')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (17, N'410661', 1, 16, N'50')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (18, N'625590', 1, 3, N'20')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (19, N'625683', 1, 17, N'8')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (20, N'400562', 1, 18, N'32')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (21, N'614510', 1, 19, N'47')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (22, N'410542', 1, 20, N'46')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (23, N'620839', 1, 21, N'8')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (24, N'443890', 1, 3, N'1')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (25, N'603379', 1, 22, N'46')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (26, N'603721', 1, 23, N'41')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (27, N'410172', 1, 24, N'13')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (28, N'420151', 1, 25, N'32')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (29, N'125061', 1, 26, N'8')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (30, N'630370', 1, 5, N'24')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (31, N'614753', 1, 27, N'35')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (32, N'426030', 1, 19, N'44')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (33, N'450375', 1, 28, N'44')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (34, N'625560', 1, 29, N'12')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (35, N'630201', 1, 12, N'17')
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPointID], [PostIndex], [CityID], [StreetID], [HouseNumber]) VALUES (36, N'190949', 1, 30, N'26')
SET IDENTITY_INSERT [dbo].[OrderPickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusID], [Value]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Value]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', 1, 8500.0000, 5, 1, 1, 1, 4, 6, N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', N'B111C5.JPEG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', 1, 1133.0000, 10, 2, 1, 1, 3, 4, N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'D938K3', N'Фланель однотонная светлая', 1, 1300.0000, 10, 4, 3, 3, 4, 10, N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'E112C6', N'Муслин «Bej»', 1, 10500.0000, 15, 2, 2, 2, 3, 13, N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'E112C6.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'F374S8', N'Фланель рубашечная', 1, 2100.0000, 5, 1, 1, 3, 2, 5, N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'H483D9', N'Фланель детская H483D9', 1, 318.0000, 5, 3, 2, 2, 2, 18, N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'H497J3', N'Ситец детский', 1, 523.0000, 5, 1, 3, 2, 2, 8, N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', 1, 11300.0000, 10, 1, 2, 1, 2, 5, N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', 1, 5100.0000, 25, 2, 3, 2, 3, 2, N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'K839K3', N'Плюш белый в клетку', 1, 765.0000, 5, 2, 3, 2, 2, 3, N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'K839K3.JPG ')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'L293S9', N'Плюш розовый гладкий', 1, 30000.0000, 40, 3, 1, 2, 3, 2, N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'L293S9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'M112C8', N'Бязь детская «Совята»', 1, 26000.0000, 20, 2, 1, 2, 2, 14, N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'M112C8.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', 1, 5130.0000, 5, 2, 1, 3, 2, 1, N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'M294G9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'M398S9', N'Поплин Мокко', 1, 1800.0000, 15, 4, 3, 1, 2, 6, N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'M398S9.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', 1, 6500.0000, 5, 3, 1, 1, 3, 7, N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', N'N283K3.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', 1, 7000.0000, 20, 1, 3, 1, 2, 2, N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', 1, 1000.0000, 15, 1, 2, 3, 3, 5, N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', 1, 30660.0000, 10, 2, 2, 1, 4, 15, N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', 1, 3550.0000, 10, 4, 2, 3, 3, 9, N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'P495H8', N'Поплин «Густав»', 1, 1000.0000, 15, 3, 1, 1, 2, 14, N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'Q836H4', N'Фланель рубашечная', 1, 1350.0000, 5, 4, 1, 3, 4, 7, N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'R748K3', N'Поплин Морская волна', 1, 2300.0000, 15, 4, 3, 1, 2, 6, N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', 1, 1645.0000, 15, 2, 2, 1, 2, 13, N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'S384K2', N'Фланель черная', 1, 69000.0000, 40, 1, 3, 3, 4, 2, N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'S384K2.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'T238C7', N'Муслин «Gri»', 1, 6500.0000, 15, 1, 2, 2, 2, 12, N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'T238C7.JPG')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', 1, 3411.0000, 10, 2, 3, 2, 3, 4, N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'V378J3', N'Ситец детский', 1, 2400.0000, 15, 3, 3, 2, 3, 14, N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', 1, 1600.0000, 5, 1, 3, 1, 3, 9, N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'X846D3', N'Ситец детский', 1, 9300.0000, 25, 2, 1, 2, 3, 5, N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurementID], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerID], [ProviderID], [ProductCategoryID], [ProductCurrentDiscount], [ProductAmount], [ProductInfo], [ProductImage]) VALUES (N'Z937S2', N'Поплин Голубой', 1, 9000.0000, 10, 1, 1, 1, 2, 15, N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', N'')
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Value]) VALUES (1, N'Постельные ткани')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Value]) VALUES (2, N'Детские ткани')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Value]) VALUES (3, N'Ткани для изделий')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderID], [Value]) VALUES (1, N'Раута')
INSERT [dbo].[Provider] ([ProviderID], [Value]) VALUES (2, N'ООО Афо-Тек')
INSERT [dbo].[Provider] ([ProviderID], [Value]) VALUES (3, N'ГК Петров')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (1, N'Чехова')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (2, N'Степная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (3, N'Коммунистическая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (4, N'Солнечная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (5, N'Шоссейная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (6, N'Партизанская')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (7, N'Победы')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (8, N'Молодежная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (9, N'Новая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (10, N'Октябрьская')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (11, N'Садовая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (12, N'Комсомольская')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (13, N'Дзержинского')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (14, N'Набережная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (15, N'Фрунзе')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (16, N'Школьная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (17, N'8 Марта')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (18, N'Зеленая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (19, N'Маяковского')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (20, N'Светлая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (21, N'Цветочная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (22, N'Спортивная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (23, N'Гоголя')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (24, N'Северная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (25, N'Вишневая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (26, N'Подгорная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (27, N'Полевая')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (28, N'Клубная')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (29, N'Некрасова')
INSERT [dbo].[Street] ([StreetID], [Value]) VALUES (30, N'Мичурина')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitOfMeasurement] ON 

INSERT [dbo].[UnitOfMeasurement] ([UnitOfMeasurementID], [Value]) VALUES (1, N'Рулон')
SET IDENTITY_INSERT [dbo].[UnitOfMeasurement] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (1, N'Лавров', N'Богдан', N'Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (2, N'Смирнова', N'Полина', N'Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (3, N'Полякова', N'София', N'Данииловна', N'x@mail.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (4, N'Чеботарева', N'Марина', N'Данииловна', N'34d@gmail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (5, N'Ермолов', N'Адам', N'Иванович', N'pxacl@mail.ru', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (6, N'Васильев', N'Андрей', N'Кириллович', N'7o1@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (7, N'Маслов', N'Максим', N'Иванович', N'1@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (8, N'Симонов', N'Михаил', N'Тимурович', N'iut@gmail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (9, N'Павлова', N'Ксения', N'Михайловна', N'e3t@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (10, N'Трифонов', N'Григорий', N'Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (7, 1)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (7, 2)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (7, 3)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (7, 4)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (8, 5)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (8, 6)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (8, 7)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (9, 8)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (10, 9)
INSERT [dbo].[UserHasOrder] ([UserID], [OrderID]) VALUES (10, 10)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickupPoint] FOREIGN KEY([OrderPickupPointID])
REFERENCES [dbo].[OrderPickupPoint] ([OrderPickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[OrderHasProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderHasProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderHasProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderHasProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[OrderPickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_OrderPickupPoint_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[OrderPickupPoint] CHECK CONSTRAINT [FK_OrderPickupPoint_City]
GO
ALTER TABLE [dbo].[OrderPickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_OrderPickupPoint_Street] FOREIGN KEY([StreetID])
REFERENCES [dbo].[Street] ([StreetID])
GO
ALTER TABLE [dbo].[OrderPickupPoint] CHECK CONSTRAINT [FK_OrderPickupPoint_Street]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory1] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UnitOfMeasurement] FOREIGN KEY([ProductUnitOfMeasurementID])
REFERENCES [dbo].[UnitOfMeasurement] ([UnitOfMeasurementID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UnitOfMeasurement]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_UserHasOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[UserHasOrder] CHECK CONSTRAINT [FK_UserHasOrder_Order]
GO
ALTER TABLE [dbo].[UserHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_UserHasOrder_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserHasOrder] CHECK CONSTRAINT [FK_UserHasOrder_User]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
