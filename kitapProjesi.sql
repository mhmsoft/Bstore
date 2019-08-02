USE [master]
GO
/****** Object:  Database [kitapProjesi]    Script Date: 28.07.2019 15:06:17 ******/
CREATE DATABASE [kitapProjesi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kitapProjesi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\kitapProjesi.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kitapProjesi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\kitapProjesi_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kitapProjesi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kitapProjesi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kitapProjesi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kitapProjesi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kitapProjesi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kitapProjesi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kitapProjesi] SET ARITHABORT OFF 
GO
ALTER DATABASE [kitapProjesi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kitapProjesi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kitapProjesi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kitapProjesi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kitapProjesi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kitapProjesi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kitapProjesi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kitapProjesi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kitapProjesi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kitapProjesi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kitapProjesi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kitapProjesi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kitapProjesi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kitapProjesi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kitapProjesi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kitapProjesi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kitapProjesi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kitapProjesi] SET RECOVERY FULL 
GO
ALTER DATABASE [kitapProjesi] SET  MULTI_USER 
GO
ALTER DATABASE [kitapProjesi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kitapProjesi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kitapProjesi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kitapProjesi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kitapProjesi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [kitapProjesi]
GO
/****** Object:  Table [dbo].[Favorim]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kategori]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kategori](
	[kategoriNo] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAdi] [varchar](50) NULL,
	[aciklama] [varchar](100) NULL,
	[resimAdi] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[kategoriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resim]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resim](
	[resimNo] [int] IDENTITY(1,1) NOT NULL,
	[urunNo] [int] NULL,
	[resimAdi] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[resimNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[urun]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[urun](
	[urunNo] [int] IDENTITY(1,1) NOT NULL,
	[urunAdi] [varchar](100) NULL,
	[yazar] [varchar](50) NULL,
	[yayinEvi] [varchar](50) NULL,
	[fiyat] [decimal](5, 2) NULL,
	[aciklama] [text] NULL,
	[stok] [int] NULL,
	[kategoriNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[urunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](max) NULL,
	[rePassword] [varchar](max) NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[address] [text] NULL,
	[activationCode] [varchar](max) NULL,
	[resetCode] [varchar](max) NULL,
	[hostName] [varchar](100) NULL,
	[isActive] [bit] NULL,
	[loginAttempt] [int] NULL,
	[createdDate] [datetime] NULL,
	[loginTime] [datetime] NULL,
	[isMailVerified] [bit] NULL,
	[roleId] [int] NULL,
	[city] [varchar](50) NULL,
	[subscribe] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[yorum]    Script Date: 28.07.2019 15:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yorum](
	[yorumNo] [int] IDENTITY(1,1) NOT NULL,
	[urunNo] [int] NULL,
	[yorumAdi] [varchar](max) NULL,
	[yorumcu] [varchar](50) NULL,
	[yorumTarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[yorumNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Favorim]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[urun] ([urunNo])
GO
ALTER TABLE [dbo].[Favorim]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[resim]  WITH CHECK ADD  CONSTRAINT [FK_UrunNo] FOREIGN KEY([urunNo])
REFERENCES [dbo].[urun] ([urunNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[resim] CHECK CONSTRAINT [FK_UrunNo]
GO
ALTER TABLE [dbo].[urun]  WITH CHECK ADD  CONSTRAINT [FK_KategoriNo] FOREIGN KEY([kategoriNo])
REFERENCES [dbo].[kategori] ([kategoriNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[urun] CHECK CONSTRAINT [FK_KategoriNo]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([roleId])
GO
ALTER TABLE [dbo].[yorum]  WITH CHECK ADD FOREIGN KEY([urunNo])
REFERENCES [dbo].[urun] ([urunNo])
GO
USE [master]
GO
ALTER DATABASE [kitapProjesi] SET  READ_WRITE 
GO
