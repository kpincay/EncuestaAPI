USE [master]
GO
/****** Object:  Database [macro_encuesta]    Script Date: 26/11/2022 02:47:11 p. m. ******/
CREATE DATABASE [macro_encuesta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'macro_ecnuesta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\macro_ecnuesta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'macro_ecnuesta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\macro_ecnuesta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [macro_encuesta] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [macro_encuesta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [macro_encuesta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [macro_encuesta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [macro_encuesta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [macro_encuesta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [macro_encuesta] SET ARITHABORT OFF 
GO
ALTER DATABASE [macro_encuesta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [macro_encuesta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [macro_encuesta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [macro_encuesta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [macro_encuesta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [macro_encuesta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [macro_encuesta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [macro_encuesta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [macro_encuesta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [macro_encuesta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [macro_encuesta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [macro_encuesta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [macro_encuesta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [macro_encuesta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [macro_encuesta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [macro_encuesta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [macro_encuesta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [macro_encuesta] SET RECOVERY FULL 
GO
ALTER DATABASE [macro_encuesta] SET  MULTI_USER 
GO
ALTER DATABASE [macro_encuesta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [macro_encuesta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [macro_encuesta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [macro_encuesta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [macro_encuesta] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [macro_encuesta] SET QUERY_STORE = OFF
GO
USE [macro_encuesta]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26/11/2022 02:47:12 p. m. ******/
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
/****** Object:  Table [dbo].[Encuestado]    Script Date: 26/11/2022 02:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuestado](
	[idEncuestado] [uniqueidentifier] NOT NULL,
	[identificacion] [varchar](13) NOT NULL,
	[nombresApellidos] [varchar](100) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_Encuestado] PRIMARY KEY CLUSTERED 
(
	[idEncuestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncuestaMaestro]    Script Date: 26/11/2022 02:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncuestaMaestro](
	[idEncuesta] [uniqueidentifier] NOT NULL,
	[orden] [int] NOT NULL,
	[pregunta] [varchar](100) NOT NULL,
	[escala] [varchar](50) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EncuestaMaestro] PRIMARY KEY CLUSTERED 
(
	[idEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EncuestaTransaccion]    Script Date: 26/11/2022 02:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncuestaTransaccion](
	[idEncuestaTransaccion] [uniqueidentifier] NOT NULL,
	[idEncuesta] [uniqueidentifier] NOT NULL,
	[idEncuestado] [uniqueidentifier] NOT NULL,
	[idSucursal] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EncuestaTransaccion] PRIMARY KEY CLUSTERED 
(
	[idEncuestaTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 26/11/2022 02:47:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [uniqueidentifier] NOT NULL,
	[nombreSucursal] [varchar](100) NOT NULL,
	[nombreCiudad] [varchar](100) NOT NULL,
	[nombreProvincia] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_EncuestaTransaccion_idEncuesta]    Script Date: 26/11/2022 02:47:12 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_EncuestaTransaccion_idEncuesta] ON [dbo].[EncuestaTransaccion]
(
	[idEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EncuestaTransaccion_idEncuestado]    Script Date: 26/11/2022 02:47:12 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_EncuestaTransaccion_idEncuestado] ON [dbo].[EncuestaTransaccion]
(
	[idEncuestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EncuestaTransaccion_idSucursal]    Script Date: 26/11/2022 02:47:12 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_EncuestaTransaccion_idSucursal] ON [dbo].[EncuestaTransaccion]
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EncuestaTransaccion]  WITH CHECK ADD  CONSTRAINT [FK_EncuestaTransaccion_Encuestado_idEncuestado] FOREIGN KEY([idEncuestado])
REFERENCES [dbo].[Encuestado] ([idEncuestado])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EncuestaTransaccion] CHECK CONSTRAINT [FK_EncuestaTransaccion_Encuestado_idEncuestado]
GO
ALTER TABLE [dbo].[EncuestaTransaccion]  WITH CHECK ADD  CONSTRAINT [FK_EncuestaTransaccion_EncuestaMaestro_idEncuesta] FOREIGN KEY([idEncuesta])
REFERENCES [dbo].[EncuestaMaestro] ([idEncuesta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EncuestaTransaccion] CHECK CONSTRAINT [FK_EncuestaTransaccion_EncuestaMaestro_idEncuesta]
GO
ALTER TABLE [dbo].[EncuestaTransaccion]  WITH CHECK ADD  CONSTRAINT [FK_EncuestaTransaccion_Sucursal_idSucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EncuestaTransaccion] CHECK CONSTRAINT [FK_EncuestaTransaccion_Sucursal_idSucursal]
GO
USE [master]
GO
ALTER DATABASE [macro_encuesta] SET  READ_WRITE 
GO
