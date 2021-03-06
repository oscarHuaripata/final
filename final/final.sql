USE [Financisto]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/12/2020 10:47:28 p. m. ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[Limit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[EtiquetaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[EtiquetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[NotaId] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NULL,
	[UltimaModificacion] [datetime2](7) NOT NULL,
	[Contenido] [nvarchar](max) NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[NotaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotaEtiqueta]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotaEtiqueta](
	[NotaEtiquetaId] [int] IDENTITY(1,1) NOT NULL,
	[EtiquetaId] [int] NOT NULL,
	[NotaId] [int] NOT NULL,
 CONSTRAINT [PK_NotaEtiqueta] PRIMARY KEY CLUSTERED 
(
	[NotaEtiquetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Document] [nvarchar](8) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Summary] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/12/2020 10:47:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201207174353_InitialCreate', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201207232722_InitialNota', N'3.1.9')
GO
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (1, N'Maestría')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (2, N'AWS')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (3, N'Bateas')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (4, N'Commands')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (5, N'maes')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (6, N'android')
INSERT [dbo].[Etiqueta] ([EtiquetaId], [Nombre]) VALUES (7, N'Main')
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password]) VALUES (1, N'osduar', N'CHtbWNm2i8zfYPYLFS2ru7rH69lVhShO0+A3uAYkaEA=')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Type_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Type_TypeId]
GO
ALTER TABLE [dbo].[NotaEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_NotaEtiqueta_Etiqueta_EtiquetaId] FOREIGN KEY([EtiquetaId])
REFERENCES [dbo].[Etiqueta] ([EtiquetaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotaEtiqueta] CHECK CONSTRAINT [FK_NotaEtiqueta_Etiqueta_EtiquetaId]
GO
ALTER TABLE [dbo].[NotaEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_NotaEtiqueta_Nota_NotaId] FOREIGN KEY([NotaId])
REFERENCES [dbo].[Nota] ([NotaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotaEtiqueta] CHECK CONSTRAINT [FK_NotaEtiqueta_Nota_NotaId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account_AccountId]
GO
