USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 23/8/2022 20:57:46 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 23/8/2022 20:57:46 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 23/8/2022 20:57:46 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 23/8/2022 20:57:46 ******/
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
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿A cuantos fotogramas por segundo (FPS) corre la placa de video NVIDIA GeForce GTX 1650 Ti?', 3)
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
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodin50]    Script Date: 23/8/2022 20:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodin50]
	@IdJugador int
AS
BEGIN
	UPDATE Jugadores
	SET Comodin50 = 0
	WHERE IdJugador = @IdJugador
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodinDobleChance]    Script Date: 23/8/2022 20:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodinDobleChance]
	@IdJugador int
AS
BEGIN
	UPDATE Jugadores
	SET ComodinDobleChance = 0
	WHERE IdJugador = @IdJugador
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarComodinSaltear]    Script Date: 23/8/2022 20:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarComodinSaltear]
	@IdJugador int
AS
BEGIN
	UPDATE Jugadores
	SET Comodin50 = 0
	WHERE IdJugador = @IdJugador
END
GO
/****** Object:  StoredProcedure [dbo].[CrearJugador]    Script Date: 23/8/2022 20:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearJugador]
	@Nombre varchar(200), @FechaHora datetime
AS
BEGIN
	INSERT INTO Jugadores (Nombre,FechaHora) VALUES (@Nombre,@FechaHora)
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPreguntasXDificultad]    Script Date: 23/8/2022 20:57:46 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarRespuestasXPregunta]    Script Date: 23/8/2022 20:57:46 ******/
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
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
