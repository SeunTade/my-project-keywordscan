USE [master]
GO
/****** Object:  Database [KeywordScanWeb]    Script Date: 24/04/2025 12:15:23 ******/
CREATE DATABASE [KeywordScanWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KeywordScanWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\KeywordScanWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KeywordScanWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\KeywordScanWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KeywordScanWeb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KeywordScanWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KeywordScanWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KeywordScanWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KeywordScanWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KeywordScanWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KeywordScanWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KeywordScanWeb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KeywordScanWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KeywordScanWeb] SET  MULTI_USER 
GO
ALTER DATABASE [KeywordScanWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KeywordScanWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KeywordScanWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KeywordScanWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KeywordScanWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KeywordScanWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KeywordScanWeb] SET QUERY_STORE = ON
GO
ALTER DATABASE [KeywordScanWeb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KeywordScanWeb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24/04/2025 12:15:23 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebSearchResponse]    Script Date: 24/04/2025 12:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSearchResponse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SearchEngine] [nvarchar](max) NULL,
	[RowCount] [int] NULL,
	[PositionsIndex] [nvarchar](max) NULL,
	[RunTime] [datetime2](7) NULL,
	[Messages] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebSearchResponse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250424071915_MigrationName', N'9.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250424075001_MigrationName2', N'9.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250424083402_MigrationName3', N'9.0.4')
GO
SET IDENTITY_INSERT [dbo].[WebSearchResponse] ON 
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (1, NULL, 7, N'1, 2, 6, 8, 9, 14, 20', NULL, N'["Bing: Found at positions 1, 2, 6, 8, 9, 14, 20","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (2, NULL, 7, N'1, 2, 5, 6, 7, 13, 18', CAST(N'2025-04-24T10:48:35.7072586' AS DateTime2), N'["Bing: Found at positions 1, 2, 5, 6, 7, 13, 18","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (3, NULL, 7, N'1, 2, 6, 7, 8, 14, 20', CAST(N'2025-04-24T10:57:24.8966424' AS DateTime2), N'["Bing: Found at positions 1, 2, 6, 7, 8, 14, 20","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (4, NULL, 6, N'1, 2, 7, 8, 10, 15', CAST(N'2025-04-24T10:59:21.2414890' AS DateTime2), N'["Bing: Found at positions 1, 2, 7, 8, 10, 15","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (5, NULL, 7, N'1, 2, 6, 7, 8, 14, 19', CAST(N'2025-04-24T11:01:42.5201652' AS DateTime2), N'["Bing: Found at positions 1, 2, 6, 7, 8, 14, 19","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (6, NULL, 7, N'1, 2, 6, 7, 8, 13, 21', CAST(N'2025-04-24T11:03:43.0748544' AS DateTime2), N'["Bing: Found at positions 1, 2, 6, 7, 8, 13, 21","Google: Blocked or Captcha triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (7, NULL, 7, N'1, 2, 10, 15, 16, 18, 19', CAST(N'2025-04-24T11:14:44.9429829' AS DateTime2), N'["Bing: Found at positions 1, 2, 10, 15, 16, 18, 19","Google: Blocked by engine or Captcha has been triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (8, NULL, 0, N'0', CAST(N'2025-04-24T11:18:53.3927390' AS DateTime2), N'["Bing: Not found","Google: Blocked by engine or Captcha has been triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (9, NULL, 8, N'1, 2, 6, 7, 8, 14, 16, 22', CAST(N'2025-04-24T11:20:10.0539256' AS DateTime2), N'["Bing: Found at positions 1, 2, 6, 7, 8, 14, 16, 22","Google: Blocked by engine or Captcha has been triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (10, NULL, 7, N'1, 2, 5, 7, 8, 13, 20', CAST(N'2025-04-24T11:31:58.3905807' AS DateTime2), N'["Bing: Found at positions 1, 2, 5, 7, 8, 13, 20","Google: Blocked by engine or Captcha has been triggered"]')
GO
INSERT [dbo].[WebSearchResponse] ([Id], [SearchEngine], [RowCount], [PositionsIndex], [RunTime], [Messages]) VALUES (11, NULL, 7, N'1, 2, 6, 7, 8, 13, 20', CAST(N'2025-04-24T12:02:16.3263438' AS DateTime2), N'["Bing: Found at positions 1, 2, 6, 7, 8, 13, 20","Google: Blocked by engine or Captcha has been triggered"]')
GO
SET IDENTITY_INSERT [dbo].[WebSearchResponse] OFF
GO
USE [master]
GO
ALTER DATABASE [KeywordScanWeb] SET  READ_WRITE 
GO
