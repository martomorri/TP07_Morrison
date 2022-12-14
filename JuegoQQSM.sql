USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 6/9/2022 08:40:22 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JuegoQQSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoQQSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoQQSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoQQSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoQQSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoQQSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoQQSM] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoQQSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoQQSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoQQSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoQQSM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JuegoQQSM', N'ON'
GO
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  User [alumno]    Script Date: 6/9/2022 08:40:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[PozoGanado] [int] NOT NULL,
	[ComodinDobleChance] [bit] NOT NULL,
	[Comodin50] [bit] NOT NULL,
	[ComodinSaltear] [bit] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](200) NOT NULL,
	[NivelDificultad] [int] NOT NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[OpcionRespuesta] [char](1) NOT NULL,
	[TextoRespuesta] [varchar](200) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jugadores] ON 

INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (22, N'Morro', CAST(N'2022-08-30T09:00:40.783' AS DateTime), 0, 1, 1, 1)
INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (23, N'Morro', CAST(N'2022-09-06T08:06:21.987' AS DateTime), 0, 1, 1, 1)
INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (24, N'Morro', CAST(N'2022-09-06T08:09:14.130' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (25, N'Morro', CAST(N'2022-09-06T08:09:51.630' AS DateTime), 0, 0, 1, 1)
INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (26, N'ari', CAST(N'2022-09-06T08:10:23.693' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[Jugadores] ([IdJugador], [Nombre], [FechaHora], [PozoGanado], [ComodinDobleChance], [Comodin50], [ComodinSaltear]) VALUES (27, N'Morro', CAST(N'2022-09-06T08:19:42.800' AS DateTime), 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Jugadores] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (1, N'¿Cual es el segundo nombre del protagonista en la famosa serie Breaking Bad?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (2, N'¿Quien es el mayor goleador de la seleccion Argentina de futbol?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (3, N'¿Quien interpreta la cancion "Radioactive"?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (4, N'¿Cuantos barrios hay en la ciudad antigua de Jerusalem?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (5, N'¿Cual es el nombre de Saul Goodman en la famosa serie "Better Call Saul" luego de los sucesos ocurridos en Breaking Bad?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (6, N'¿En que año asume la presidencia en la Argentina Cristina Fernandez de Kirchner?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (7, N'¿Cual es la capital de Canada?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (8, N'¿Como se llama el actor que interpreta al protagonista de la serie "Peaky Blinders"?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (9, N'¿Quien es el lider del Cartel de Juarez en Breaking Bad?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (10, N'¿Cuantos anillos de la NBA gano Emanuel Ginobili?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿Cuantas teclas posee un teclado gamer?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (13, N'¿Quién es la primera mujer de color en ganar el Oscar a la mejor actriz?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (14, N'¿Qué película escrita, dirigida y producida por James Cameron se convirtió en la película más taquillera de su tiempo?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (15, N'¿Cuál es el deporte nacional de Canadá?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (16, N'¿En qué país se celebraron los primeros Juegos Olímpicos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (17, N'¿Cuál es el único país que ha jugado en todos los mundiales de fútbol?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (18, N'¿Cuál es el diámetro de un aro de baloncesto en cm?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (19, N'¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (20, N'¿Cuánto duró la Guerra de los Cien Años?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (21, N'¿De qué sustancia están hechas las uñas?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (22, N'¿“K” es el símbolo químico de qué elemento?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (23, N'¿Qué famosa cantante murió de intoxicación por alcohol en 2011 a la edad de 27 años?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (24, N'¿Qué productor musical produjo Thriller de Michael Jackson?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (25, N'¿Cuál es la capital de Australia?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (26, N'¿Qué río atraviesa París?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (27, N'¿Dónde encontrarías la “Plaza de España”?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (28, N'¿Qué país tiene la abreviatura “CH”?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (29, N'¿Cuál es la isla más grande del mundo?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (30, N'¿Como se llama el dueño del lavado de autos donde trabaja Walter al principio de la serie?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (31, N'¿En que año fue la guerra de Iom Kipur?', 3)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A', N'Walter', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B', N'Hartwell', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C', N'Jesse', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (4, 1, N'D', N'White', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 2, N'A', N'Batistuta', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (6, 2, N'B', N'Aguero', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'C', N'Messi', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'D', N'Crespo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 3, N'A', N'Queen', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (10, 3, N'B', N'The Beatles', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 3, N'C', N'Kiss', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'D', N'Imagine Dragons', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (13, 4, N'A', N'4', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 4, N'B', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 4, N'C', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 4, N'D', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 5, N'A', N'Gene Takavic', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (18, 5, N'B', N'Jimmy', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 5, N'C', N'James McGill', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 5, N'D', N'Kim Wexler', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 6, N'A', N'2011', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 6, N'B', N'2008', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 6, N'C', N'2007', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (24, 6, N'D', N'2014', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 7, N'A', N'Ontario', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 7, N'B', N'Toronto', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 7, N'C', N'Ottawa', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 7, N'D', N'Canada', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 8, N'A', N'Thommy Shelby', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 8, N'B', N'Aaron Paul', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 8, N'C', N'Steven Knight', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 8, N'D', N'Cillian Murphy', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 9, N'A', N'Hector Salamanca', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 9, N'B', N'Don Eladio', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 9, N'C', N'Tuco', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 9, N'D', N'Gustavo Fring', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 10, N'A', N'2', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 10, N'B', N'1', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 10, N'C', N'4', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 10, N'D', N'3', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 12, N'A', N'85', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 12, N'B', N'112', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 12, N'C', N'93', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (44, 12, N'D', N'107', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 13, N'A', N'Viola Davis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 13, N'B', N'Kerry Washington', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 13, N'C', N'Halle Berry', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 13, N'D', N'Regina King', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 14, N'A', N'Titanic', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (50, 14, N'B', N'Avatar', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 14, N'C', N'Terminator', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (52, 14, N'D', N'True Lies', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 15, N'A', N'Bolos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 15, N'B', N'Basquetbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 15, N'C', N'Lacrosse', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 15, N'D', N'Futbol', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (57, 16, N'A', N'Italia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 16, N'B', N'Japon', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 16, N'C', N'Grecia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 16, N'D', N'Egipto', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (61, 17, N'A', N'Brasil', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (62, 17, N'B', N'Argentina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (63, 17, N'C', N'Alemania', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (64, 17, N'D', N'Italia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (65, 18, N'A', N'40.64', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (66, 18, N'B', N'45.72', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (67, 18, N'C', N'48.26', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (68, 18, N'D', N'43.18', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (69, 19, N'A', N'1766', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (70, 19, N'B', N'1772', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (71, 19, N'C', N'1775', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (72, 19, N'D', N'1776', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (73, 20, N'A', N'116', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (74, 20, N'B', N'100', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (75, 20, N'C', N'107', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (76, 20, N'D', N'101', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (77, 21, N'A', N'Serotonina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (78, 21, N'B', N'Epidermis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (79, 21, N'C', N'Melanina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (80, 21, N'D', N'Queratina', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (81, 22, N'A', N'Cromo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (82, 22, N'B', N'Potasio', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (83, 22, N'C', N'Hidrogeno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (84, 22, N'D', N'Kilo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (85, 23, N'A', N'Janis Joplin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (86, 23, N'B', N'Selena', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (87, 23, N'C', N'Amy Winehouse', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (88, 23, N'D', N'Aaliyah', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (89, 24, N'A', N'Dr.Dre', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (90, 24, N'B', N'Jay-Z', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (91, 24, N'C', N'Stevie Wonder', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (92, 24, N'D', N'Quincy Jones', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (93, 25, N'A', N'Canberra', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (94, 25, N'B', N'Adelaide', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (95, 25, N'C', N'Sydney', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (96, 25, N'D', N'Melbourne', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (97, 26, N'A', N'Semois', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (98, 26, N'B', N'Paris', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (99, 26, N'C', N'Sena', 1)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (100, 26, N'D', N'Rin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (101, 27, N'A', N'Italia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (102, 27, N'B', N'España', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (103, 27, N'C', N'Estados Unidos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (104, 27, N'D', N'Francia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (105, 28, N'A', N'China', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (106, 28, N'B', N'Kazajistan', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (107, 28, N'C', N'Suiza', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (108, 28, N'D', N'Chile', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (109, 29, N'A', N'Islandia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (110, 29, N'B', N'Antartida', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (111, 29, N'C', N'Irlanda', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (112, 29, N'D', N'Groenlandia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (113, 30, N'A', N'Ahmed', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (114, 30, N'B', N'Bogdan', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (115, 30, N'C', N'Esam', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (116, 30, N'D', N'Burhan', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (117, 31, N'A', N'1973', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (118, 31, N'B', N'1970', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (119, 31, N'C', N'1967', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (120, 31, N'D', N'1948', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodin50]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodin50]
AS
BEGIN
	UPDATE Jugadores
	SET Comodin50 = 0
	WHERE IdJugador = (SELECT TOP 1 IdJugador FROM Jugadores ORDER BY IdJugador DESC)
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodinDobleChance]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodinDobleChance]
AS
BEGIN
	UPDATE Jugadores
	SET ComodinDobleChance = 0
	WHERE IdJugador = (SELECT TOP 1 IdJugador FROM Jugadores ORDER BY IdJugador DESC)
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodinSaltear]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodinSaltear]
AS
BEGIN
	UPDATE Jugadores
	SET ComodinSaltear = 0
	WHERE IdJugador = (SELECT TOP 1 IdJugador FROM Jugadores ORDER BY IdJugador DESC)
END
GO
/****** Object:  StoredProcedure [dbo].[CrearJugador]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrearJugador]
	@Nombre varchar(200), @FechaHora datetime
AS
BEGIN
	INSERT INTO Jugadores (Nombre,FechaHora,PozoGanado,ComodinDobleChance,Comodin50,ComodinSaltear) VALUES (@Nombre,@FechaHora,0,1,1,1)
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPreguntasXDificultad]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarPreguntasXDificultad]
	@Dificultad int
AS
BEGIN
	SELECT *
	FROM Preguntas P
	WHERE P.NivelDificultad = @Dificultad
END
GO
/****** Object:  StoredProcedure [dbo].[ListarRespuestasXPregunta]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarRespuestasXPregunta]
	@IdPregunta int
AS
BEGIN
	SELECT *
	FROM Respuestas R
	WHERE R.IdPregunta = @IdPregunta
END
GO
/****** Object:  StoredProcedure [dbo].[ListarUltimoJugador]    Script Date: 6/9/2022 08:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarUltimoJugador]
AS
BEGIN
	SELECT TOP 1 * FROM Jugadores ORDER BY IdJugador DESC
END
GO
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
