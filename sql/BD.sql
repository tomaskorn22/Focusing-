USE [master]
GO
/****** Object:  Database [Focusing Empowering Minds]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  User [alumno]    Script Date: 8/11/2024 14:19:29 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Evento]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Foro]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Juegos]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Melodias]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Recordatorio]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Sentimientos]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[SentimientosXJuegos]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[SentimientosXMelodias]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[SentimientosXTips]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Tips]    Script Date: 8/11/2024 14:19:29 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/11/2024 14:19:29 ******/
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

INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (1, N'Rompecabezas', N'Encajá las piezas para formar una imagen.', N'https://cdn-icons-png.flaticon.com/512/5873/5873228.png', 1)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (2, N'Sudoku', N'Descubrí donde va cada número sin repetir en columna, fila o cuadrado. ', N'https://lh5.googleusercontent.com/proxy/XayDM97LThnmbYdELhbkmoAFh3O6HOMz3yBHnmoSLptsOBA5dhXv0YXk_faavulZaN1JuYHaAS1dpavvDnqRZ_gNA52flHgE9dVBQwijCGNVfA9i7-4', 5)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (3, N'Crucigrama', N'Encontrá todas las palabras cruzadas. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGC2OXpWQZGZ0M0mVfxtTtFaUJSqTIUbDang&s', 2)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (4, N'Sopa de letras', N'Encontrá todas las palabras ocultas. ', N'https://upload.wikimedia.org/wikipedia/commons/a/a4/Ortograf%C3%ADa_b-v.png', 3)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (5, N'Diferencias', N'Encontrá todas las diferencias entre las imagenes. ', N'https://comunidad.pami.org.ar/wp-content/uploads/2021/08/JUEGOS-NUEVA-IMAGEN-13.png', 4)
INSERT [dbo].[Juegos] ([id_juegos], [titulo], [descripcion], [foto], [Id_sentimiento]) VALUES (6, N'Memotest', N'Encontrá los pares de los distintos dibujos escondidos. ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5DjfCZLsVxgwHPoR3xgHEKtt1j8i_cCJkqA&s', 4)
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Melodias] ON 

INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (1, N'Motivacion', N'https://cdn.pixabay.com/download/audio/2024/09/21/audio_a14ee6c264.mp3', N'https://img.freepik.com/free-photo/man-jumping-impossible-possible-cliff-sunset-background-business-concept-idea_1323-265.jpg', 1)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (2, N'Calma', N'https://cdn.pixabay.com/download/audio/2022/04/27/audio_30ff2fdf22.mp3?filename=sedative-110241.mp3', N'https://www.lavanguardia.com/files/og_thumbnail/files/fp/uploads/2023/10/10/6524fb7122390.r_d.2845-2239-2000.jpeg', 5)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (3, N'Ruido Urbano', N'https://cdn.pixabay.com/download/audio/2022/01/21/audio_31743c58bd.mp3?filename=spirit-blossom-15285.mp3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgTKvECmghMuz7PFr2bkiz5eIW-GvznNGN_A&s', 3)
INSERT [dbo].[Melodias] ([id_Melodias], [titulo], [sonido], [foto], [Id_sentimiento]) VALUES (4, N'Melancolía', N'https://cdn.pixabay.com/download/audio/2024/09/18/audio_6f5b0e8a5d.mp3?filename=rain-242006.mp3', N'data:image/jpeg;base64,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', NULL)
SET IDENTITY_INSERT [dbo].[Melodias] OFF
GO
SET IDENTITY_INSERT [dbo].[Sentimientos] ON 

INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (1, N'Muy Feliz', N'https://i.pinimg.com/originals/6d/3e/39/6d3e39de64dc75c20fe665ca0820afc3.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (2, N'Feliz', N'https://em-content.zobj.net/source/apple/155/smiling-face-with-smiling-eyes_1f60a.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (3, N'Normal', N'https://em-content.zobj.net/source/apple/76/neutral-face_1f610.png')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (4, N'Triste', N'https://img.freepik.com/vector-premium/vector-emoji-cara-triste-amarilla-ojos-boca-sobre-fondo-blanco-icono-emoji-dibujos-animados-divertidos_250169-291.jpg')
INSERT [dbo].[Sentimientos] ([Id_sentimiento], [nombre], [foto]) VALUES (5, N'Muy triste', N'data:image/jpeg;base64,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')
SET IDENTITY_INSERT [dbo].[Sentimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Tips] ON 

INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (1, N'Dejá el celular a un costado y silencia las notificaciones.', 3)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (2, N'Andá a un lugar que te haga sentir cómodo para concentrarte al 100%', 4)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (3, N'Antes de empezar, ponete un objetivo sobre cuánto querés estudiar.', 3)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (4, N'Horas antes, definí el tiempo a usar para estudiar y despejalo de otras tareas.', 5)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (5, N'Tomate descansos chiquitos, de 10 minutos, entre rato y rato de estudio.', 5)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (6, N'Ganá tiempo, tené todo lo necesario cerca así aprovechas el tiempo.', 2)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (7, N'Ten a mano todo lo que necesitas, como libros, cuadernos y útiles, para no perder tiempo buscando.', 3)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (8, N' Establece un plan diario o semanal que incluya sesiones de estudio para diferentes materias.', 1)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (9, N'Crea tarjetas con conceptos clave para repasar de manera rápida y efectiva.', 1)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (10, N'Imagina cómo será el examen o la presentación, y cómo aplicarás lo que has estudiado.', 1)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (11, N'Dedica unos minutos antes de cada sesión a revisar lo que estudiaste anteriormente, esto activa la memoria.', 4)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (12, N'Asegúrate de que la temperatura de la habitación y la iluminación sean cómodas para ti.', 4)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (13, N'Prométete un pequeño premio después de cumplir tus metas de estudio para mantenerte motivado.

', 5)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (14, N'Estudiar en una posición cómoda pero erguida puede ayudarte a mantener la concentración.', 2)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (15, N'Resalta o escribe con diferentes colores para facilitar la memorización.', 2)
INSERT [dbo].[Tips] ([id_tips], [descripcion], [Id_sentimiento]) VALUES (16, N'Visualiza tu éxito y mantente enfocado en tus logros, esto mejora la motivación y concentración.', 4)
SET IDENTITY_INSERT [dbo].[Tips] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id_usuario], [nombre], [apellido], [mail], [contraseña], [edad]) VALUES (1, N'Tomas', N'Korngold', N'tomykorngold@gmail.com', N'kalek123', 17)
INSERT [dbo].[Usuarios] ([Id_usuario], [nombre], [apellido], [mail], [contraseña], [edad]) VALUES (2, N'Tomas', N'Korngold', N'tomykorngold@gmail.com', N'kalek123', 28)
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
USE [master]
GO
ALTER DATABASE [Focusing Empowering Minds] SET  READ_WRITE 
GO
