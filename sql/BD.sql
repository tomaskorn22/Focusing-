USE [master]
GO
/****** Object:  Database [Focusing Empowering Minds]    Script Date: 26/11/2024 09:07:13 ******/
CREATE DATABASE [Focusing Empowering Minds]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Focusing Empowering Minds', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Focusing Empowering Minds.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Focusing Empowering Minds_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Focusing Empowering Minds_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Focusing Empowering Minds] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Focusing Empowering Minds].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Focusing Empowering Minds] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET ARITHABORT OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Focusing Empowering Minds] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Focusing Empowering Minds] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Focusing Empowering Minds] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Focusing Empowering Minds] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET RECOVERY FULL 
GO
ALTER DATABASE [Focusing Empowering Minds] SET  MULTI_USER 
GO
ALTER DATABASE [Focusing Empowering Minds] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Focusing Empowering Minds] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Focusing Empowering Minds] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Focusing Empowering Minds] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Focusing Empowering Minds] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Focusing Empowering Minds', N'ON'
GO
ALTER DATABASE [Focusing Empowering Minds] SET QUERY_STORE = OFF
GO
USE [Focusing Empowering Minds]
GO
/****** Object:  User [alumno]    Script Date: 26/11/2024 09:07:13 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario](
	[id_Calendario] [int] IDENTITY(1,1) NOT NULL,
	[fechas] [datetime] NULL,
	[id_categoria] [int] NULL,
	[id_recordatorio] [int] NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[id_Calendario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Titulo] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[id_Foro] [int] IDENTITY(1,1) NOT NULL,
	[Descrpicion] [varchar](200) NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Foro] PRIMARY KEY CLUSTERED 
(
	[id_Foro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[id_juegos] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[foto] [text] NULL,
	[Id_sentimiento] [int] NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[id_juegos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Melodias]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Melodias](
	[id_Melodias] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NULL,
	[sonido] [text] NULL,
	[foto] [text] NULL,
	[Id_sentimiento] [int] NULL,
 CONSTRAINT [PK_Melodias] PRIMARY KEY CLUSTERED 
(
	[id_Melodias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recordatorio]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recordatorio](
	[id_recordatorio] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_id_recordatorio] PRIMARY KEY CLUSTERED 
(
	[id_recordatorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sentimientos]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sentimientos](
	[Id_sentimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[foto] [text] NULL,
 CONSTRAINT [PK_Sentimientos] PRIMARY KEY CLUSTERED 
(
	[Id_sentimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentimientosXJuegos]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentimientosXJuegos](
	[id_sentimientosXjuego] [int] IDENTITY(1,1) NOT NULL,
	[Id_sentimiento] [int] NULL,
	[id_juegos] [int] NULL,
 CONSTRAINT [PK_SentimientosXJuegos] PRIMARY KEY CLUSTERED 
(
	[id_sentimientosXjuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentimientosXMelodias]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentimientosXMelodias](
	[id_sentimientoXmelodias] [int] IDENTITY(1,1) NOT NULL,
	[Id_sentimiento] [int] NULL,
	[id_Melodias] [int] NULL,
 CONSTRAINT [PK_SentimientosXMelodias] PRIMARY KEY CLUSTERED 
(
	[id_sentimientoXmelodias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentimientosXTips]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentimientosXTips](
	[id_sentimientosXtips] [int] IDENTITY(1,1) NOT NULL,
	[Id_sentimiento] [int] NULL,
	[id_tips] [int] NULL,
 CONSTRAINT [PK_SentimientosXTips] PRIMARY KEY CLUSTERED 
(
	[id_sentimientosXtips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tips]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tips](
	[id_tips] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[Id_sentimiento] [int] NULL,
 CONSTRAINT [PK_Tips] PRIMARY KEY CLUSTERED 
(
	[id_tips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[apellido] [varchar](200) NULL,
	[mail] [varchar](300) NULL,
	[contraseña] [varchar](200) NULL,
	[edad] [int] NULL,
	[Id_sentimiento] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 

INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (1, N'Rompecabezas', N'Encajá las piezas para formar una imagen.', N'https://cdn-icons-png.flaticon.com/512/5873/5873228.png', 1)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (2, N'Sudoku', N'Descubrí donde va cada número sin repetir en columna, fila o cuadrado. ', N'https://lh5.googleusercontent.com/proxy/XayDM97LThnmbYdELhbkmoAFh3O6HOMz3yBHnmoSLptsOBA5dhXv0YXk_faavulZaN1JuYHaAS1dpavvDnqRZ_gNA52flHgE9dVBQwijCGNVfA9i7-4', 2)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (3, N'Crucigrama', N'Encontrá todas las palabras cruzadas. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGC2OXpWQZGZ0M0mVfxtTtFaUJSqTIUbDang&s', 1)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (4, N'Sopa de letras', N'Encontrá todas las palabras ocultas. ', N'https://upload.wikimedia.org/wikipedia/commons/a/a4/Ortograf%C3%ADa_b-v.png', 1)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (5, N'Diferencias', N'Encontrá todas las diferencias entre las imagenes. ', N'https://comunidad.pami.org.ar/wp-content/uploads/2021/08/JUEGOS-NUEVA-IMAGEN-13.png', 4)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (6, N'Memotest', N'Encontrá los pares de los distintos dibujos escondidos. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5DjfCZLsVxgwHPoR3xgHEKtt1j8i_cCJkqA&s', 5)
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Melodias] ON 

INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (1, N'Motivacion', N'https://cdn.pixabay.com/download/audio/2024/09/21/audio_a14ee6c264.mp3', N'https://img.freepik.com/free-photo/man-jumping-impossible-possible-cliff-sunset-background-business-concept-idea_1323-265.jpg', 1)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (2, N'Calma', N'https://cdn.pixabay.com/download/audio/2022/04/27/audio_30ff2fdf22.mp3?filename=sedative-110241.mp3', N'https://www.lavanguardia.com/files/og_thumbnail/files/fp/uploads/2023/10/10/6524fb7122390.r_d.2845-2239-2000.jpeg', 1)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (3, N'Ruido Urbano', N'https://cdn.pixabay.com/download/audio/2022/01/21/audio_31743c58bd.mp3?filename=spirit-blossom-15285.mp3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgTKvECmghMuz7PFr2bkiz5eIW-GvznNGN_A&s', 1)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (4, N'Ruido Urbano', N'https://cdn.pixabay.com/download/audio/2024/09/18/audio_6f5b0e8a5d.mp3?filename=rain-242006.mp3', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSEBIVFRUXFRUWFhUVFQ8VFRUWFRUXFxUVFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQFy8dHR0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0rKy0tLS0rKystLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAECAwUGBwj/xABHEAABAwEDBwgGCAMIAwEAAAABAAIDEQQFIRIxQWFxscEGEyJRgZGh0TJygpKy8CNCUlNiosLhFBVUBxZDg7PS4vEzY3Mk/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT/xAAeEQEBAQEAAwEBAQEAAAAAAAAAARECITFBEmEDMv/aAAwDAQACEQMRAD8A8ujjVrmfPYVJjVY5ubbwK6XKfIw7RvCubHipBiIYzHu4pGiyNXsjVjGK5kanVSIMjUmx7zvRMcKtZDm2u3qNVimOFWOgwOw7kXHEpmLDw78EtPEWwAA6hwU4Yui3YNyJ5qoI1FWMjwCnVYgI0i3ptFNDjspQDeihHuG5Jsf0mxh8SPJI0QxJsdPHxRIjUmxpaYN0eIT5Cunc1poSNOGnuzqp9qYPSJbrc14HeQgGbGmij6WP2mncrY5WO9FzTsIKmGoAK1xYnbxQNocGjHAnNs6ytS3zNZlOd+MjsaXcPFeeX1eznPcamhoK7CfNXzNR1cFy3qxoOVIR0n4NDSfTNNCFHKIDN0vZyXeBofBc5O/DtHFDFy1yM55egWO2slFW5+pcbew//RJ6ztxQkVpc01a4tPWDROJCX5TzWuVjroUleXRSM6Ldg3IO0MWhToNOpvBD2huBVxmAqnUKFOjR+WnGxXPZh89RUo2K1zeO4oBMbm+dCJjZj860zGZvnQi4o8R89ai1Uh440VHEpRRoqONRauRCONSbHm9Z28omONSZHm9Z29ynVYaKNSMeHaPiCKhj4qXN4DaN9UtNGONWiJXRRq4R8UjUCPhuCeKHpuOpo7so8UW2LhuU44cTt4BIw5YBicyy7wtjWV5wkAZ2NoCK5st+g/hFStG/7UIY2GlXOeaDSS1uAHafBef3lLlEukIcRo/w2ddB9c9ZOCrnnUddYLtfKluPN2cZPrEV1nCnfisiXlMQathiG3pn3qrKtc9cdCzZZxoW35kZfq1uu5UPJ6TISOoxneHVCOsXK3JOGU0aWk85H2V6Tewri3OUSUWQ5a9Ett+smFKiro5g0NNRi0O/QQuLtMlR2ICz2pzHtcPqkHaNI7qjtVk7xWgzZ2nrGhHOQdSoyZvnWhyri7QqnIquUaqcb840H5qqlMKYdjp7tkJjAONACNleBBCnKEBc8hFK5qkDt0d+T3rTmC0jKs3ISV1EkYNa0bFa9mHfuKeNqILM3zoU6eFFHm+dCOijzfOgquCPNsR0UeIU2rkTjYiWRqUcSJjjWdq5EI2Kxkeb1nb3K5kasjjw9o/EUtMoo9x3KUcfo7eBREUfHcpQM9Hb+gpGUUWKuZEr44lcyNAUiJZ15XzHCaEFx00IAaOsk8OsI+9bTkANb6bsBqGlx1BeeXxasqN7gfrnbRpyW12nKdtVczanq4V9Xm59ofzjsosqGDFrWtdTEDSSaYrlrdNWpOZWT2znACD0wyh6yGYd+TT3VlTSZQHaeC35mMeroaZ9UK8q+YoZxTohiVElMSo1UauQ5Th2FD2av2USkEjSBTuCgCpgpwqrThMkElNK73E5LfxdubK/SF0FoGHcsq5bDWjjgaOI1EUodtSe4rXeatxwNRUdRBxC0jKhKJ1GmtOmlvRMRXN4t7dyUEaJyMW7TuKy1ph7MzBuwbkcxmLfW4FQskfRbsG5GsZi3bwKi1eLmRohjEmNRLGbxvChZo41bFHh7R+Mq6ONXwxYe0fjKIEYo8R2nhxUbKzFvz9QeaPjixVNnj+EfAxML2xqzIoCToqrmR4/OpKZnRO0bwkHB2+2F807q5gWM/MMNuQ9cLZLXlxyROz1O8keJ8V0l4z5Am+0y0vd7LDT9TiuMvtnNzc5H6LhlN1tOcbQVtzGXVZUspY8EdfcVCdwoHtwBJBHUc9NmKneIDhlDMfA6QgYpaVB9E5xuI1haVEhnyVVRKscwVz4JjqUqiunWmKcpklEUxKRKQSM4SBSTIBKcDKuA6yB4qIVkRoQeogpk7C7mDJBH2Wg7aZTvFyU4xOvJPjTgFVclrD2ZJ9IAHwpXw8UTam7wN6qMqo5lJEUST0OgiYiWsxb27lGBuA2IlrMR27lja1zwtsbOi31RuRYbi3bwKhY2dFvqjciwzFu3gVC18bdKLbHm2jeFXFGjo2ZtvFI0ookRFHh2/qU441exmHfvRAZjEPGzD2f0NR8TN53oZrMPZ/Q1AGBihPH0Sig3DtSczP2oDyLlNCWWyZlMHhrx1VcM3aVxUwygYHYFpJjJ0HqO5e3X1czZLS3LbVksMkLtRwcw6iC2lda8kva7S89LoSglhccznDQ8aCdBHXiNK14rPqORyi0uY4aaOB0HrCDnZQrdvGzvlbl0q9g6ZbiS0fWcM4I6yFjDEbFp7Zhy5RLlY9igAlVTEaKJKclRU1UJOmToMkgEgnQCatm47tEwkytAFDr+QgLPZHOpoqQ3HX/ANjvXQ8jiBzrD6XlUFP0m+QUlgls5Dwata6hIrgNeo1W7Ni2uw+IWhNACHA5nHgBwQTWUiA6qN91+TwTlTTUSVuQkkMdNZmYBE5OLe3co2duHfvRGRiO3cst8tfi+yt6Ldg3IoNxb63AqFlb0W7BuRWRiz1hucpMZZ4kWxnSpsPfhwU7G0Il7BUbRvRDSYxWxNwPb8SkxqsiZgdp+JANEzed6GYzo+x+hqPjbvVAZh/lu+FiAKyVLJx+epWFqTSDQjEEYHaEANa7LlDWMV57/aHcRb9KyMvZIQJKYFpNSHjqNdOsr05Y3K2VrbLJWhysljQftvcGt8SD2JylXhlmu2b+GNrDi2Vk8jAQMkjJpgRrrmXJWp4fIXBoY84lowaXaafZqce1e0Q2IG7nDT/ETV2lxH6QvIL8sOS/DP8AuVtxdZdTGbMOzgdIQyL5zKGOfrQqupikpKRSIUY01ApirA1MWpYNNkrRu265JDg0068wQ9hnyXCoqNPXtC7u5bOD04y3DpGgOLToIrtprGtMrq657ia1pDxXKFD1U6h5rm7wsxslqDgSWuOc6QcDXWvTRBQLneVd2c5E8gVyWl3do7lM62neci+WNZ3N9A+u7xlJ4rZuqyl0LA4mojBJOJ6IqK68yz5Bg71xvCJSsUZCSIokjSx0kDeO9EZOI9rcoWcK9w06nbln9a/F9lwY31RuV1pnDQ0/i/S5VMb0RsG5Yd+WkgU/GfheiQVvRXvR2dasFvyi3W5o8V5xZLSS44/WK6+6XVLPXZvTswpddvGFdG3A/OlQgCJAUqRibn28AqaYf5b90aLYN6qiZXD8Lh35PkghKGi6LWjqoiUJbTQIMhaQuJ5eyTNLnPjeYKRuimZlPbBKx1ayxNxoSB08aY5tO0JzlEazvXQWFuUwg/OCPRV5vc17QObaGGRoY5/OsJIyfpRiAdPSB7151ypshbK4amnsqQur/tLu6KEzCJoYfoJXBoAzySsc6mvKZXYFwovQkCObpUaWtfpLTmB66LbifYz7vxgWiPJKGRludjsCDK0rOKypAKDjipVUtD5KQU1FNOmLVq3Bfz7OSKBzDgWnqOfJdo3LLUErDlewXLyjgtAAD6SaWO6LjrGg9iKmNHUOY4LxUbTqxzbFabZL96/PX0nZ6UrtUfhevZ65Iw+yR2EUWPam59o4LzWyXlIx4cXyGhFQHvBNNFV3Flv+GUDpZJJpQ9etKc4VrRyEk/PN+0O8JJk6eAZ9vAItsVa+o/4UBBLifnQi2WsNO1rx+QrP60+DjFRo2BcpfrOnT8R+Fy6j+Na5op9keNVz18ir/a/S5OeyvpiXezHt8l2tztxb6zd4XL2SHpHb5LqrvwA2hPq+Rz6dzZ0UAs6xTigRzZQoUuAVNnzns8SRwUxIFS2UCvrD4v3QQsrOvJ/ROxXPtAWRedpwQYRw+kPrFdRdY6K5ES9PaR4hbt1W2hoerigMb+0zk7z0XPRsL3ta5r2tFXOjfnoKitCGu9lfPd42V0dKnAjKacRlNOZwa4A0OxfW7JgVwXKm6Y3GSx9EMmBlha40bl1+mYzXXJeB+J+gLTnvEdc6+bHy1P8A0oly0r8uaSzyOjkaQQdIosvJWiJhwAiIoMrNiepUAKcUhaatNCMycKkW0TLUe5s7MoUEg9Juav4m6tyzHtqcnv1IJAlQLirZAqUquHKVUyaqQSKeN5aahQSJQY7+Ob92O9OgKpI/VL8x7WZaGuriqbVaDQe18BQj5cRsPBKY1HvfA5RIq3wMslqNBsHz4q+0Oyi06+DlmWU4N2DctJuZvz1pX2IssUWJ28AtiJ9KbQs2xEAnbwCv5ylPWHA8UlRvWW3Ua3YNyKZeR61zkEvRGqo7iQi45hk0pjlA5WqhwUm6GO3lObQcfWHBY8D0ZG7D2huCYFGc4oG2SKyR+dCSOqkEWP6bfY3BFWeejh6rt7P3QTxQg+ruCd8lHOHUSPE+SA6yyTKF7WCK0MMc7GvadBGY6CDnBHWEDYLQtRr6oDzTltcoyBFajUZrPajoOiG0kZicwfmOnHP47eVgdG4tcKEHEL6lvKyNljdG8BzXAgggEdoXgfKYtkia+gDg58eGakTiwAHSMBnWv+d+Mu59cMmJU5RiqnLSpjYuMtMcgd9VrngjOHAYUO1WWK7+g6V3ZrPXsQF2SgZTCaZdG7ASKldTygibBAGNwqjRfrjbQ7E7VSFORQSqp6IqJKeqipqokmKdRQCSSSSN6ow1cNh4Ivm8O/4XLNsz6uA68O8gL0hnJ1nMh2nE/lcjrwmTXF2ePot2DcjgMG/Ogp4oKAbBuVr2ej2qNVIp5yh9oDvorXyYjaNzVTMPibwTOaSe7cPJMCI584/E74iirPPw4oDmDU7T44qcdR3jilYI6GyGqNbgDt4BAXU6q05G9Du3BSoM9+4qoOVEkmPfuKr55AFWh+4bgg7fLSR/ru7q4byozz1xGho4Dih7fJ9I7XQ94B4p4TWsdro6mpvi0Fb9lnquOgfiNg8BRdDYJMyDS5aWx0dmqwmpextAaE5TgCAdH7Lw3lDWMc20l7Mt7w7DKGX0nNeOsGq9c5XTkvjZoa2SSmtrQxvjIe5eMcq5PpCOo07BhwWn+bPtz8xxVLlJ5UKq6Ug64YOctETfxgnYCui5cWisgYNAQfIOEc+ZD9VpptQl+WnLle7XRHPsumS5VuKm8qtKqkJMnTJKh6pkkkAkkkkg7+xz0e0nrG9ejs5S/Q5NcwO4ry6N3SG1aTbUaEV+qVXXOs+esdNd8+UG7BuWi6AkjDANJJ2kAfq7lzlyS0DRqC7ey0LDsbxWXXitJ5jCtEfxDcr4owHVOYMc49lP3V9pix9sfCVcIKh//wAiO+vkka1ll9Lb+kIK3Wenet2NmfsP5Qs68tG3gUoay5m4hdBJDVh2jcFhXW8VG0b1uSWoBtPxDd+yAwbdBQ11oBzSFrWx9e8b1QIaoDE5w5O0FvYD+wUbxf8ASD1Iv9JlVoNsvQGGivfihrbZquB/CwdzQOCojWV66K7pMy5sRkI6xWqhCQS5Qmkzj/6m/mk/4rxPlDLWVx1nxK9Yvq3VEzj/AOtrSdIB0driF4/fR6Z7Frx9Z9+2a4qKkVKJuPig3W8nmc3Z3yaSCB8965i0P09ZXUXkebszI9JGPH51rkZXKvUR7qtxSASAUipaGKiU5TEoEJJJJIzJ0ySA6wSK6KfPsKHyMe9TjiNewrZzuhuuTN2LsrBasKbPCq5C64ui3YF1F3xYrDtvw08mvvNP5XBFxxYj/L/1Ans8OA2jcfNdFdd3tOQ4/h8MVC2a6IjK2NPfXyXPXy/fwK9Hmu9tTraB3F3muB5T2bJcPW4FEIHd02ZackhNNvArJsQWu1no63U8CkaDm1HdvC1bPYiVU2DonYV1NhgFEBzf8vo0CmgIKexY9i7K1QCi562uoUBhWqy0CzMmlScwBJ7Ata22kIAipa37TgD6rek7wbTtTJzvK2TJYGk40ZXvqfhK8tvR1Xns3L0Ll1aKykVzGnc3zcvN7a6rjtW3Pjllf+lCMuqDLka3rcO4YlBLouSFmq9zzmY0ntOb51IOrOVM/SIHqjsXMlaV/TZUhAzDis1FHJFMU5TFJRJqJ0yAcplIpigIpJJ0jdiBiNh4IqGLEdnHzVEJ2LTsjcfnRRa2sI1rrZ0W7Aumu9uIWBYxSgW9Y5aLn69t56b1iOA2BdVczxzbBpw+FcZYp+i3YNy1bLeGTSilTqrTMB3LiOUbMsjbXwPmtV945SEtDQ5AYVmhWnFQ5JGbKBFeqhSdZQASNAUrPZCA0Vzf7SOKA0nR9F2w7lqwykLMacCNRRgkFOxAETSktHZwWNb4alaT3jJpXRwVcjgUw4+8LKQQdYVFnwkeTmjj/M/pH8rW+8untrW0xouEntmTFO+uL6nscQB+UU7EQq4DlNa8qVx1k958gFyMuJJWxe0tXFY5C6LPGMZ71Bq7O7Y+YsdXYOkq47BmXMXTZucla3XjsC3OVNswEY6qdgz/ADrUnXMzPynFx0mqgkUklGSKcJFARKScJIUcJikmQRkk9UkjdJbLltMb3RyNIe00IDmHHaDiqm3baARTKB0Yt0dq6ixXxDJ/FC0zNa0zMk9LJeWiN7TzNAcpwcW9HMdK49t8T4HLNdgWm6x/ONAWO2aHSe8PNWMsl4aHy+//AMkC3lBaB9fwb5Kwcp7SP8T8rfJFgHssV56JJffPmrW3femiWb33eaz2crrWM0v5W+Stby3to/xvys8lOVWj23Xev3svvP8ANTFzXqf8aT3pEB/fu3ffflZ5Jv7+W/7/APKzyS8/w/H9aP8AJL1++k75Uv5Ne338vfP5LNPL23/fn3Y/JRPLu8P6h3ux+SfkeGp/Jr1+/l7rR5Jfye9Pv5e60/7Vlf36vD+pd7sfkkeXV4f1Lu6PyRlDV/k96ffy+7afJIXReemaY7G2jyWT/fm8P6l/dH5JHlveH9S/uZ5JZR4bIstrYQZZpcnKaHAufiCQCKELRvO2/ROHW5o8X/suJtPKG0yf+SQu204LStNvBZSuapPdhxVSJtY9ufVx2oB5V0z1CyQ5bwOsp0cug5NwCNjpnaRQbFiXpaC95Pzr+dS272nyGBjTmHiuZcUr6OeaZIpJBSs4USpqCdKEmKcpkjJMU6RSNFJJJIDrR6RUEklqxpimSSQDFMkkkoimSSQZkkkkAk7c6SSAnL6R2qISSQXxNudGz6UySqI6BSI64f8AyD560kkr7X8XX1nKxSnSS6HHognSSUqJMkknRDOTJJJKJMU6SAikkkpD/9k=', 2)
SET IDENTITY_INSERT [dbo].[Melodias] OFF
GO
SET IDENTITY_INSERT [dbo].[Sentimientos] ON 

INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (1, N'Muy Feliz', N'https://i.pinimg.com/originals/6d/3e/39/6d3e39de64dc75c20fe665ca0820afc3.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (2, N'Feliz', N'https://em-content.zobj.net/source/apple/155/smiling-face-with-smiling-eyes_1f60a.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (3, N'Normal', N'https://em-content.zobj.net/source/apple/76/neutral-face_1f610.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (4, N'Triste', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY5NyFhEFiywKGwQsp8vWcLCdUXzQYI4RQQQ&s')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (5, N'Muy triste', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAJWV7Z1ECB_A0NKEKxGySYgVHJ_B9G1WVjw&s')
SET IDENTITY_INSERT [dbo].[Sentimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Tips] ON 

INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (1, N'Dejá el celular a un costado y silencia las notificaciones.', 2)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (2, N'Andá a un lugar que te haga sentir cómodo para concentrarte al 100%', 3)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (3, N'Antes de empezar, ponete un objetivo sobre cuánto querés estudiar.', 1)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (4, N'Horas antes, definí el tiempo a usar para estudiar y despejalo de otras tareas.', 4)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (5, N'Tomate descansos chiquitos, de 10 minutos, entre rato y rato de estudio.', 1)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (6, N'Ganá tiempo, tené todo lo necesario cerca así aprovechas el tiempo.', 5)
SET IDENTITY_INSERT [dbo].[Tips] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id_usuario], [nombre], [apellido], [mail], [contraseña], [edad], [Id_sentimiento]) VALUES (4, N'Tomas', N'Korngold', N'tomykorngold@gmail.com', N'kalek123', 17, 1)
INSERT [dbo].[Usuarios] ([Id_usuario], [nombre], [apellido], [mail], [contraseña], [edad], [Id_sentimiento]) VALUES (5, N'Uriel', N'Engelberg', N'uritoeng@gmail.com', N'furrini123', 16, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Calendario_Categorias] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categorias] ([id_categoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calendario] CHECK CONSTRAINT [FK_Calendario_Categorias]
GO
ALTER TABLE [dbo].[Calendario]  WITH CHECK ADD  CONSTRAINT [FK_Calendario_Recordatorio] FOREIGN KEY([id_recordatorio])
REFERENCES [dbo].[Recordatorio] ([id_recordatorio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calendario] CHECK CONSTRAINT [FK_Calendario_Recordatorio]
GO
ALTER TABLE [dbo].[Foro]  WITH CHECK ADD  CONSTRAINT [FK_Foro_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_usuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Foro] CHECK CONSTRAINT [FK_Foro_Usuarios]
GO
ALTER TABLE [dbo].[SentimientosXJuegos]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXJuegos_Juegos] FOREIGN KEY([id_juegos])
REFERENCES [dbo].[Juegos] ([id_juegos])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXJuegos] CHECK CONSTRAINT [FK_SentimientosXJuegos_Juegos]
GO
ALTER TABLE [dbo].[SentimientosXJuegos]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXJuegos_Sentimientos] FOREIGN KEY([Id_sentimiento])
REFERENCES [dbo].[Sentimientos] ([Id_sentimiento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXJuegos] CHECK CONSTRAINT [FK_SentimientosXJuegos_Sentimientos]
GO
ALTER TABLE [dbo].[SentimientosXMelodias]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXMelodias_Melodias] FOREIGN KEY([id_Melodias])
REFERENCES [dbo].[Melodias] ([id_Melodias])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXMelodias] CHECK CONSTRAINT [FK_SentimientosXMelodias_Melodias]
GO
ALTER TABLE [dbo].[SentimientosXMelodias]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXMelodias_Sentimientos] FOREIGN KEY([Id_sentimiento])
REFERENCES [dbo].[Sentimientos] ([Id_sentimiento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXMelodias] CHECK CONSTRAINT [FK_SentimientosXMelodias_Sentimientos]
GO
ALTER TABLE [dbo].[SentimientosXTips]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXTips_Sentimientos] FOREIGN KEY([Id_sentimiento])
REFERENCES [dbo].[Sentimientos] ([Id_sentimiento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXTips] CHECK CONSTRAINT [FK_SentimientosXTips_Sentimientos]
GO
ALTER TABLE [dbo].[SentimientosXTips]  WITH CHECK ADD  CONSTRAINT [FK_SentimientosXTips_Tips] FOREIGN KEY([id_tips])
REFERENCES [dbo].[Tips] ([id_tips])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentimientosXTips] CHECK CONSTRAINT [FK_SentimientosXTips_Tips]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Sentimientos] FOREIGN KEY([Id_sentimiento])
REFERENCES [dbo].[Sentimientos] ([Id_sentimiento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Sentimientos]
GO
/****** Object:  StoredProcedure [dbo].[SP_ComprobarUsuarioValido]    Script Date: 26/11/2024 09:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ComprobarUsuarioValido]
    @mail NVARCHAR(255),
    @contraseña NVARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT TOP 1 * FROM Usuarios WHERE mail = @mail AND contraseña = @contraseña)
    BEGIN
        SELECT 'exitoso' AS Resultado;
    END
    ELSE
    BEGIN
        SELECT 'no_fue_exitoso' AS Resultado;
    END
END;
GO
USE [master]
GO
ALTER DATABASE [Focusing Empowering Minds] SET  READ_WRITE 
GO
