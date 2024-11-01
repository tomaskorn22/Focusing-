USE [master]
GO
/****** Object:  Database [Focusing Empowering Minds]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  User [alumno]    Script Date: 1/11/2024 15:25:49 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[Foro]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[Juegos]    Script Date: 1/11/2024 15:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[id_juegos] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[foto] [text] NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[id_juegos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Melodias]    Script Date: 1/11/2024 15:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Melodias](
	[id_Melodias] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NULL,
	[sonido] [text] NULL,
	[foto] [text] NULL,
 CONSTRAINT [PK_Melodias] PRIMARY KEY CLUSTERED 
(
	[id_Melodias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recordatorio]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[Sentimientos]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[SentimientosXJuegos]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[SentimientosXMelodias]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[SentimientosXTips]    Script Date: 1/11/2024 15:25:49 ******/
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
/****** Object:  Table [dbo].[Tips]    Script Date: 1/11/2024 15:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tips](
	[id_tips] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Tips] PRIMARY KEY CLUSTERED 
(
	[id_tips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/11/2024 15:25:49 ******/
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
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 

INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (1, N'Rompecabezas', N'Encajá las piezas para formar una imagen.', N'https://cdn-icons-png.flaticon.com/512/5873/5873228.png')
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (2, N'Sudoku', N'Descubrí donde va cada número sin repetir en columna, fila o cuadrado. ', N'https://lh5.googleusercontent.com/proxy/XayDM97LThnmbYdELhbkmoAFh3O6HOMz3yBHnmoSLptsOBA5dhXv0YXk_faavulZaN1JuYHaAS1dpavvDnqRZ_gNA52flHgE9dVBQwijCGNVfA9i7-4')
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (3, N'Crucigrama', N'Encontrá todas las palabras cruzadas. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGC2OXpWQZGZ0M0mVfxtTtFaUJSqTIUbDang&s')
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (4, N'Sopa de letras', N'Encontrá todas las palabras ocultas. ', N'https://upload.wikimedia.org/wikipedia/commons/a/a4/Ortograf%C3%ADa_b-v.png')
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (5, N'Diferencias', N'Encontrá todas las diferencias entre las imagenes. ', N'https://comunidad.pami.org.ar/wp-content/uploads/2021/08/JUEGOS-NUEVA-IMAGEN-13.png')
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto]) VALUES (6, N'Memotest', N'Encontrá los pares de los distintos dibujos escondidos. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5DjfCZLsVxgwHPoR3xgHEKtt1j8i_cCJkqA&s')
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Melodias] ON 

INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto]) VALUES (1, N'Motivacion', N'C:\Users\48242157\Downloads\MusicaMotivacional.mp3', N'https://img.freepik.com/free-photo/man-jumping-impossible-possible-cliff-sunset-background-business-concept-idea_1323-265.jpg')
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto]) VALUES (2, N'Calma', N'C:\Users\48242157\Downloads\MusicaCalma.mp3', N'https://www.lavanguardia.com/files/og_thumbnail/files/fp/uploads/2023/10/10/6524fb7122390.r_d.2845-2239-2000.jpeg')
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto]) VALUES (3, N'Ruido Urbano', N'C:\Users\48242157\Downloads\Ruido urbano.mp3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgTKvECmghMuz7PFr2bkiz5eIW-GvznNGN_A&s')
SET IDENTITY_INSERT [dbo].[Melodias] OFF
GO
SET IDENTITY_INSERT [dbo].[Tips] ON 

INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (1, N'Dejá el celular a un costado y silencia las notificaciones.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (2, N'Andá a un lugar que te haga sentir cómodo para concentrarte al 100%')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (3, N'Antes de empezar, ponete un objetivo sobre cuánto querés estudiar.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (4, N'Horas antes, definí el tiempo a usar para estudiar y despejalo de otras tareas.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (5, N'Tomate descansos chiquitos, de 10 minutos, entre rato y rato de estudio.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (6, N'Ganá tiempo, tené todo lo necesario cerca así aprovechas el tiempo.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (7, N'Ten a mano todo lo que necesitas, como libros, cuadernos y útiles, para no perder tiempo buscando.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (8, N' Establece un plan diario o semanal que incluya sesiones de estudio para diferentes materias.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (9, N'Crea tarjetas con conceptos clave para repasar de manera rápida y efectiva.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (10, N'Imagina cómo será el examen o la presentación, y cómo aplicarás lo que has estudiado.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (11, N'Dedica unos minutos antes de cada sesión a revisar lo que estudiaste anteriormente, esto activa la memoria.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (12, N'Asegúrate de que la temperatura de la habitación y la iluminación sean cómodas para ti.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (13, N'Prométete un pequeño premio después de cumplir tus metas de estudio para mantenerte motivado.

')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (14, N'Estudiar en una posición cómoda pero erguida puede ayudarte a mantener la concentración.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (15, N'Resalta o escribe con diferentes colores para facilitar la memorización.')
INSERT [dbo].[Tips] ([id_tips], [descripcion]) VALUES (16, N'Visualiza tu éxito y mantente enfocado en tus logros, esto mejora la motivación y concentración.')
SET IDENTITY_INSERT [dbo].[Tips] OFF
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
USE [master]
GO
ALTER DATABASE [Focusing Empowering Minds] SET  READ_WRITE 
GO
