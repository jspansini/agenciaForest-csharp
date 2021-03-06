USE [master]
GO
/****** Object:  Database [forestTravel]    Script Date: 24/03/2022 16:31:29 ******/
CREATE DATABASE [forestTravel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'forestTravel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYSQLSERVERDEV\MSSQL\DATA\forestTravel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'forestTravel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYSQLSERVERDEV\MSSQL\DATA\forestTravel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [forestTravel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [forestTravel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [forestTravel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [forestTravel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [forestTravel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [forestTravel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [forestTravel] SET ARITHABORT OFF 
GO
ALTER DATABASE [forestTravel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [forestTravel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [forestTravel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [forestTravel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [forestTravel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [forestTravel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [forestTravel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [forestTravel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [forestTravel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [forestTravel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [forestTravel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [forestTravel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [forestTravel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [forestTravel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [forestTravel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [forestTravel] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [forestTravel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [forestTravel] SET RECOVERY FULL 
GO
ALTER DATABASE [forestTravel] SET  MULTI_USER 
GO
ALTER DATABASE [forestTravel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [forestTravel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [forestTravel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [forestTravel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [forestTravel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [forestTravel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'forestTravel', N'ON'
GO
ALTER DATABASE [forestTravel] SET QUERY_STORE = OFF
GO
USE [forestTravel]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24/03/2022 16:31:29 ******/
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
/****** Object:  Table [dbo].[CadastrarPassagem]    Script Date: 24/03/2022 16:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CadastrarPassagem](
	[IdPassagem] [int] IDENTITY(1,1) NOT NULL,
	[DestinoPassagem] [nvarchar](max) NULL,
	[ValorPassagem] [float] NOT NULL,
 CONSTRAINT [PK_CadastrarPassagem] PRIMARY KEY CLUSTERED 
(
	[IdPassagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprarPassagem]    Script Date: 24/03/2022 16:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprarPassagem](
	[IdPassagem] [int] IDENTITY(1,1) NOT NULL,
	[DestinoPassagem] [nvarchar](max) NULL,
	[ValorPassagem] [float] NOT NULL,
	[cadastrarPassagem] [int] NOT NULL,
 CONSTRAINT [PK_ComprarPassagem] PRIMARY KEY CLUSTERED 
(
	[IdPassagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ComprarPassagem_cadastrarPassagem]    Script Date: 24/03/2022 16:31:29 ******/
CREATE NONCLUSTERED INDEX [IX_ComprarPassagem_cadastrarPassagem] ON [dbo].[ComprarPassagem]
(
	[cadastrarPassagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComprarPassagem]  WITH CHECK ADD  CONSTRAINT [FK_ComprarPassagem_CadastrarPassagem_cadastrarPassagem] FOREIGN KEY([cadastrarPassagem])
REFERENCES [dbo].[CadastrarPassagem] ([IdPassagem])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComprarPassagem] CHECK CONSTRAINT [FK_ComprarPassagem_CadastrarPassagem_cadastrarPassagem]
GO
USE [master]
GO
ALTER DATABASE [forestTravel] SET  READ_WRITE 
GO
