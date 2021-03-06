USE [master]
GO
/****** Object:  Database [CategoriesDB]    Script Date: 27.02.2020 18:37:12 ******/
CREATE DATABASE [CategoriesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CategoriesDB', FILENAME = N'C:\Users\Patryk\CategoriesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CategoriesDB_log', FILENAME = N'C:\Users\Patryk\CategoriesDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CategoriesDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CategoriesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CategoriesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CategoriesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CategoriesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CategoriesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CategoriesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CategoriesDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CategoriesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CategoriesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CategoriesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CategoriesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CategoriesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CategoriesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CategoriesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CategoriesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CategoriesDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CategoriesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CategoriesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CategoriesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CategoriesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CategoriesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CategoriesDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CategoriesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CategoriesDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CategoriesDB] SET  MULTI_USER 
GO
ALTER DATABASE [CategoriesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CategoriesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CategoriesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CategoriesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CategoriesDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CategoriesDB] SET QUERY_STORE = OFF
GO
USE [CategoriesDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CategoriesDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27.02.2020 18:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryItems]    Script Date: 27.02.2020 18:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_CategoryItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221140716_InitialMigration', N'3.1.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221142909_update nullable', N'3.1.2')
SET IDENTITY_INSERT [dbo].[CategoryItems] ON 

INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (226, N'Samochody', NULL)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (227, N'Audi', 226)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (228, N'Mercedes', 226)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (229, N'BMW', 226)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (230, N'Języki programowania', NULL)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (231, N'Książki', NULL)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (232, N'Leki', NULL)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (233, N'Przeciwbólowe', 232)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (234, N'Antybiotyki', 232)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (235, N'Przeciwzapalne', 232)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (236, N'Przeciwzakrzepowe', 232)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (237, N'Paracetamol', 233)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (238, N'Ibuprom', 233)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (239, N'Duomox', 234)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (240, N'Amoksiklav', 234)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (241, N'Amotaks', 234)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (242, N'Poradniki', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (243, N'Literatura faktu', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (244, N'Powieści', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (245, N'Lektury', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (246, N'Encyklopedie', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (247, N'Albumy', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (248, N'Podręczniki', 231)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (249, N'C#', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (250, N'Java', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (251, N'Python', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (252, N'C++', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (253, N'C', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (254, N'Pascal', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (255, N'Dart', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (256, N'Scala', 230)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (257, N'M5', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (258, N'M4', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (259, N'M3', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (260, N'X6', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (261, N'8 Series', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (262, N'1M', 229)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (263, N'SLS', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (264, N'CLS', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (265, N'A Class', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (266, N'E Class', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (267, N'GLE', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (268, N'S Class', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (269, N'X Class', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (270, N'G Class', 228)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (271, N'SQ5', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (272, N'RS6', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (273, N'S7', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (274, N'A4', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (275, N'A5', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (276, N'A6', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (277, N'A8', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (278, N'A8L', 227)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (279, N'Andrzej Sapkowski', 244)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (280, N'Krew Elfów', 279)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (281, N'Chrzest Ognia', 279)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (282, N'Czas Pogardy', 279)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (283, N'Wieża Jaskółki', 279)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (284, N'Pani Jeziora', 279)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (285, N'TDI', 271)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (286, N'TFSI', 271)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (287, N'3.0', 285)
INSERT [dbo].[CategoryItems] ([Id], [Name], [ParentID]) VALUES (288, N'4.2', 285)
SET IDENTITY_INSERT [dbo].[CategoryItems] OFF
USE [master]
GO
ALTER DATABASE [CategoriesDB] SET  READ_WRITE 
GO
