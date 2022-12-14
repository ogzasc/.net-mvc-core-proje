USE [master]
GO
/****** Object:  Database [filmdb]    Script Date: 07/10/2022 00:54:21 ******/
CREATE DATABASE [filmdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'filmdb', FILENAME = N'C:\Users\OGZ\filmdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'filmdb_log', FILENAME = N'C:\Users\OGZ\filmdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [filmdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [filmdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [filmdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [filmdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [filmdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [filmdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [filmdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [filmdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [filmdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [filmdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [filmdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [filmdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [filmdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [filmdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [filmdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [filmdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [filmdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [filmdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [filmdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [filmdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [filmdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [filmdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [filmdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [filmdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [filmdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [filmdb] SET  MULTI_USER 
GO
ALTER DATABASE [filmdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [filmdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [filmdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [filmdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [filmdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [filmdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [filmdb] SET QUERY_STORE = OFF
GO
USE [filmdb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/10/2022 00:54:22 ******/
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
/****** Object:  Table [dbo].[Filmler]    Script Date: 07/10/2022 00:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filmler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmAd] [nvarchar](max) NULL,
	[FilmYapimYil] [datetime2](7) NULL,
 CONSTRAINT [PK_Filmler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gosterim]    Script Date: 07/10/2022 00:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gosterim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GTarihi] [nvarchar](max) NULL,
	[SalonID] [int] NOT NULL,
	[FilmID] [int] NOT NULL,
 CONSTRAINT [PK_Gosterim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 07/10/2022 00:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salonlar]    Script Date: 07/10/2022 00:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salonlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonAd] [nvarchar](max) NULL,
 CONSTRAINT [PK_Salonlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221006084503_hfdf', N'5.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221006155756_mg89', N'5.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221006194325_YeniEkle', N'5.0.3')
GO
SET IDENTITY_INSERT [dbo].[Filmler] ON 

INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (5, N'Oz Büyücüsü', CAST(N'1939-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (6, N'Star Wars', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (7, N'Psycho', CAST(N'1960-01-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (8, N'Ben-Hur', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (9, N'Rocky', CAST(N'1976-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (10, N'Vertigo', CAST(N'1958-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (11, N'Forrest Gump', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (12, N'The Gold Rush', CAST(N'1925-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (13, N'Batman', CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (14, N'Avatar', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (15, N'Django', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (16, N'Life Of Pi', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (17, N'Drive', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (18, N'Gravity', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Filmler] ([Id], [FilmAd], [FilmYapimYil]) VALUES (19, N'Kan Kalacak', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Filmler] OFF
GO
SET IDENTITY_INSERT [dbo].[Gosterim] ON 

INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (8, N'2022', 1, 5)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (9, N'2010', 6, 7)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (11, N'1999', 4, 8)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (12, N'2005', 3, 9)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (13, N'2000', 3, 6)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (14, N'2002', 8, 11)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (15, N'1950', 2, 12)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (16, N'1960', 5, 13)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (17, N'1958', 7, 14)
INSERT [dbo].[Gosterim] ([Id], [GTarihi], [SalonID], [FilmID]) VALUES (18, N'1999', 7, 14)
SET IDENTITY_INSERT [dbo].[Gosterim] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([Id], [UserName], [Password]) VALUES (1, N'admin', N'1234')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Salonlar] ON 

INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (1, N'A1')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (2, N'A2')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (3, N'A3')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (4, N'B1')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (5, N'B2')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (6, N'B3')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (7, N'C1')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (8, N'C2')
INSERT [dbo].[Salonlar] ([Id], [SalonAd]) VALUES (9, N'C3')
SET IDENTITY_INSERT [dbo].[Salonlar] OFF
GO
/****** Object:  Index [IX_Gosterim_FilmID]    Script Date: 07/10/2022 00:54:22 ******/
CREATE NONCLUSTERED INDEX [IX_Gosterim_FilmID] ON [dbo].[Gosterim]
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gosterim_SalonID]    Script Date: 07/10/2022 00:54:22 ******/
CREATE NONCLUSTERED INDEX [IX_Gosterim_SalonID] ON [dbo].[Gosterim]
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gosterim]  WITH CHECK ADD  CONSTRAINT [FK_Gosterim_Filmler_FilmID] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Filmler] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gosterim] CHECK CONSTRAINT [FK_Gosterim_Filmler_FilmID]
GO
ALTER TABLE [dbo].[Gosterim]  WITH CHECK ADD  CONSTRAINT [FK_Gosterim_Salonlar_SalonID] FOREIGN KEY([SalonID])
REFERENCES [dbo].[Salonlar] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gosterim] CHECK CONSTRAINT [FK_Gosterim_Salonlar_SalonID]
GO
USE [master]
GO
ALTER DATABASE [filmdb] SET  READ_WRITE 
GO
