USE [master]
GO
/****** Object:  Database [HastaneOtomasyon]    Script Date: 16.12.2022 20:43:59 ******/
CREATE DATABASE [HastaneOtomasyon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneOtomasyon', FILENAME = N'C:\Users\niluf\AppData\Local\Microsoft\Microsoft SHastaneOtomasyon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HastaneOtomasyon_log', FILENAME = N'C:\Users\niluf\AppData\Local\Microsoft\Microsoft SHastaneOtomasyon.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HastaneOtomasyon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneOtomasyon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneOtomasyon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HastaneOtomasyon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneOtomasyon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneOtomasyon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HastaneOtomasyon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneOtomasyon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneOtomasyon] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneOtomasyon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneOtomasyon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneOtomasyon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneOtomasyon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HastaneOtomasyon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HastaneOtomasyon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HastaneOtomasyon] SET QUERY_STORE = OFF
GO
USE [HastaneOtomasyon]
GO
/****** Object:  Table [dbo].[Cinsiyet]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinsiyet](
	[CinsiyetID] [nvarchar](1) NOT NULL,
	[Cinsiyet] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[CinsiyetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorID] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikID] [int] NULL,
	[PersonelID] [int] NOT NULL,
	[DoktorDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoktorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta](
	[HastaID] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdi] [nvarchar](50) NOT NULL,
	[HastaSoyadi] [nvarchar](50) NOT NULL,
	[TCKN] [char](11) NOT NULL,
	[DogumTarihi] [date] NOT NULL,
	[Kilo] [decimal](18, 2) NULL,
	[Cinsiyet] [nvarchar](1) NULL,
	[HastaTelefonNo] [char](12) NOT NULL,
	[HastaMail] [nvarchar](50) NULL,
	[HastaAdres] [nvarchar](200) NOT NULL,
	[HastaGecmisiID] [int] NULL,
	[KanGrubuID] [nvarchar](5) NULL,
	[HastaDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[HastaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HastaGecmisi]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaGecmisi](
	[HastaGecmisiID] [int] IDENTITY(1,1) NOT NULL,
	[KullandigiIlac] [nvarchar](50) NULL,
	[GecirdigiHastalik] [nvarchar](50) NULL,
	[GecirdigiAmeliyat] [nvarchar](50) NULL,
	[Alerjiler] [nvarchar](50) NULL,
	[HastaGecmisiDurum] [bit] NULL,
	[HastaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HastaGecmisiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HastaneBilgi]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaneBilgi](
	[HastaneID] [int] IDENTITY(1,1) NOT NULL,
	[HastaneAdi] [nvarchar](50) NOT NULL,
	[TelefonNo] [nvarchar](20) NOT NULL,
	[Adres] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HastaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilaclar]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilaclar](
	[BarkodID] [int] IDENTITY(1,1) NOT NULL,
	[IlacAdi] [nvarchar](150) NOT NULL,
	[İcerikBilgi] [nvarchar](250) NULL,
	[Fiyat] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BarkodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Izinler]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izinler](
	[IzinID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NOT NULL,
	[IzınTuru] [nvarchar](50) NOT NULL,
	[IzinBaslangic] [date] NOT NULL,
	[IzinBitis] [date] NOT NULL,
	[IzinAdresi] [nvarchar](250) NULL,
	[IzinDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IzinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KanGrubu]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanGrubu](
	[KanGrubuID] [nvarchar](5) NOT NULL,
	[KanGrubuTuru] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[KanGrubuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meslek]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meslek](
	[MeslekID] [int] IDENTITY(1,1) NOT NULL,
	[MeslekTuru] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[MeslekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[MeslekID] [int] NULL,
	[PersonelAdi] [nvarchar](max) NOT NULL,
	[PersonelSoyadi] [nvarchar](50) NOT NULL,
	[TCKN] [char](11) NOT NULL,
	[DogumTarihi] [date] NULL,
	[Cinsiyet] [nvarchar](1) NULL,
	[TelefonNo] [nvarchar](12) NULL,
	[Mail] [nvarchar](50) NULL,
	[Adres] [nvarchar](100) NULL,
	[İseGirisTarihi] [date] NOT NULL,
	[EnSonMezuniyetBilgisi] [nvarchar](50) NULL,
	[KanGrubuID] [nvarchar](5) NULL,
	[HastaneID] [int] NOT NULL,
	[PersonelDurum] [bit] NULL,
	[Sifre] [nvarchar](max) NULL,
 CONSTRAINT [PK__Personel__0F0C57514F2B52A1] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinik](
	[PoliklinikID] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinkAdi] [nvarchar](50) NOT NULL,
	[HastaneID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PoliklinikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Randevu]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Randevu](
	[RandevuID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NOT NULL,
	[DoktorID] [int] NOT NULL,
	[Sikayet] [nvarchar](250) NULL,
	[Teshis] [nvarchar](250) NULL,
	[Tedavi] [nvarchar](250) NULL,
	[RandevuDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RandevuDetay]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandevuDetay](
	[RandevuID] [int] NOT NULL,
	[RandevuTarihi] [date] NULL,
	[RandevuSaati] [time](7) NULL,
	[HastaGeldimi] [nvarchar](1) NULL,
	[YeniRandevuTarihi] [date] NULL,
	[RandevuDetayDurum] [bit] NULL,
 CONSTRAINT [PK_RandevuDetay] PRIMARY KEY CLUSTERED 
(
	[RandevuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceteDetay]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceteDetay](
	[ReceteID] [int] IDENTITY(1,1) NOT NULL,
	[RandevuID] [int] NOT NULL,
	[IlacAdet] [int] NOT NULL,
	[IlacDozu] [nvarchar](50) NOT NULL,
	[KullanımSekli] [nvarchar](50) NULL,
	[BarkodNo] [int] NULL,
	[ReceteDetayDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SifrelerVeHashler]    Script Date: 16.12.2022 20:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SifrelerVeHashler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
	[Hash] [nvarchar](max) NOT NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_SifrelerVeHashler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Cinsiyet] ([CinsiyetID], [Cinsiyet]) VALUES (N'E', N'ERKEK')
INSERT [dbo].[Cinsiyet] ([CinsiyetID], [Cinsiyet]) VALUES (N'K', N'KADIN')
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (2, 2, 2, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (3, 3, 3, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (4, 4, 4, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (5, 5, 5, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (6, 6, 6, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (7, 7, 7, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (8, 8, 8, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (9, 9, 9, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (10, 10, 10, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (11, 11, 11, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (12, 3, 12, 0)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (13, 4, 13, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (14, 5, 14, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (15, 6, 15, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (16, 7, 16, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (17, 8, 17, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (18, 9, 18, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (19, 10, 19, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (20, 11, 20, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (21, 1, 21, 1)
INSERT [dbo].[Doktorlar] ([DoktorID], [PoliklinikID], [PersonelID], [DoktorDurum]) VALUES (22, 2, 22, 1)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hasta] ON 

INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (1, N'Büsra', N'Yilmaz', N'14725836987', CAST(N'1998-01-07' AS Date), CAST(46.00 AS Decimal(18, 2)), N'K', N'05468795269 ', N'busrayilmaz@hotmail.com', N'Ibnisina sk. Menderes mah. No:15/6 Üsküdar/Istanbul', 1, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (2, N'Gizem', N'Topçu', N'96587412563', CAST(N'1986-06-03' AS Date), CAST(56.00 AS Decimal(18, 2)), N'K', N'05398742569 ', N'gizemtopcu@gmail.com', N'Manisa sk. Güzelbahçe mah. No:214/9a Kadiköy/Istanbul', 2, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (3, N'Ali', N'Görmez', N'14523698541', CAST(N'1975-03-09' AS Date), CAST(85.00 AS Decimal(18, 2)), N'E', N'05347895212 ', N'aligormez@hotmail.com', N'Fidan sk. Cumhuriyet mah. No:21/8 Beylikdüzü/Istanbul', 3, N'0P', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (4, N'Murat', N'Yener', N'36521478541', CAST(N'1994-11-07' AS Date), CAST(65.00 AS Decimal(18, 2)), N'E', N'05387896523 ', N'muratyener@outlook.com', N'1425.sk. Baris mah. No:1/3 Esenler/Istanbul', 4, N'AP', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (5, N'Nermin', N'Ince', N'85478965214', CAST(N'1970-01-07' AS Date), CAST(68.00 AS Decimal(18, 2)), N'K', N'05364785965 ', N'nerminince@gmail.com', N'Manolya sk. Vatan mah. No:113/6 Pendik/Istanbul', 5, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (6, N'Tuncay', N'Yildirim', N'10247856934', CAST(N'1968-12-06' AS Date), CAST(90.00 AS Decimal(18, 2)), N'E', N'05412365478 ', N'tuncayyildirim@icloud.com', N'45.sk. Ata mah. No:28/3 Sile/Istanbul', 6, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (7, N'Sude', N'Dogan', N'90478125632', CAST(N'1995-04-11' AS Date), CAST(59.00 AS Decimal(18, 2)), N'K', N'05214785236 ', N'sudedogan_95@gmail.com', N'Günes sk. Basari mah. No:65a/3 Zeytinburnu/Istanbul', 7, N'ABP', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (8, N'Simay', N'Kaya', N'87412036587', CAST(N'1997-11-05' AS Date), CAST(60.00 AS Decimal(18, 2)), N'K', N'05364789521 ', N'simaykaya@hotmail.com', N'Paris sk. Yildirim mah. No:20/1 Bayrampasa/Istanbul', 8, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (9, N'Berk', N'Ertas', N'36521478529', CAST(N'1999-06-01' AS Date), CAST(75.00 AS Decimal(18, 2)), N'E', N'05478526987 ', N'berkertas@gmail.com', N'Sümbül sk. Gazi mah. No:30/12 Bakirköy/Istanbul', 9, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (10, N'Sefa', N'Yüksel', N'30178942657', CAST(N'1988-12-05' AS Date), CAST(81.00 AS Decimal(18, 2)), N'E', N'05235698744 ', N'yukselsefa@gmail.com', N'Kervan sk. Yenidogan mah. No:14/2 Ümraniye/Istanbul', 10, N'ABP', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (11, N'Zeynep', N'Eren', N'21354785698', CAST(N'1964-05-11' AS Date), CAST(60.00 AS Decimal(18, 2)), N'K', N'05423658798 ', N'erenzeynep21@hotmail.com', N'Bahariye Cad. Atatürk Mah. No:54/4 Atasehir/Istanbul', 11, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (12, N'Betul', N'Kirci', N'14785412369', CAST(N'1985-06-01' AS Date), CAST(59.00 AS Decimal(18, 2)), N'K', N'05687459899 ', N'betulkirci@hotmail.com', N'Derbent Köyü,22, 64000, Merkez/Istanbul', 12, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (13, N'Ahmet', N'Erdogdu', N'15963214587', CAST(N'2000-12-03' AS Date), CAST(52.00 AS Decimal(18, 2)), N'E', N'05214785693 ', N'ahmeterdogdu54@outlook.com', N'Kiran,28, 28502, Tirebolu/Istanbul', 13, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (14, N'Gençay', N'Ergül', N'25418965412', CAST(N'1976-02-08' AS Date), CAST(69.00 AS Decimal(18, 2)), N'E', N'05631458742 ', N'gencayergull@hotmail.com', N'Ortahaciahmetli Köyü,28, 40702, Çiçekdagi/Istanbul', 14, N'0P', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (15, N'Abdürresit', N'Arslan', N'56234875128', CAST(N'1966-03-05' AS Date), CAST(70.00 AS Decimal(18, 2)), N'E', N'05326521423 ', N'abdurresitarslan@gmail.com', N'Armutlu Köyü,20, 72400, Kozluk/Istanbul', 15, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (16, N'Birsen', N'Erdogan', N'12545896523', CAST(N'1958-03-12' AS Date), CAST(54.00 AS Decimal(18, 2)), N'K', N'05366589687 ', N'birsenerdogan@gmail.com', N'Cumhuriyet,2, 11600, Sögüt/Istanbul', 16, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (17, N'Onursu', N'Sakarya', N'12547856321', CAST(N'1965-05-10' AS Date), CAST(87.00 AS Decimal(18, 2)), N'E', N'05305684545 ', N'onursusakarya@hotmail.com', N'Ölüdeniz,24, 48300, Fethiye/Istanbul', 17, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (18, N'Sevican', N'Aydar', N'15478521485', CAST(N'1964-06-10' AS Date), CAST(64.00 AS Decimal(18, 2)), N'K', N'05321458569 ', N'sevicanaydar@gmail.com', N'Orman,29, 78000, Merkez/Istanbul', 18, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (19, N'Gül', N'Ihsanoglu', N'54685214785', CAST(N'1963-11-09' AS Date), CAST(75.00 AS Decimal(18, 2)), N'K', N'05458965485 ', N'gulihsansanogluu@gmail.com', N'Yalinli,21, 63500, Akçakale/Istanbul', 19, N'BP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (20, N'Ömür', N'Firat', N'15462135874', CAST(N'2011-11-11' AS Date), CAST(60.00 AS Decimal(18, 2)), N'E', N'05045623121 ', N'omurfirat@gmail.com', N'Kurtulus,26, 61450, Hayrat/Istanbul', 20, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (21, N'Rümeysa', N'Avci', N'56289647851', CAST(N'2010-12-12' AS Date), CAST(58.00 AS Decimal(18, 2)), N'K', N'05035625487 ', N'rumeysaavci@gmail.com', N'Basköy Köyü,34, 37210, Merkez/Istanbul', 21, N'0P', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (22, N'Aylin', N'Durmaz', N'19685471285', CAST(N'2001-01-01' AS Date), CAST(54.00 AS Decimal(18, 2)), N'K', N'05047859666 ', N'aylindurmaz@hotmail.com', N'Necip Fazil,29, 34773, Ümraniye/Istanbul', 22, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (23, N'Zeynep', N'Bardak', N'21056321445', CAST(N'1985-10-11' AS Date), CAST(66.00 AS Decimal(18, 2)), N'K', N'05624785211 ', N'zeynepbardak@gmail.com', N'Yayla Evleri,35, 14850, Mengen/Istanbul', 23, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (24, N'Aykut', N'Sezen', N'25478563214', CAST(N'2002-06-05' AS Date), CAST(63.00 AS Decimal(18, 2)), N'E', N'05326589647 ', N'aykutsezenn@hotmail.com', N'Ekincik,32, 18322, Bayramören/Istanbul', 24, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (25, N'Kerime', N'Sener', N'55478554126', CAST(N'2000-06-08' AS Date), CAST(90.00 AS Decimal(18, 2)), N'K', N'05325899887 ', N'kerimesener@gmail.com', N'Seyrantepe,26, 66300, Akdagmadeni/Istanbul', 25, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (26, N'Lâle', N'Akça', N'12547856985', CAST(N'1965-03-02' AS Date), CAST(92.00 AS Decimal(18, 2)), N'K', N'05365411123 ', N'laleakca@gmail.com.com', N'Bakirköy,19, 35790, Beydag/Istanbul', 26, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (27, N'Çaglar', N'Sensoy', N'25415698521', CAST(N'1963-11-05' AS Date), CAST(60.00 AS Decimal(18, 2)), N'E', N'05326588895 ', N'caglarsensoy@gmail.com', N'Ulasli Köyü,30, 72402, Kozluk/Istanbul', 27, N'0P', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (28, N'Dilara', N'Zorlu', N'21455623840', CAST(N'1966-12-12' AS Date), CAST(86.00 AS Decimal(18, 2)), N'K', N'05345659641 ', N'dilarazorlu@gmail.com', N'Çomaklar,1, 67380, Eregli/Istanbul', 28, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (29, N'Gökay', N'Derkay', N'56232102547', CAST(N'1967-05-12' AS Date), CAST(87.00 AS Decimal(18, 2)), N'E', N'05321452232 ', N'gokayderkay@gmail.com', N'Mevlütler,22, 20800, Acipayam/Istanbul', 29, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (30, N'Gülen', N'Bilgin', N'12556321202', CAST(N'1999-08-06' AS Date), CAST(95.00 AS Decimal(18, 2)), N'K', N'05621458962 ', N'gulenbilgin@hotmail.com', N'Emir,11, 16980, Orhaneli/Istanbul', 30, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (31, N'Demir', N'Hayrioglu', N'54125632501', CAST(N'2000-11-04' AS Date), CAST(63.00 AS Decimal(18, 2)), N'E', N'05314562103 ', N'demirhayrioglu@outlook.com', N'Karabucak,4, 7570, Demre/Istanbul', 31, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (32, N'Recep', N'Akdogan', N'21452365892', CAST(N'2010-06-05' AS Date), CAST(63.00 AS Decimal(18, 2)), N'E', N'05364521122 ', N'recepakdogan@hotmail.com', N'Doganli,6, 13002, Merkez/Istanbul,', 32, N'BP', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (33, N'Emre', N'Ayberk', N'12542036521', CAST(N'1985-07-04' AS Date), CAST(56.00 AS Decimal(18, 2)), N'E', N'05632145899 ', N'ayberkemre@outlook.com', N'Terziler,12, 67960, Çaycuma/Istanbul', 33, N'AN', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (34, N'Kerime', N'Hacer', N'10236521452', CAST(N'2021-12-11' AS Date), CAST(90.00 AS Decimal(18, 2)), N'K', N'05314562233 ', N'kerimehacerrr@gmail.com', N'Kavak Yazisi,15, 14030, Merkez/Istanbul', 34, N'BP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (35, N'Ercüment', N'Akincilar', N'12542362014', CAST(N'1963-10-12' AS Date), CAST(91.00 AS Decimal(18, 2)), N'E', N'05624587799 ', N'ercumentak@hotmail.com', N'Balikçil,3, 46300, Elbistan/Istanbul', 35, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (36, N'Sarper', N'Akis', N'12547856962', CAST(N'1964-11-12' AS Date), CAST(62.00 AS Decimal(18, 2)), N'E', N'05314589966 ', N'sarper12@hotmail.com', N'Habiboglu,20, 67802, Devrek/Istanbul', 36, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (37, N'Berker', N'Akkiray', N'98563214585', CAST(N'1947-04-09' AS Date), CAST(88.00 AS Decimal(18, 2)), N'E', N'05214587458 ', N'berkerakkiray@hotmail.com', N'Arapdede Köyü,5, 11802, Pazaryeri/Istanbul', 37, N'0P', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (38, N'Iclal', N'Akkoyun', N'68954125632', CAST(N'1974-10-03' AS Date), CAST(77.00 AS Decimal(18, 2)), N'K', N'05321456958 ', N'iclalakkoyun21@hotmail.com', N'Saganci,30, 35700, Bergama/Istanbul', 38, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (39, N'Ali', N'Samet', N'68954752145', CAST(N'1964-07-03' AS Date), CAST(65.00 AS Decimal(18, 2)), N'E', N'05310236523 ', N'alisamet@hotmail.com', N'Çat,10, 2602, Çelikhan/Istanbul', 39, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (40, N'Dogan', N'Akfirat', N'25478596521', CAST(N'1970-01-03' AS Date), CAST(65.00 AS Decimal(18, 2)), N'E', N'05314587796 ', N'doganakfirat@hotmail.com', N'Sirganlik,1, 29832, Kürtün/Istanbul', 40, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (41, N'Gizem', N'Akilli', N'25632145874', CAST(N'1963-01-03' AS Date), CAST(45.00 AS Decimal(18, 2)), N'K', N'05361452211 ', N'akiligizem@gmail.com', N'Yarimburgaz,28, 34303, Küçükçekmece/Istanbul', 41, N'BP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (42, N'Elif', N'Altinkaya', N'12541256321', CAST(N'2010-06-05' AS Date), CAST(56.00 AS Decimal(18, 2)), N'K', N'05624125632 ', N'elifaltinkaya@gmail.com', N'Savcilli,22, 9670, Buharkent/Istanbul', 42, N'AP', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (43, N'Sirma', N'Altunbas', N'12563214523', CAST(N'2006-11-06' AS Date), CAST(54.00 AS Decimal(18, 2)), N'K', N'05318745623 ', N'sirmaaltunbas@gmail.com', N'Eminli,22, 29832, Kürtün/Istanbul', 43, N'BN', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (44, N'Nefse', N'Altunbulak', N'12563214523', CAST(N'2003-07-03' AS Date), CAST(65.00 AS Decimal(18, 2)), N'K', N'05316982145 ', N'nefsealtunbulak@hotmail.com', N'Gölyazi,1, 55600, Terme/Istanbul', 44, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (45, N'Büsra', N'Altundal', N'12563214521', CAST(N'2007-11-09' AS Date), CAST(54.00 AS Decimal(18, 2)), N'K', N'05314562103 ', N'busraaltundal@gmail.com', N'Topsakal,2, 65900, Gürpinar/Istanbul', 45, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (46, N'Erna', N'Aluç', N'12563214583', CAST(N'2010-09-03' AS Date), CAST(64.00 AS Decimal(18, 2)), N'K', N'05320321020 ', N'ernaaluc@hotmail.com', N'Akköy,13, 38800, Yesilhisar/Istanbul', 46, N'AN', 0)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (47, N'Hikmet', N'Alver', N'12563214587', CAST(N'2001-07-09' AS Date), CAST(72.00 AS Decimal(18, 2)), N'E', N'05302130321 ', N'hikmetalver@gmail.com', N'Sariyar,6, 19000, Merkez/Istanbul', 47, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (48, N'Ismail', N'Anik', N'12541230254', CAST(N'2011-01-03' AS Date), CAST(67.00 AS Decimal(18, 2)), N'E', N'05319648596 ', N'ismailanik@hotmail.com', N'Esenevler,22, 80010, Merkez/Istanbul', 48, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (49, N'Ilkay', N'Ankara', N'12563214589', CAST(N'2005-09-07' AS Date), CAST(100.00 AS Decimal(18, 2)), N'E', N'05365412985 ', N'ilkayankara@hotmail.com', N'Sürek Köyü,4, 24402, Kemah/Istanbul', 49, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (50, N'Ramazan', N'Umut', N'12563214587', CAST(N'2007-04-03' AS Date), CAST(120.00 AS Decimal(18, 2)), N'E', N'05314569854 ', N'ramazanumutt54@gmail.com', N'Yesilpinar Köyü,20, 28612, Yaglidere/Istanbul', 50, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (51, N'Murat', N'Ayaz', N'12541256321', CAST(N'2010-05-12' AS Date), CAST(65.00 AS Decimal(18, 2)), N'E', N'05315426565 ', N'muratayvaz@gmail.com', N'Dolma,2, 23802, Baskil/Istanbul', 51, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (52, N'Ates', N'Ayci', N'96325874125', CAST(N'1956-06-12' AS Date), CAST(56.00 AS Decimal(18, 2)), N'E', N'05345621212 ', N'atesavci@hotmail.com', N'Pinar Pazari,4, 32500, Egirdir/Istanbul', 52, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (53, N'Zeynep', N'Aydinlioglu', N'20312036521', CAST(N'1945-02-03' AS Date), CAST(102.00 AS Decimal(18, 2)), N'K', N'05215624512 ', N'zeynepaydinlioglu@gmail.com', N'Kirkisla,18, 42850, Cihanbeyli/Istanbul', 53, N'AP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (54, N'Kerime', N'Aydogan', N'63201254896', CAST(N'1978-06-04' AS Date), CAST(68.00 AS Decimal(18, 2)), N'K', N'05365478569 ', N'kerimeaydogan@outlook.com', N'Haciahmetler,14, 14782, Göynük/Istanbul', 54, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (55, N'Hami', N'Aydogdu', N'63203214520', CAST(N'1986-07-06' AS Date), CAST(96.00 AS Decimal(18, 2)), N'E', N'05365478569 ', N'hamiaydogdu@hotmail.com', N'Özbagi Köyü,34, 58302, Divrigi/Istanbul', 55, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (56, N'Thomas', N'Aygen', N'52012365214', CAST(N'1949-03-03' AS Date), CAST(88.00 AS Decimal(18, 2)), N'E', N'05314523021 ', N'thomasaygen@gmail.com', N'Palamutoba Köyü,19, 17722, Bayramiç/Istanbul', 56, N'AN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (57, N'Günes', N'Aykan', N'52032145632', CAST(N'1950-07-06' AS Date), CAST(92.00 AS Decimal(18, 2)), N'K', N'05310232154 ', N'gunesaykan@gmail.com', N'Kadi,14, 37210, Merkez/Istanbul', 57, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (58, N'Elif', N'Ayrim', N'85214520365', CAST(N'1960-10-10' AS Date), CAST(98.00 AS Decimal(18, 2)), N'K', N'05311025632 ', N'elifayrim@gmail.com', N'Saca,6, 52300, Ünye/Istanbul', 58, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (59, N'Ugur', N'Aysal', N'63203214523', CAST(N'1970-11-11' AS Date), CAST(103.00 AS Decimal(18, 2)), N'E', N'05320213232 ', N'uguraysal52@gmail.com', N'Post,13, 12702, Solhan/Istanbul', 59, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (60, N'Osman', N'Yasin', N'96320152365', CAST(N'1980-12-12' AS Date), CAST(115.00 AS Decimal(18, 2)), N'E', N'05365412323 ', N'osmanyasin@gmail.com', N'Akinci Köyü,17, 28000, Merkez/Istanbul', 60, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (61, N'Adem', N'Ayvacik', N'85236541258', CAST(N'1984-10-11' AS Date), CAST(56.00 AS Decimal(18, 2)), N'E', N'05312036598 ', N'ademayvacik@gmail.com', N'Düverdüzü Köyü,27, 81060, Merkez/Istanbul', 61, N'BP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (62, N'Serra', N'Azbay', N'96523014521', CAST(N'1952-11-11' AS Date), CAST(59.00 AS Decimal(18, 2)), N'K', N'05324587451 ', N'serraazbay@gmail.com', N'Bahçelievler,30, 40322, Akpinar/Istanbul', 62, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (63, N'Ali', N'Babacan', N'85214569854', CAST(N'2003-05-05' AS Date), CAST(87.00 AS Decimal(18, 2)), N'E', N'05314589896 ', N'alibabacan@gmail.com', N'Agaçli Köyü,22, 2702, Gerger/Istanbul', 63, N'BN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (64, N'Sinan', N'Ismail', N'96547852141', CAST(N'1972-01-07' AS Date), CAST(78.00 AS Decimal(18, 2)), N'E', N'05314788585 ', N'sinanismail@hotmail.com', N'Ebeköy,18, 16900, Yenisehir/Istanbul', 64, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (65, N'Nihan', N'Yozgat', N'52145632012', CAST(N'1970-05-01' AS Date), CAST(69.00 AS Decimal(18, 2)), N'K', N'05365412536 ', N'nihanyozgat@gmail.com', N'Kocaömer(Yuvanin),1, 19902, Kargi/Istanbul', 65, N'ABN', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (66, N'Ali', N'Feyza', N'96541254125', CAST(N'1970-09-08' AS Date), CAST(87.00 AS Decimal(18, 2)), N'E', N'05314523636 ', N'alifeyza@gmail.com', N'Koçköy Köyü,22, 66802, Sefaatli/Istanbul', 66, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (67, N'Ismail', N'Cansin', N'41021452365', CAST(N'1997-08-03' AS Date), CAST(98.00 AS Decimal(18, 2)), N'E', N'05323203237 ', N'ismailcansin@hotmail.com', N'Memnuniye,13, 54600, Sapanca/Istanbul', 67, N'0P', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (71, N'Özgr', N'hgjh', N'12365478978', CAST(N'2022-12-10' AS Date), CAST(0.00 AS Decimal(18, 2)), N'E', N'12345678950 ', N'hgjhg', N'', 69, N'0N', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (72, N'Melek', N'Son', N'12365487965', CAST(N'2022-12-11' AS Date), CAST(56.00 AS Decimal(18, 2)), N'K', N'06548793254 ', N'saksd@gmail.com', N'İstanbul', 70, N'0P', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (73, N'Test12', N'Test12', N'32145698745', CAST(N'2022-12-14' AS Date), CAST(45.00 AS Decimal(18, 2)), N'K', N'02315498778 ', N'zxvvxz', N'zxvxzv', 74, N'ABP', 1)
INSERT [dbo].[Hasta] ([HastaID], [HastaAdi], [HastaSoyadi], [TCKN], [DogumTarihi], [Kilo], [Cinsiyet], [HastaTelefonNo], [HastaMail], [HastaAdres], [HastaGecmisiID], [KanGrubuID], [HastaDurum]) VALUES (76, N'Test50', N'Test51', N'12345678978', CAST(N'2022-12-15' AS Date), CAST(56.00 AS Decimal(18, 2)), N'K', N'01234657898 ', N'test@tes.com', N'', 79, N'0N', 1)
SET IDENTITY_INSERT [dbo].[Hasta] OFF
GO
SET IDENTITY_INSERT [dbo].[HastaGecmisi] ON 

INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (1, N'IbuCold', N'Grip', N'', N'Polen alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (2, N'Zoprotex', N'Yüksek Tansiyon', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (3, N'Dideral', N'Anjiyo', N'', N'Evcil hayvan alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (4, N'Desferal', N'Tip-2 Diyabet', N'Bademcik ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (5, N'Paracetamol Ped.', N'Covid-23', N'Entübasyon.', N'Konjonktivit.', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (6, N'Dermovat', N'Seboreik Dermatit', N'Apandisit Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (7, N'Rennie', N'Ülser', N'Karaciger Nakli', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (8, N'Tasigna', N'Kronik Lösemi', N'Diz Ameliyati', N'Toz Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (9, N'Stilex', N'Akut Ürtiker', N'Burun Ameliyati', N'Penisilin Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (10, N'Arveles', N'Uyluk Kemigi Kirilmasi', N'Bacak Ameliyati', N'Domates Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (11, N'Augmentin', N'Orta Kulak Iltihabi', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (12, N'Fomoser', N'Arpacik', N'Katarakt Ameliyati', N'Polen Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (13, N'Arveles', N'PCOS', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (14, N'Exelon', N'Faranjit', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (15, N'Galvus', N'Sistit', N'', N'Evcil Hayvan Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (16, N'Nevanac', N'Idrar yollari enfeksiyonu', N'Geniz Eti Ameliyati', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (17, N'Ritalin', N'Sizofreni', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (18, N'Sandostatin', N'Böbrek tasi', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (19, N'Starlix', N'Kalp yetmezligi', N'Bypass', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (20, N'Tobrex', N'Aritmi', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (21, N'Voltaren', N'Guatr', N'', N'Penisilin Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (22, N'Revolade', N'Ürtiker', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (23, N'Jakavi', N'Böbrek Yetmezligi', N'Böbrek Tasi Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (24, N'Diovan', N'Artrit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (25, N'Actifed', N'Idrar Yollari Enfeksiyonu', N'', N'Toz Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (26, N'Travazol', N'Mantar Enfeksiyonu', N'Apandisit Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (27, N'Katarin Forte', N'Soguk Alginligi', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (28, N'Ventolin', N'Orta Kulak Iltihabi', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (29, N'Onceair', N'Sinüzit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (30, N'Avmigran', N'Migren', N'Safra Kesesi Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (31, N'Atarax', N'Katarakt', N'Safra Kesesi Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (32, N'Zespira', N'Panikatak', N'', N'Küf Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (33, N'Üropan', N'Dermatit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (34, N'Asacol', N'Ülseratif Kolit', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (35, N'Aricept', N'Hipertiroid', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (36, N'Roxion', N'Hipertansiyon', N'', N'Süt alerjisi', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (37, N'Sulcid', N'Kalp krizi', N'Açik Kalp Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (38, N'Zinnat', N'Akciger Kanseri', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (39, N'Penbisin', N'Kalp yetmezligi', N'Mitral Kapak Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (40, N'Kemoprim', N'Mide Kanseri', N'Mide Bypass', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (41, N'Cipro', N'Gida Zehirlenmesi', N'Endoskopi', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (42, N'Cilapem', N'Hipotiroid', N'', N'Toz Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (43, N'Genta', N'Pankreatit', N'Mide Kelepçe Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (44, N'Flotic', N'Crohn Hastaligi', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (45, N'Ketoral', N'Seboroik Dermatit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (46, N'Arveles', N'Artrit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (47, N'Serozil', N'Stoma', N'', N'Küf Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (48, N'Aklovir', N'Fungal Akne', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (49, N'Ornisid', N'Ürtiker', N'Anjiyo', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (50, N'Zofunol', N'Hipertansiyon', N'Açik Kalp Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (51, N'Savler', N'Tip-1 diyabet', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (52, N'Stocrin', N'OKB', N'Burun Ameliyati', N'Çikolata Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (53, N'Cidofovir', N'KOAH', N'Akciger Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (54, N'Savlex', N'Bronsit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (55, N'Ornisid', N'Hipotiroid', N'Katarakt Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (56, N'Cipro', N'Sarkoidoz', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (57, N'Apranax', N'Kronik bronsit', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (58, N'Genta', N'Neoplazm', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (59, N'Fucidin', N'Seboroik Dermatit', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (60, N'Genta', N'Ishal', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (61, N'Aricept', N'Hepatit B', N'', N'', 0, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (62, N'Aspirin', N'Kalp Yetmezligi', N'', N'Toz Alerjisi', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (63, N'Bilaxten', N'Siroz', N'Katarakt Ameliyati', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (64, N'Zantac', N'Artrit', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (65, N'Norsol Damla', N'Polip', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (66, N'Aferin', N'Soguk Alginligi', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (67, N'Roaccutane', N'Fungal Akne', N'', N'', 1, NULL)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (68, N'Paxera 20 MG 56', N'yok', N'yok', N'yok', NULL, 68)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (69, N'CERTICAN Tablet 0.25 mg 60 tablet', N'yok', N'yok', N'yok', NULL, 68)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (70, N'Paracetamol Ped.', N'yok', N'yok', N'toz alerjisi', NULL, 72)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (71, N'Paracetamol Ped.', N'', N'', N'', NULL, 73)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (72, N'Paracetamol Ped.', N'', N'', N'', NULL, 73)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (73, N'Paracetamol Ped.', N'', N'', N'', NULL, 73)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (74, N'Paxera 20 MG 56', N'yko', N'yok', N'yok', NULL, 73)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (75, N'ZALAIN % 2 20 gr Krem', N'yok', N'yok', N'yok', NULL, 74)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (76, N'Bemiks C Film Kapli Tablet', N'', N'', N'', 1, 75)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (77, N'Paracetamol Ped.', N'', N'', N'', 1, 75)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (78, N'ANLEV 1000 MG Film Kapli Tablet', N'', N'', N'', 1, 74)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (79, N'Paracetamol Ped.', N'', N'', N'', 1, 76)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (80, N'Paracetamol Ped.', N'', N'', N'', 1, 77)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (81, N'Paracetamol Ped.', N'', N'', N'', 1, 77)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (82, N'Paracetamol Ped.', N'', N'', N'', 1, 77)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (83, N'CERTICAN Tablet 0.25 mg 60 tablet', N'yok', N'yok', N'yok', 1, 77)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (84, N'CERTICAN Tablet 0.25 mg 60 tablet', N'yok', N'yok', N'yok', 1, 78)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (85, N'Paracetamol Ped.', N'Artrit', N'', N'', 1, 78)
INSERT [dbo].[HastaGecmisi] ([HastaGecmisiID], [KullandigiIlac], [GecirdigiHastalik], [GecirdigiAmeliyat], [Alerjiler], [HastaGecmisiDurum], [HastaID]) VALUES (86, N'Paracetamol Ped.', N'', N'', N'', 1, 78)
SET IDENTITY_INSERT [dbo].[HastaGecmisi] OFF
GO
SET IDENTITY_INSERT [dbo].[HastaneBilgi] ON 

INSERT [dbo].[HastaneBilgi] ([HastaneID], [HastaneAdi], [TelefonNo], [Adres]) VALUES (1, N'Tema Kadiköy Hastanesi', N'0216 543 67 76', N'Dumlupinar Mah.Güner sok No:15 Kadiköy Istanbul')
SET IDENTITY_INSERT [dbo].[HastaneBilgi] OFF
GO
SET IDENTITY_INSERT [dbo].[Ilaclar] ON 

INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (1, N'Paracetamol Ped.', N'Surup, Sinir Sitemi, Analjezik', CAST(16.77 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (2, N'Gastopal 680 MG/80 MG 48 Çigneme Tableti', N'Sindirim Sistemi ve Metabolizma kategorisinde ve A02 MIDE sinifinda bulunur.', CAST(29.40 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (3, N'Kortos Krem 30 GR', N'Kalp ve Damar Sistemi kategorisinde ve C05 Vazoprotektiflersinifinda bulunur.', CAST(50.28 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (4, N'Paxera 20 MG 56', N'Sinir Sistemi kategorisinde ve Psikoanaleptikler sinifinda bulunur.', CAST(91.53 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (5, N'Bemiks C Film Kapli Tablet', N'Sindirim Sistemi ve Metabolizma kategorisinde ve Vitaminler sinifinda bulunur.', CAST(79.03 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (6, N'Matisse 100 mg Film Kapli Tablet', N'Sinir Sitemi kategorisinde ve ANTIEPILEPTIKLER sinifinda bulunur.', CAST(413.32 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (7, N'JIVI 1000 IU IV Enjeksionluk Çözelti Hazirlamak Için Toz Ve Çözücü', N'Kan ve Kan Yapici Organlar kategorisinde ve ANTIHEMORAJIKLER sinifinda bulunur. ', CAST(5477.27 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (8, N'ANLEV 1000 MG Film Kapli Tablet', N'Sinir Sistemi kategorisinde ve ANTIEPILEPTIKLER sinifinda bulunur.', CAST(344.36 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (9, N'BENEFIX 1000 IU IV enjeksiyonluk çözelti için toz ve çözücü', N'Kan ve Yapici Organlar kategorisinde ve ANTIHEMORAJIKLER sinifinda bulunur.', CAST(6962.69 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (10, N'CERTICAN Tablet 0.25 mg 60 tablet', N'Antineoplastik ve Immünomodülatör Ajanlar kategorisinde ve IMMÜNOSÜPRESANLAR sinifinda bulunur.', CAST(807.16 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (11, N'DEXOJECT. ®. 8 mg/ 2 ml IM/IV Enjeksiyonluk Çözelti içeren Ampül', N'Endokrin Sistem (Cinsiyet Hormonlari ve Insülin Hariç) kategorisinde ve SISTEMIK KORTIKOSTEROIDLER sinifinda bulunur.', CAST(9.44 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (12, N'EXCALIBA PLUS 40 mg/ 10 mg/ 12.5 mg film kapli tablet (28 tablet)', N'Kalp Damar Sistemi kategorisinde ve Renin Anjiyotensin Sistemi sinifinda bulunur. ', CAST(85.12 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (13, N'FEBIND 500 mg suda dagilabilen 28 tablet ', N'Çesitli kategorisinde ve Diger Tüm Terapötikler sinifinda bulunur.', CAST(3111.50 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (14, N'GLUCERNA 1.5 KCAL çilek aromali 220 ml', N'TITCK listesindeki ATC kodu V06DB ve ATC adi fat/carbohydrates/proteins/minerals/vitamins combinations.', CAST(21.29 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (15, N'HOLOXAN 1 G IV infüzyonluk çözelti hazirlamak için toz Barkodu', N'Antineoplastik ve Imminomodülatör Ajanlar kategorisinde Antineoplastikler sinifinda bulunur.', CAST(414.34 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (16, N'INGLEX 120 mg 84 film tablet', N'Sindirim Sistemi ve Metabolizma kategorisinde ve Diyabet Ilaçlari sinifinda bulunur.', CAST(147.42 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (17, N'JINARC 30 mg 28 tablet ', N' JINARC, “otozomal dominant polikistik böbrek hastaligi” (ADPKD) isimli hastaligin tedavisi için kullanilir.Kalp ve Damar Sistemi kategorisinde ve DIÜRETIKLER sinifinda bulunur.', CAST(10609.40 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (18, N'KADCYLA 160 mg IV inf. çözelti konsantresi için toz içeren flakon', N'Antineoplastik ve Immünomodülatör Ajanlar kategorisinde ve Antineoplastikler sinifinda bulunur.', CAST(15712.16 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (19, N'LIPVAKOL 20 mg film tablet (28 tablet)', N'Kalp ve Damar Sistemi kategorisinde ve Lipid Metabolizmasina Etkili Ilaçlar sinifinda bulunur.', CAST(21.29 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (20, N'MIKROSID 30 Tablet', N'Antiefektifler(Sistemik) kategorisinde ve Sistemik AntiBakteriyeller sinifinda bulunur.', CAST(19.78 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (21, N'NORM-ASIDOZ 1000 mg gastro rezistan tablet', N'Kan ve Kan Yapici Organlar kategorisinde ve Kan ve Perfüzyon Solüsyonlari sinifinda bulunur.', CAST(336.20 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (22, N'OCREVUS 300 mg/ 10ml infüzyonluk çözelti hazirlamak için konsantre (1 flakon) ', N' Multipl Skleroz (MS) formlarinin tedavisinde kullanilir. Antineoplastik ve Imminomodülatör Ajanlar kategorisinde ve Immünosüpresanlar sinifinda bulunur.', CAST(34899.12 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (23, N'POLTEOFILIN 200 IV inf. için enjektabl çözelti 100 ml setli', N'Solunum Sistemi kategorisinde ve Obstrüktis Solunum Sistemi Hastaliklari sinifinda bulunur.', CAST(29.31 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (24, N'ROACCUTANE 20 mg 30 kapsül', N'Dermatolojikler kategorisinde ve Akne Ilaçlari sinifinda bulunur.', CAST(159.64 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (25, N'SODKOLIS 4.500.000 IU IM/IV enjeksiyonluk ve inhalasyonluk çözelti hazirlamak için liyofilize toz ve çözücü ', N'Antienfektifler (Sistemik) kategorisinde ve Sistemik Antibakteiyeller sinifinda bulunur.', CAST(165.61 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (26, N'Timabak % 0,25 5 Ml Göz Damlasi', N' Duyu Organlari kategorisinde ve Oftalmolojik Ilaçlar sinifinda bulunur. ', CAST(45.25 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (27, N'UREDERM %20 Krem', N'Dermatolojikler kategorisinde ve Yumusatici ve Koruyucular sinifinda bulunur.', CAST(15.11 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (28, N'VAGIFEM® 25 mikrogram film kapli vajinal tablet', N'Ürogenital Sistem ve Cinsiyet Hormonlari kategorisinde ve Cinsiyet Hormonlari - Genital Sistem Modülatörleri sinifinda bulunur.', CAST(206.69 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (29, N'XETANOR 20 MG 30 Tablet', N'Sinir Sistemi kategorisinde ve Psikoanaleptikler sinifinda bulunur.', CAST(48.79 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (30, N'Yasmin 21 Film Tablet', N'Ürogenital Sistem ve Cinsiyet Hormonlari kategorisinde ve Cinsiyet Hormonlari - Genital Sistem Modülatörleri sinifinda bulunur.', CAST(97.06 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (31, N'DESAL 40 MG 12 Tablet', N'Kalp ve Damar Sistemi kategorisinde ve Diüretikler sinifinda bulunur.', CAST(12.14 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (32, N'ZALAIN % 2 20 gr Krem', N'Dermatolojikler kategorisinde ve Dermatolojik Antifungallarsinifinda bulunur.', CAST(33.04 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (33, N'Zinko', N'Çinko eksikliginin önlenmesinde ve tedavisinde, çinko emilim bozuklugunda (akrodermatitis enteropatika) ve vücutta asiri derecede bakir birikmesi hastaliginda (Wilson) kullanilir.', CAST(99.99 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (34, N'Iburamin Cold', N'Solunum Sistemi Kategorisinde Nazal Ilaçlar sinifinda bulunur', CAST(31.46 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (35, N'Majezik 100 mg 30 Film', N'Iskelet Sistemi kategorisinde ve Antienflamatuar ve Antiromatikler sinifinda bulunur.', CAST(40.64 AS Decimal(18, 2)))
INSERT [dbo].[Ilaclar] ([BarkodID], [IlacAdi], [İcerikBilgi], [Fiyat]) VALUES (36, N'Yok', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ilaclar] OFF
GO
SET IDENTITY_INSERT [dbo].[Izinler] ON 

INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (1, 1, N'Ücretli Yillik Izin', CAST(N'2022-09-12' AS Date), CAST(N'2022-09-23' AS Date), N'Resadiye Mahallesi, Izzet Sancak Caddesi,No:25,Kat:3,Daire:14,Serhat Apartmani', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (2, 2, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Saffet Mahallesi,Pinar Hisar Caddesi,Gündüz Apartmani,Daire:22,Istanbul/Esenler', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (3, 5, N'Ücretsiz Izin', CAST(N'2022-06-06' AS Date), CAST(N'2022-06-17' AS Date), N'Kocatepe mahallesi, Koca Caddesi,Güniz Sokagi,Asli Apt.,Daire:2,Sisli/Istanbul', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (4, 12, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Akova Mah. Aksevim Sok. No:93 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (5, 41, N'Hastalik Izni', CAST(N'2022-09-12' AS Date), CAST(N'2022-09-23' AS Date), N'Agca Mah. Agiroglu Sok. No:77 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (6, 51, N'Ücretli Yillik Izin', CAST(N'2022-10-10' AS Date), CAST(N'2022-10-21' AS Date), N'Akkiray Mah. Akküt Sok. No:37 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (7, 18, N'Ücretli Yillik Izin', CAST(N'2022-10-24' AS Date), CAST(N'2022-11-04' AS Date), N'Arif Mah. Armutcu Sok. No:8 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (8, 22, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-20' AS Date), N'Akova Mah. Aksevim Sok. No:93 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (9, 57, N'Ücretsiz Izin', CAST(N'2022-09-15' AS Date), CAST(N'2022-09-16' AS Date), N'Ala Mah. Ankara Sok. No:88 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (10, 19, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Ansen Mah. Aral Sok. No:90 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (11, 7, N'Ücretli Yillik Izin', CAST(N'2022-08-08' AS Date), CAST(N'2022-08-19' AS Date), N'Alibeyoglu Mah. Alparslan Sok. No:64 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (12, 4, N'Hsatlik Izni', CAST(N'2022-08-18' AS Date), CAST(N'2022-08-19' AS Date), N'Kaput mahallesi, Atatürk caddesi,89.Sokak,Daire:6/3,Sisli/Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (13, 19, N'Ücretli Yillik Izin', CAST(N'2022-09-12' AS Date), CAST(N'2022-09-23' AS Date), N'Ansen Mah. Aral Sok. No:90 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (14, 32, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Akas Mah. Akbilmez Sok. No:30 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (15, 15, N'Ücretsiz Izin', CAST(N'2022-07-06' AS Date), CAST(N'2022-07-07' AS Date), N'Al Mah. Aldag Sok. No:23 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (16, 1, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Resadiye Mahallesi, Izzet Sancak Caddesi,No:25,Kat:3,Daire:14,Serhat Apartmani', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (17, 12, N'Ücretli Yillik Izin', CAST(N'2022-09-12' AS Date), CAST(N'2022-09-23' AS Date), N'Akova Mah. Aksevim Sok. No:93 Istanbul', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (18, 22, N'Hastalik Izni', CAST(N'2022-09-12' AS Date), CAST(N'2022-09-14' AS Date), N'Akova Mah. Aksevim Sok. No:93 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (19, 28, N'Hastalik Izni', CAST(N'2022-09-09' AS Date), CAST(N'2022-09-11' AS Date), N'Ak Mah. Akarçay Sok. No:75 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (20, 13, N'Ücretli Yillik Izin', CAST(N'2022-08-15' AS Date), CAST(N'2022-08-26' AS Date), N'Aksoy Mah. Aksamoglu Sok. No:94 Istanbul', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (21, 9, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Aydogan Yozgat Mah. Aygen Sok. No:77 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (22, 15, N'Ücretsiz Izin', CAST(N'2022-10-10' AS Date), CAST(N'2022-10-14' AS Date), N'Al Mah. Aldag Sok. No:23 Istanbul', 0)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (23, 24, N'Mazeret Izni', CAST(N'2022-10-19' AS Date), CAST(N'2022-10-21' AS Date), N'Agca Mah. Agiroglu Sok. No:77 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (24, 61, N'Ücretli Yillik Izin', CAST(N'2022-11-01' AS Date), CAST(N'2022-11-11' AS Date), N'Aksöz Mah. Aktuna Sok. No:25 Istanbul', 1)
INSERT [dbo].[Izinler] ([IzinID], [PersonelID], [IzınTuru], [IzinBaslangic], [IzinBitis], [IzinAdresi], [IzinDurum]) VALUES (25, 76, N'Hastalik Izni', CAST(N'2022-09-18' AS Date), CAST(N'2022-09-20' AS Date), N'Balci Mah. Aygen Sok. No:20 Istanbul', 1)
SET IDENTITY_INSERT [dbo].[Izinler] OFF
GO
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'0N', N'0-')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'0P', N'0+')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'ABN', N'AB-')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'ABP', N'AB+')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'AN', N'A-')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'AP', N'A+')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'BN', N'B-')
INSERT [dbo].[KanGrubu] ([KanGrubuID], [KanGrubuTuru]) VALUES (N'BP', N'B+')
GO
SET IDENTITY_INSERT [dbo].[Meslek] ON 

INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (1, N'Doktor')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (2, N'Hemsire')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (3, N'Saglik Teknikeri')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (4, N'Acil Tip Teknisyeni')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (5, N'Laboratuvar Personeli')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (6, N'Temizlik Personeli')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (7, N'Hasta Bakim Personeli')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (8, N'Hastane Yöneticisi')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (9, N'Eczaci')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (10, N'Fizyoterapist')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (11, N'Odyolog')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (12, N'Biyolog')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (13, N'Sosyal Hizmet Uzmani')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (14, N'Saglik Idarecisi')
INSERT [dbo].[Meslek] ([MeslekID], [MeslekTuru]) VALUES (15, N'Admin')
SET IDENTITY_INSERT [dbo].[Meslek] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (1, 1, N'Sennur Agnar Agnar', N'Agnar', N'80455545109', CAST(N'1992-02-03' AS Date), N'K', N'(676)9297712', N'sennur.agnar@gmail.com', N'Ahmet Mah. Akarcali Sok. No:89 Istanbul', CAST(N'2019-11-10' AS Date), N'Doktora', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (2, 1, N'Rüya Alp Alp', N'Alp', N'36921865781', CAST(N'1991-09-11' AS Date), N'K', N'(212)2220888', N'ruya.alp@mail.com', N'Resadiye Mahallesi, Izzet Sancak Caddesi,No:25,Kat:3,Daire:14,Serhat Apartmani', CAST(N'2019-10-08' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (3, 1, N'Mert', N'Alkan', N'34698745632', CAST(N'1987-07-05' AS Date), N'E', N'(537)4784778', N'mert.alkan@mail.com', N'Saffet Mahallesi,Pinar Hisar Caddesi,Gündüz Apartmani,Daire:22,Istanbul/Esenler', CAST(N'2017-01-08' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (4, 1, N'Hamide ', N'Pala', N'64686212457', CAST(N'1980-12-12' AS Date), N'K', N'(535)5355535', N'hamide.pala@mail.com', N'Kaput mahallesi, Atatürk caddesi,89.Sokak,Daire:6/3,Sisli/Istanbul', CAST(N'2021-12-12' AS Date), N'Doktora', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (5, 1, N'Asaf Yildiz Yildiz Yildiz Yildiz', N'Yildiz', N'18191252878', CAST(N'1978-02-07' AS Date), N'E', N'(555)6389802', N'asaf.yildiz@mail.com', N'Kocatepe mahallesi, Koca Caddesi,Güniz Sokagi,Asli Apt.,Daire:2,Sisli/Istanbul', CAST(N'2012-10-10' AS Date), N'Yüksek Lisans', N'0N', 1, 1, N'17171f36273b3c032d6bec9a0de22701')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (6, 1, N'Adil Özgür Özgür Özgür', N'Özgür', N'78964512188', CAST(N'1978-03-03' AS Date), N'E', N'(551)9455234', N'adil.ozgur@mail.com', N'Kemalpasa mahallesi, Serdivan Caddesi,Artvin Sokagi,No:12,Daire:2,Istanbul', CAST(N'2017-12-10' AS Date), N'Yüksek Lisans', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (7, 1, N'Bahar Özge', N'Özge', N'72526911498', CAST(N'1988-07-03' AS Date), N'K', N'(555)9877234', N'bahar.ozge@mail.com', N'Alibeyoglu Mah. Alparslan Sok. No:64 Istanbul', CAST(N'2020-01-10' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (8, 1, N'Ömer', N'Alparslan', N'14159521326', CAST(N'1975-05-08' AS Date), N'E', N'(955)4612810', N'omer.alparslan@gmail.com', N'Altan Mah. Altay Sok. No:4 Istanbul', CAST(N'2020-10-11' AS Date), N'Doktora', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (9, 1, N'Ates', N'Ayci', N'89054806986', CAST(N'1978-08-02' AS Date), N'E', N'(512)2124565', N'ates.ayci@gmail.com', N'Aydogan Yozgat Mah. Aygen Sok. No:77 Istanbul', CAST(N'2019-01-10' AS Date), N'Lisans', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (10, 1, N'Zeynep Nihan', N'Aydinlioglu', N'16113521748', CAST(N'1972-12-02' AS Date), N'K', N'(703)3110705', N'zeynepnihan.aydinlioglu@gmail.com', N'Aydogdu Mah. Aykan Sok. No:85 Istanbul', CAST(N'2018-08-01' AS Date), N'Yüksek Lisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (11, 1, N'Saba', N'Atmaca', N'45891782994', CAST(N'1972-04-05' AS Date), N'K', N'(577)8648488', N'saba.atmaca@gmail.com', N'Atol Mah. Avci Özsoy Sok. No:21 Istanbul', CAST(N'2022-04-10' AS Date), N'Doktora', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (12, 1, N'Ata Kerem Akman ', N'Akman', N'55762441724', CAST(N'1982-01-07' AS Date), N'E', N'(567)3479765', N'atakerem.akman@gmail.com', N'Akova Mah. Aksevim Sok. No:93 Istanbul', CAST(N'2019-02-08' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (13, 1, N'Nüket Aksan ', N'Aksan', N'28187325726', CAST(N'1978-03-04' AS Date), N'K', N'(860)9627280', N'nuket.aksan@gmail.com', N'Aksoy Mah. Aksamoglu Sok. No:94 Istanbul', CAST(N'2021-12-12' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (14, 1, N'Kutlu ', N'Alibeyoglu', N'68807641744', CAST(N'1987-01-01' AS Date), N'E', N'(646)9959765', N'kutlu.alibeyoglu@gmail.com', N'Alparslan Mah. Altan Sok. No:7 Istanbul', CAST(N'2018-06-10' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (15, 1, N'Eda Sena Akyildiz Akyildiz Akyildiz', N'Akyildiz', N'94668689318', CAST(N'1970-12-12' AS Date), N'K', N'(353)6975488', N'edasena.akyildiz@gmail.com', N'Al Mah. Aldag Sok. No:23 Istanbul', CAST(N'2020-08-01' AS Date), N'Lisans', N'BP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (16, 1, N'Mazlum Altan', N'Altan', N'82899482741', CAST(N'1978-08-04' AS Date), N'E', N'(984)9763760', N'mazlum.altan@gmail.com', N'Altay Mah. Altinoklu Sok. No:71 Istanbul', CAST(N'2018-12-10' AS Date), N'Doktora', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (17, 1, N'Edip', N'Attila', N'90483987245', CAST(N'1989-09-09' AS Date), N'E', N'(825)3794660', N'edip.attila@gmail.com', N'Aviandi Mah. Ay Sok. No:82 Istanbul', CAST(N'2019-12-10' AS Date), N'Lisans', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (18, 1, N'Deniz Dilay', N'Arican', N'46067618150', CAST(N'1982-02-01' AS Date), N'K', N'(779)2211397', N'denizdilay.arican@gmail.com', N'Arif Mah. Armutcu Sok. No:8 Istanbul', CAST(N'2019-08-05' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (19, 1, N'Ismail', N'Umut', N'30312674854', CAST(N'1992-05-10' AS Date), N'E', N'(481)5502345', N'ismailumut@gmail.com', N'Ansen Mah. Aral Sok. No:90 Istanbul', CAST(N'2021-06-08' AS Date), N'Doktora', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (20, 1, N'Leyla', N'Yakupoglu', N'41718293655', CAST(N'1992-12-02' AS Date), N'K', N'(555)6389878', N'leyla.yakupoglu@mail.com', N'Maresal Mahallesi, Çalislar cad. albay sok. adatepe apt.,Istanbul', CAST(N'2021-05-01' AS Date), N'Lisans', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (21, 1, N'Fatma Özlem Acar Acar', N'Acar', N'92024632890', CAST(N'1978-08-12' AS Date), N'K', N'(210)5734040', N'fatmaozlem.acar@gmail.com', N'Adanir Mah. Agca Sok. No:85 Istanbul', CAST(N'2019-10-08' AS Date), N'Lisans', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (22, 1, N'Özde Acarkan Acarkan', N'Acarkan', N'62660003491', CAST(N'1972-12-08' AS Date), N'K', N'(733)3914794', N'ozde.acarkan@gmail.com', N'Adigüzel Mah. Agiragaç Sok. No:57 Istanbul', CAST(N'2020-10-08' AS Date), N'Yüksek Lisans', N'BP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (23, 2, N'Atahan', N'Adanir', N'99614197194', CAST(N'1982-12-12' AS Date), N'E', N'(725)9372925', N'atahan.adanir@gmail.com', N'Agca Mah. Agiroglu Sok. No:77 Istanbul', CAST(N'2019-05-03' AS Date), N'Lisans', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (24, 2, N'Haci Mehmet', N'Adigüzel', N'13805084899', CAST(N'1986-06-05' AS Date), N'E', N'(682)3218022', N'hacimehmet.adiguzel@gmail.com', N'Agca Mah. Agiroglu Sok. No:77 Istanbul', CAST(N'2021-11-01' AS Date), N'Lisans', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (25, 2, N'Mükerrem Zeynep', N'Agca', N'69632995001', CAST(N'1989-08-10' AS Date), N'K', N'(968)5025652', N'mukerremzeynep.agca@gmail.com', N'Agiroglu Mah. Ahmadi Asl Sok. No:46 Istanbul', CAST(N'2022-01-02' AS Date), N'Lisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (26, 2, N'Bestami', N'Agiragaç', N'17996088604', CAST(N'1991-08-05' AS Date), N'E', N'(396)8437764', N'bestami.agiragaç@gmail.com', N'Agnar Mah. Ahmet Sok. No:30 Istanbul', CAST(N'2021-11-01' AS Date), N'Önlisans', N'BP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (27, 2, N'Aykut', N'Agiroglu', N'66472849869', CAST(N'2019-05-09' AS Date), N'E', N'(593)9489963', N'aykut.agiroglu@gmail.com', N'Ahmet Yesevi Mah. Ak Sok. No:52 Istanbul', CAST(N'2022-08-12' AS Date), N'Önlisans', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (28, 2, N'Tutkum', N'Asil', N'57182199935', CAST(N'1994-08-03' AS Date), N'K', N'(492)8459612', N'tutkum.asil@gmail.com', N'Ak Mah. Akarçay Sok. No:75 Istanbul', CAST(N'2022-07-12' AS Date), N'Önlisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (29, 2, N'Mügenur', N'Ahmet', N'22743807388', CAST(N'1997-12-07' AS Date), N'K', N'(267)2220672', N'mugenur.ahmet@gmail.com', N'Akarcali Mah. Akarpinar Sok. No:55 Istanbul', CAST(N'2020-02-04' AS Date), N'Önlisans', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (30, 3, N'Sevinç', N'Ak', N'98860232636', CAST(N'1987-08-09' AS Date), N'K', N'(311)8262888', N'sevinc.ak@gmail.com', N'Akarçay Mah. Akas Sok. No:43 Istanbul', CAST(N'2020-05-08' AS Date), N'Önlisans', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (31, 3, N'Kayihan Nedim', N'Akarcali', N'62882631493', CAST(N'1992-03-07' AS Date), N'E', N'(968)6170341', N'kayihannedim.akarcali@gmail.com', N'Akarpinar Mah. Akay Sok. No:2 Istanbul', CAST(N'2020-12-08' AS Date), N'Önlisans', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (32, 3, N'Lemi', N'Akarçay', N'64255644435', CAST(N'1991-11-11' AS Date), N'E', N'(293)6064169', N'lemi.akarcay@gmail.com', N'Akas Mah. Akbilmez Sok. No:30 Istanbul', CAST(N'2021-12-03' AS Date), N'Önlisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (33, 3, N'Cihan', N'Akarpinar', N'19679424576', CAST(N'1992-02-08' AS Date), N'E', N'(408)3991381', N'cihan.akarpinar@gmail.com', N'Akay Mah. Akca Sok. No:83 Istanbul', CAST(N'2021-10-03' AS Date), N'Önlisans', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (34, 3, N'Rafi', N'Akas', N'22396247882', CAST(N'1988-12-03' AS Date), N'E', N'(271)8772723', N'rafi.akas@gmail.com', N'Akbilmez Mah. Akçagunay Sok. No:57 Istanbul', CAST(N'2017-05-10' AS Date), N'Önlisans', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (35, 4, N'Mehmetcan', N'Akay', N'63069500518', CAST(N'1985-12-12' AS Date), N'E', N'(687)3278027', N'mehmetcan.akay@gmail.com', N'Akca Mah. Akçay Sok. No:62 Istanbul', CAST(N'2015-12-08' AS Date), N'Önlisans', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (36, 4, N'Demircan', N'Baydil', N'26106573941', CAST(N'1985-05-05' AS Date), N'E', N'(567)9643037', N'demircan.baydil@gmail.com', N'Baykan Mah. Bayrakoglu Sok. No:84 Istanbul', CAST(N'2018-08-08' AS Date), N'Önlisans', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (37, 5, N'Burçin Kübra', N'Baykal', N'22755694880', CAST(N'1978-10-07' AS Date), N'K', N'(581)3442294', N'burcinkubra.baykal@gmail.com', N'Baykus Mah. Bayram Sok. No:79 Istanbul', CAST(N'2021-11-11' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (38, 5, N'Dervis Haluk', N'Baykan', N'39948218832', CAST(N'1988-01-01' AS Date), N'E', N'(437)2783315', N'dervishaluk.baykan@gmail.com', N'Bayrakoglu Mah. Baytin Sok. No:56 Istanbul', CAST(N'2020-11-03' AS Date), N'Lisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (39, 6, N'Taylan Remzi', N'Baykus', N'36661392747', CAST(N'1989-03-02' AS Date), N'E', N'(794)2136130', N'taylanremzi.baykus@gmail.com', N'Bayram Mah. Begiç Sok. No:8 Istanbul', CAST(N'2015-05-01' AS Date), N'Ilkokul', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (40, 6, N'Didem', N'Biçaksiz', N'71522586913', CAST(N'1987-06-05' AS Date), N'K', N'(919)3540236', N'didem.bicaksiz@gmail.com', N'Bilgeç Mah. Bilgi Sok. No:59 Istanbul', CAST(N'2020-10-10' AS Date), N'Önlisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (41, 6, N'Halime', N'Beydag', N'10334565256', CAST(N'1980-08-06' AS Date), N'K', N'(822)5712962', N'halime.beydag@gmail.com', N'Agca Mah. Agiroglu Sok. No:77 Istanbul', CAST(N'2021-12-01' AS Date), N'Lise', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (42, 6, N'Mihrinaz', N'Bilal', N'26671776647', CAST(N'1968-08-12' AS Date), N'K', N'(727)7155857', N'mihrinaz.bilal@gmail.com', N'Bilgen Mah. Bilgiç Sok. No:43 Istanbul', CAST(N'2015-12-18' AS Date), N'Lise', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (43, 6, N'Onur Taylan', N'Boylu', N'11679536590', CAST(N'1987-11-04' AS Date), N'E', N'(827)7224608', N'onurtaylan.boylu@gmail.com', N'Boz Mah. Bozdemir Sok. No:50 Istanbul', CAST(N'2019-11-05' AS Date), N'Lise', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (44, 6, N'Nuhaydar', N'Akbilmez', N'65785481392', CAST(N'1994-01-01' AS Date), N'E', N'(308)9173655', N'nuhaydar.akbilmez@gmail.com', N'Boz Mah. Bozdemir Sok. No:50 Istanbul', CAST(N'2012-12-12' AS Date), N'Lise', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (45, 6, N'Emine Münevver', N'Akca', N'41504998275', CAST(N'1970-05-01' AS Date), N'K', N'(831)4010748', N'eminemunevver.akca@gmail.com', N'Akçay Mah. Akfirat Sok. No:92 Istanbul', CAST(N'2020-06-07' AS Date), N'Lise', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (46, 6, N'Servet', N'Akçagunay', N'17464722886', CAST(N'1978-05-09' AS Date), N'E', N'(546)3002554', N'servet.akcagunay@gmail.com', N'Akdogan Mah. Akilli Sok. No:17 Istanbul', CAST(N'2021-12-03' AS Date), N'Lise', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (47, 6, N'Çilem', N'Akçay', N'71938737244', CAST(N'1984-05-09' AS Date), N'K', N'(675)7267737', N'cilem.akcay@gmail.com', N'Akfirat Mah. Akincilar Sok. No:68 Istanbul', CAST(N'2018-05-02' AS Date), N'Lise', N'BP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (48, 7, N'Recep Ali Samet', N'Akdogan', N'92688204139', CAST(N'1990-09-08' AS Date), N'E', N'(608)3669976', N'recepalisamet.akdogan@gmail.com', N'Akilli Mah. Akis Sok. No:58 Istanbul', CAST(N'2017-12-11' AS Date), N'Önlisans', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (49, 7, N'Emre Ayberk', N'Akfirat', N'88481002022', CAST(N'1991-10-09' AS Date), N'E', N'(234)2795602', N'emreayberk.akfirat@gmail.com', N'Akincilar Mah. Akkiray Sok. No:80 Istanbul', CAST(N'2018-08-07' AS Date), N'Lise', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (50, 7, N'Kerime Hacer', N'Akilli', N'59151778711', CAST(N'1987-03-03' AS Date), N'K', N'(746)9044940', N'kerimehacer.akilli@gmail.com', N'Akis Mah. Akkoyun Sok. No:92 Istanbul', CAST(N'2018-08-08' AS Date), N'Ömlisans', N'ABN', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (51, 7, N'Ercüment', N'Akincilar', N'61318996288', CAST(N'1988-02-05' AS Date), N'E', N'(925)5390544', N'ercument.akincilar@gmail.com', N'Akkiray Mah. Akküt Sok. No:37 Istanbul', CAST(N'2020-02-02' AS Date), N'Önlisans', N'BP', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (52, 7, N'Iclal', N'Akkoyun', N'30806098427', CAST(N'1990-10-10' AS Date), N'K', N'(942)5014886', N'iclal.akkoyun@gmail.com', N'Aklar Çörekçi Mah. Akoguz Sok. No:98 Istanbul', CAST(N'2021-12-09' AS Date), N'Önlisans', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (53, 7, N'Ahmet', N'Polat', N'77619098484', CAST(N'1991-02-01' AS Date), N'E', N'(306)4867500', N'ahmet.polat@gmail.com', N'Akoguz Mah. Aksan Sok. No:1 Istanbul', CAST(N'2020-02-03' AS Date), N'Önlisans', N'0P', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (54, 7, N'Elif', N'Altas', N'29973288986', CAST(N'1992-12-05' AS Date), N'K', N'(623)7025254', N'elif.altas@gmail.com', N'Altin Mah. Altinöz Sok. No:71 Istanbul', CAST(N'2019-12-12' AS Date), N'Önlisans', N'0P', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (55, 8, N'Elif Dilay', N'Altinkaya', N'58549601972', CAST(N'1991-05-11' AS Date), N'K', N'(997)4100568', N'elifdilay.altinkaya@gmail.com', N'Altunbulak Mah. Aluç Sok. No:36 Istanbul', CAST(N'2017-02-01' AS Date), N'Lisans', N'ABP', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (56, 1, N'Ömer', N'Alparslan', N'14159521326', CAST(N'1989-11-07' AS Date), N'E', N'(955)4612810', N'omer.alparslan@gmail.com', N'Altan Mah. Altay Sok. No:4 Istanbul', CAST(N'2019-12-12' AS Date), N'Yüksek Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (57, 8, N'Büsra', N'Altundal', N'32104964420', CAST(N'1982-12-10' AS Date), N'K', N'(322)3940585', N'busragul.altundal@gmail.com', N'Ala Mah. Ankara Sok. No:88 Istanbul', CAST(N'2021-01-02' AS Date), N'Doktora', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (58, 9, N'Sarper', N'Akis', N'34709264708', CAST(N'1992-03-07' AS Date), N'E', N'(844)5999772', N'sarper.akis@gmail.com', N'Akkoyun Mah. Aklar Çörekçi Sok. No:99 Istanbul', CAST(N'2017-12-12' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (59, 9, N'Berker', N'Yilmaz', N'97642189324', CAST(N'1980-03-02' AS Date), N'E', N'(224)4344088', N'berkeryilmaz@gmail.com', N'Akküt Mah. Akman Sok. No:67 Istanbul', CAST(N'2020-10-10' AS Date), N'Lisans', N'AN', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (60, 10, N'Merve', N'Kartal', N'15816924756', CAST(N'1981-04-01' AS Date), N'K', N'(212)7808529', N'mervekartal@gmail.com', N'Nur Mah. Mecidiye Cad. No:71 Istanbul', CAST(N'2019-10-08' AS Date), N'Lisans', N'AN', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (61, 10, N'Senem', N'Aksevim', N'97746537905', CAST(N'1985-05-05' AS Date), N'K', N'(714)2436353', N'senemaksevim@gmail.com', N'Aksöz Mah. Aktuna Sok. No:25 Istanbul', CAST(N'2019-10-01' AS Date), N'Yüksek Lisans', N'ABN', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (62, 10, N'Yasar', N'Yasamaz', N'45678932987', CAST(N'1986-06-05' AS Date), N'E', N'(554)4612810', N'yasaryasamaz@gmail.com', N'Kirmizi Mah. Yesil Sok. No:4 Istanbul', CAST(N'2017-12-08' AS Date), N'Yüksek Lisans', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (63, 10, N'Murat', N'Ayaz', N'32975827986', CAST(N'1987-07-11' AS Date), N'E', N'(322)3940585', N'murat.ayaz@gmail.com', N'Ayci Mah. Aydogan Yozgat Sok. No:23 Istanbul', CAST(N'2020-12-05' AS Date), N'Lisans', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (64, 11, N'Senem', N'Aksevim', N'97746537905', CAST(N'1988-09-09' AS Date), N'K', N'(714)2436353', N'senemaksevim@gmail.com', N'Aksöz Mah. Aktuna Sok. No:25 Istanbul', CAST(N'2019-10-08' AS Date), N'Lisans', N'AP', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (65, 11, N'Yasar', N'Yasamaz', N'45678932987', CAST(N'1986-10-10' AS Date), N'E', N'(554)4612810', N'yasaryasamaz@gmail.com', N'Kirmizi Mah. Yesil Sok. No:4 Istanbul', CAST(N'2019-12-08' AS Date), N'Lisans', N'AP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (66, 11, N'Kaan', N'Özgür', N'77076682779', CAST(N'1977-11-02' AS Date), N'E', N'(363)4368585', N'kaan.ozgur@gmail.com', N'Ayaz Mah. Aydinlioglu Sok. No:45 Istanbul', CAST(N'2020-10-10' AS Date), N'Lisans', N'0P', 1, 0, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (67, 11, N'Muharrem', N'Ay', N'98745632185', CAST(N'1988-11-01' AS Date), N'E', N'(898)4545698', N'muharrem.ay@gmail.com', N'Ayaz Mah. Günes Cad., Lale Sok., No:45 Istanbul', CAST(N'2021-12-12' AS Date), N'Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (68, 12, N'Feyza', N'Bal', N'52760836226', CAST(N'1980-11-09' AS Date), N'K', N'(377)3542320', N'elif.bal@gmail.com', N'Aysan Mah. Azbay Sok. No:79 Istanbul', CAST(N'2020-08-12' AS Date), N'Lisans', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (69, 12, N'Gizem', N'Belli', N'42027127302', CAST(N'1987-12-02' AS Date), N'K', N'(714)2436353', N'gizembelli@gmail.com', N'Biçaksiz Mah. Bilgeç Sok. No:19 Istanbul', CAST(N'2017-12-12' AS Date), N'Yüksek Lisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (70, 12, N'Özge', N'Demirel', N'93133761192', CAST(N'1978-10-01' AS Date), N'K', N'(452)6875435', N'odemirel@gmail.com', N'Altay Mah. Aldag Sok. No:77 Istanbul', CAST(N'2019-05-01' AS Date), N'Yüksek Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (71, 13, N'Ibrahim', N'Hansu', N'65598880123', CAST(N'1979-08-12' AS Date), N'E', N'(376)4478983', N'burakbalcii@gmail.com', N'Balci Mah. Aygen Sok. No:20 Istanbul', CAST(N'2019-12-08' AS Date), N'Lisans', N'BN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (72, 13, N'Burak', N'Balci', N'32975827986', CAST(N'1981-11-10' AS Date), N'E', N'(636)9535300', N'burakbalcii@gmail.com', N'Atli Mah. Ayci Sok. No:29 Istanbul', CAST(N'2019-08-18' AS Date), N'Yüksek Lisans', N'ABN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (73, 13, N'Selma', N'Ceylan', N'23824355930', CAST(N'1985-05-11' AS Date), N'K', N'(775)5975910', N'selmaceylan@gmail.com', N'Bas Mah. Ögretmen Cad. No:25 Istanbul', CAST(N'2017-06-02' AS Date), N'Yüksek Lisans', N'ABP', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (74, 14, N'Büsra', N'Cüce', N'25960977919', CAST(N'1989-09-12' AS Date), N'K', N'(554)4612810', N'busracuce@gmail.com', N'Çagatay Mah. Çaglayan Sok. No:42 Istanbul', CAST(N'2021-02-12' AS Date), N'Yüksek Lisans', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (75, 14, N'Ali', N'Bas', N'35736941647', CAST(N'1977-01-01' AS Date), N'E', N'(202)4953390', N'alibas@gmail.com', N'Çagan Mah. Çaglar Sok. No:98 Istanbul', CAST(N'2019-10-01' AS Date), N'Yüksek Lisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (76, 14, N'Melek', N'Nur', N'65598880123', CAST(N'1992-09-02' AS Date), N'K', N'(376)4478983', N'meleknur@gmail.com', N'Balci Mah. Aygen Sok. No:20 Istanbul', CAST(N'2017-01-08' AS Date), N'Doktora', N'AN', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (78, 15, N'Nilüfer', N'Kiran', N'10088836408', CAST(N'2000-10-30' AS Date), N'K', N'(676)9297712', N'niluferkiran7@gmail.com', N'Ahmet Mah. Akarcali Sok. No:89 Istanbul', CAST(N'2022-11-07' AS Date), N'Önlisans', N'0N', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (80, 3, N'teasfs', N'asdsa', N'12345678945', CAST(N'2022-12-14' AS Date), N'K', N'01234567894', N'ADAD', N'asdsd', CAST(N'2022-12-14' AS Date), N'saf', N'0P', 1, 1, N'25d55ad283aa400af464c76d713c07ad')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (81, 1, N'TEST', N'test', N'32165498754', CAST(N'2022-12-16' AS Date), N'E', N'32165487980', N'testest', N'', CAST(N'2022-12-16' AS Date), N'test', N'0N', 1, 1, N'6ebe76c9fb411be97b3b0d48b791a7c9')
INSERT [dbo].[Personel] ([PersonelID], [MeslekID], [PersonelAdi], [PersonelSoyadi], [TCKN], [DogumTarihi], [Cinsiyet], [TelefonNo], [Mail], [Adres], [İseGirisTarihi], [EnSonMezuniyetBilgisi], [KanGrubuID], [HastaneID], [PersonelDurum], [Sifre]) VALUES (82, 1, N'wqe', N'asd', N'32165487985', CAST(N'2022-12-16' AS Date), N'K', N'789456123450', N'sad', N'', CAST(N'2022-12-16' AS Date), N'sad', N'ABN', 1, 1, N'd41d8cd98f00b204e9800998ecf8427e')
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinik] ON 

INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (1, N'Çocuk Sagligi ve Hastaligi', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (2, N'Cildiye', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (3, N'Ortopedi ve Travmatoloji', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (4, N'Endokrinoloji ve Metaboliz', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (5, N'Fizik Tedavi ve Rehabilitasyon', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (6, N'Genel Cerrahi', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (7, N'Gögüs Cerrahisi', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (8, N'Göz Sagligi ve Hastaliklari', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (9, N'Iç Hastaliklari', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (10, N'Kadin Hastaliklari ve Dogum', 1)
INSERT [dbo].[Poliklinik] ([PoliklinikID], [PoliklinkAdi], [HastaneID]) VALUES (11, N'Kardiyoloji', 1)
SET IDENTITY_INSERT [dbo].[Poliklinik] OFF
GO
SET IDENTITY_INSERT [dbo].[Randevu] ON 

INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (1, 34, 1, N'Asiri Aglama', N'Kolik', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (2, 20, 1, N'Asi', N'Kizamik Asisi', N'Asi yapildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (3, 48, 1, N'Ates', N'Grip', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (4, 21, 1, N'Kirmizi Benek', N'Kizamik', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (5, 51, 1, N'Agrili Kulak', N'Kabakulak', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (6, 42, 1, N'Öksürük', N'Akut Faranjit', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (7, 32, 1, N'Geceleri altini islatma', N'Tanimlanmamis', N'Idrar Tahlili,Ultrason', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (8, 46, 1, N'Ishal,Ates,Öksürük', N'Covid19', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (9, 3, 2, N'Sivilce', N'Yogun akne gözlemi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (10, 4, 2, N'Ciltte kuruluk', N'Yogun Kuruluk', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (11, 6, 2, N'Sivilce', N'Yogun Akne', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (12, 9, 2, N'Deride kabarma', N'Alerjik Reaksiyon', N'Alerji testi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (13, 10, 2, N'Sigil', N'Genital Sigil', N'HPV testi, Ameliyat için gün verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (14, 13, 2, N'Ben', N'Anormal büyüklükte venüs', N'Cilt kanseri süphesiyle parça alinmasi için gün verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (15, 14, 2, N'Kasinti', N'Ürtiker', N'Alerji testi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (16, 15, 3, N'Kollarda Agri', N'Kireçlenme', N'Fizik Tedavi sevk', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (17, 16, 3, N'Bel Agrisi', N'Bel Fitigi', N'Fizik Tedavi sevk', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (18, 17, 3, N'Kolda yumru', N'Kolda Tanimlanmamis yumru', N'Ameliyat için gün verildi', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (19, 18, 3, N'Dizlerde Agri', N'Romatizma', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (20, 19, 3, N'Bacakta agri', N'Varis', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (21, 20, 3, N'Bacakta Agri', N'Menisküs yirtigi', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (22, 22, 3, N'Düsme', N'Kirik', N'Ameliyata alindi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (23, 47, 3, N'Manisküs yirtigi sebebiyle sevk', N'Artroskopi', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (24, 49, 3, N'Bacak esitsizligi', N'Fonksiyonel esitsizlik', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (25, 50, 3, N'Boy kisaligi', N'', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (26, 52, 3, N'Dizde kireçlenme sebebiyle sevk', N'Dizde Kireçlenme', N'Protez ameliyati günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (27, 53, 3, N'Sevk', N'Obeziteye bagli Dizde Baski', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (28, 54, 3, N'Elde agri', N'Elde kirik tedavisinin yanlis yapilmasi sebebiyle mikrocerrahi gerekli', N'ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (29, 31, 4, N'Halsizlik, hizli kilo kaybi,asiri su tüketimi', N'Diyabet', N'Ilaçla tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (30, 32, 4, N'Asiri Kilo', N'Obezite', N'Diyetisyene sevk, Hormon testleri istendi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (31, 34, 4, N'Parmaklarda el ve ayaklarda büyüme', N'Hipofiz Bozukluklari', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (32, 35, 4, N'Ses inceligi', N'Hormon Dengesizligi', N'Ilaçla Tedavi', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (33, 36, 4, N'Boyunda sislik', N'Guatr', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (34, 37, 4, N'Gebelik disinda memelerden süt gelmesi', N'Prolaktin Dengesizligi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (35, 38, 4, N'Istahsizlik, halsizlik, güçsüzlük,kas güçsüzlügü, kemik agrisi', N'Paratiroid', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (36, 30, 4, N'Halsizlik, hizli kilo kaybi,asiri su tüketimi', N'Diyabet', N'Ilaçla tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (37, 63, 5, N'Skolyoz sebebiyle sevk', N'Skolyoz', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (38, 64, 5, N'FSM sebebiyle sevk', N'Fibromiyalji', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (39, 65, 5, N'MAS sebebiyle sevk', N'Miyofasiyal', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (40, 66, 5, N'Bel fitigi sebebiyle sevk', N'Fitik', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (41, 67, 5, N'Spazm sebebiyle sevk', N'Kas Spazmi', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (42, 60, 5, N'Romatizma sebebiyle sevk', N'Romatizma', N'Tedavi programi olusturuldu', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (43, 33, 6, N'Kemiklerde Agri', N'Osteoporoz', N',Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (44, 43, 7, N'Gögüs agrisi, kalp sesinin azalmasi', N'Perikard Tamponadi', N'Ilaçla tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (45, 45, 7, N'Bas agrisi, bas dönmesi, halsizlik, burun kanamasi', N'Hpiertansiyon', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (46, 55, 8, N'Bulanik Görme', N'Astigmat', N'Gözlük', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (47, 56, 8, N'Uzagi net görememe', N'Miyopi', N'Gözlük', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (48, 57, 8, N'Yakini net görememe', N'Hipermetrop', N'Gözlük', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (49, 59, 8, N'Görmede kararma', N'Katarakt', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (50, 60, 8, N'Çapaklanma', N'Konjoktivit', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (51, 61, 8, N'Gözde agri', N'Glokom', N'Ilaçla tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (52, 62, 8, N'Gözde rahatsizlik, batma hissi, kasinti', N'Blefarit', N'Ilaçla tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (53, 23, 9, N'Öksürük', N'Akut Faranjit', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (54, 24, 9, N'Halsizlik', N'D vitami eksikligi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (55, 25, 9, N'Eklem Agrisi', N'D vitamini eksikligi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (56, 26, 9, N'Öksürük,Halsizlik', N'Covid19', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (57, 27, 9, N'Burun Akintisi, Öksürük', N'Mevsimsel Alerji', N'Ilaçla tedavi, alerji testi için cildiyeye sevk', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (58, 28, 9, N'Vitamin degerlerinin kontrolu', N'Anemi', N'Ilaçla Tedavi', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (59, 29, 9, N'Ishal', N'Tanimlanmamis', N'Crohn süphesiyle genel cerrahiye sevk', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (60, 1, 10, N'Vajinal Akinti', N'Mantar Enfeksiyonu', N'Ilaçla Tedavi, Fitil', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (61, 2, 10, N'Agrili Adet', N'Polikistik Over', N'Ilaçla Tedavi, Dogum Kontrol Hapi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (62, 5, 10, N'Genital Sigil', N'HPV', N'Genel Cerrahiye sevk', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (63, 7, 10, N'Adet Gecikmesi', N'Polikistik Over', N'Ilacla Tedavi,Dogum Kontrol Hapi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (64, 8, 10, N'Gebelik', N'Gebelik 2. ay', N'Folik Asit takviyesi,Ultrosonla kontrol', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (65, 11, 10, N'Gebelik Kontrol', N'Düsük', N'Kürtajla rahmin temizlenmesi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (66, 12, 10, N'Gebelik kontrol', N'Gebelik 8. ay', N'Ultrasonla kontrol, sezeryanla dogum için gün verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (67, 39, 11, N'Gögüs agrisi, gögüste sikisma hissi', N'Aort Darligi', N'Ameliyat günü verildi', 0)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (68, 40, 11, N'Nefes darligi, gögüste agri', N'Mitral Kapak Yetmezligi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (69, 41, 11, N'Kalp çarpintisi, ritim bozuklugu, gögüs agrisi', N'Mitral kapak darligi', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (70, 43, 11, N'Çarpinti', N'Kardiyak Aritmi', N'Ilaçla Tedavi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (71, 44, 11, N'Gögüs Agrisi', N'Iskemik Kalp Hastaligi', N'Ameliyat günü verildi', 1)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (73, 9, 1, N'es', N'sfsd', N'sdfsd', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (74, 29, 1, N'wer', N'erw', N'wtew', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (75, 53, 1, N'wer', N'wer', N'wer', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (76, 28, 1, N're', N'wef', N'gw', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (77, 16, 1, N'sfsdf', N'sdg', N'sdfd', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (78, 17, 13, N'ggr', N'dgfdg', N'dfgfdg', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (79, 3, 5, N'wg', N'sdf', N'gfew', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (80, 23, 12, N'df', N'dsf', N'sdf', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (81, 6, 4, N'df', N'fs', N'fe', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (82, 26, 12, N'e', N'r', N'erw', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (83, 31, 12, N'', N'', N'', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (86, 1, 12, N'', N'', N'', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (87, 76, 3, N'Baş ağrısı', N'Travma', N'Zanax', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (88, 76, 21, N'Yok', N'Delirmiş', N'Zanax', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (89, 76, 13, N'asd', N'asfdasd', N'asfasdas', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (90, 76, 14, N'asd', N'fasd', N'asfasdasf', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (91, 76, 5, N'das', N'asd', N'asfsadas', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (92, 76, 15, N'Test123', N'Deneme123', N'ASD1123', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (93, 76, 13, N'Test321', N'312Test', N'asdf', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (94, 76, 15, N'ASD123', N'ASD123412', N'AASD123', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (95, 76, 6, N'123asd123', N'321dsa132', N'asdfafs', NULL)
INSERT [dbo].[Randevu] ([RandevuID], [HastaID], [DoktorID], [Sikayet], [Teshis], [Tedavi], [RandevuDurum]) VALUES (96, 76, 12, N'123asd', N'123124asfdas', N'12312412asfasasd', NULL)
SET IDENTITY_INSERT [dbo].[Randevu] OFF
GO
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (1, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (2, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (3, CAST(N'2022-11-03' AS Date), CAST(N'09:15:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (4, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (5, CAST(N'2022-11-03' AS Date), CAST(N'09:45:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (6, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (7, CAST(N'2022-11-03' AS Date), CAST(N'10:15:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (8, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (9, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (10, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (11, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (12, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (13, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (14, CAST(N'2022-11-03' AS Date), CAST(N'11:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (15, CAST(N'2022-11-03' AS Date), CAST(N'11:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (16, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (17, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (18, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (19, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (20, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (21, CAST(N'2022-11-03' AS Date), CAST(N'11:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (22, CAST(N'2022-11-03' AS Date), CAST(N'11:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (23, CAST(N'2022-11-03' AS Date), CAST(N'12:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (24, CAST(N'2022-11-03' AS Date), CAST(N'12:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (25, CAST(N'2022-11-03' AS Date), CAST(N'13:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (26, CAST(N'2022-11-03' AS Date), CAST(N'14:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (27, CAST(N'2022-11-03' AS Date), CAST(N'14:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (28, CAST(N'2022-11-03' AS Date), CAST(N'15:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (29, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (30, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (31, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (32, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (33, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (34, CAST(N'2022-11-03' AS Date), CAST(N'11:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (35, CAST(N'2022-11-03' AS Date), CAST(N'11:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (36, CAST(N'2022-11-03' AS Date), CAST(N'12:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (37, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (38, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (39, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (40, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (41, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (42, CAST(N'2022-11-03' AS Date), CAST(N'11:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (43, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (44, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (45, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (46, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (47, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (48, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (49, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (50, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (51, CAST(N'2022-11-03' AS Date), CAST(N'11:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (52, CAST(N'2022-11-03' AS Date), CAST(N'11:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (53, CAST(N'2022-11-03' AS Date), CAST(N'12:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (54, CAST(N'2022-11-03' AS Date), CAST(N'12:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (55, CAST(N'2022-03-11' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (56, CAST(N'2022-03-11' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (57, CAST(N'2022-11-03' AS Date), CAST(N'15:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (58, CAST(N'2022-11-03' AS Date), CAST(N'15:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (59, CAST(N'2022-11-03' AS Date), CAST(N'16:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (60, CAST(N'2022-11-03' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (61, CAST(N'2022-11-03' AS Date), CAST(N'09:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (62, CAST(N'2022-11-03' AS Date), CAST(N'09:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (63, CAST(N'2022-11-03' AS Date), CAST(N'10:00:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (64, CAST(N'2022-11-03' AS Date), CAST(N'10:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (65, CAST(N'2022-03-11' AS Date), CAST(N'08:30:00' AS Time), N'E', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (95, CAST(N'2022-12-16' AS Date), CAST(N'00:25:50' AS Time), N'E', CAST(N'2022-12-16' AS Date), 1)
INSERT [dbo].[RandevuDetay] ([RandevuID], [RandevuTarihi], [RandevuSaati], [HastaGeldimi], [YeniRandevuTarihi], [RandevuDetayDurum]) VALUES (96, CAST(N'2022-12-16' AS Date), CAST(N'00:36:42' AS Time), N'E', CAST(N'2022-12-16' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[ReceteDetay] ON 

INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (1, 1, 1, N'1x1', N'Oral', 33, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (2, 3, 1, N'1x2', N'Oral', 34, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (3, 4, 1, N'1x2', N'Oral', 34, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (4, 5, 1, N'1x2', N'Oral', 34, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (5, 6, 1, N'1x2', N'Oral', 34, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (6, 8, 1, N'1x2', N'Oral', 34, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (7, 9, 1, N'1x2', N'Oral', 24, 0)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (8, 10, 1, N'1x3', N'Krem', 27, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (9, 11, 1, N'1x2', N'Oral', 24, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (10, 19, 1, N'1x2', N'Oral', 35, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (11, 29, 1, N'1x2', N'Enj', 23, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (12, 31, 1, N'1x2', N'Oral', 8, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (13, 32, 1, N'Haftada bir', N'Enj', 11, 0)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (14, 33, 1, N'1x2', N'Oral', 31, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (15, 34, 1, N'15 günde bir', N'Enj', 11, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (16, 35, 1, N'1x2', N'Oral', 5, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (17, 36, 1, N'1x3', N'Oral', 16, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (18, 43, 1, N'1x2', N'Oral', 1, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (19, 44, 1, N'1x2', N'Oral', 19, 0)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (20, 45, 1, N'1x3', N'Oral', 21, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (21, 50, 1, N'1x3', N'Damla', 26, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (22, 51, 1, N'1x3', N'Damla', 26, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (23, 52, 1, N'1x3', N'Damla', 26, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (24, 53, 1, N'1', N'Topikal', 2, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (25, 54, 1, N'1x2', N'Oral', 5, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (26, 55, 1, N'1x2', N'Oral', 6, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (27, 56, 1, N'1x1', N'Enj', 7, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (28, 57, 1, N'1x2', N'Oral', 8, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (29, 58, 1, N'1x1', N'Toz', 9, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (30, 60, 1, N'Gün Asiri', N'Fitil', 28, 0)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (31, 61, 1, N'1x1', N'Oral', 30, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (32, 63, 1, N'1x1', N'Oral', 30, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (33, 68, 1, N'1x1', N'Oral', 31, 1)
INSERT [dbo].[ReceteDetay] ([ReceteID], [RandevuID], [IlacAdet], [IlacDozu], [KullanımSekli], [BarkodNo], [ReceteDetayDurum]) VALUES (34, 70, 1, N'1x1', N'Oral', 31, 1)
SET IDENTITY_INSERT [dbo].[ReceteDetay] OFF
GO
SET IDENTITY_INSERT [dbo].[SifrelerVeHashler] ON 

INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (5, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 1)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (6, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 2)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (7, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 3)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (8, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 4)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (9, N'159753**', N'17171f36273b3c032d6bec9a0de22701', 5)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (10, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 6)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (11, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 7)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (12, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 8)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (13, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 9)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (14, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 10)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (15, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 11)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (16, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 12)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (17, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 13)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (18, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 14)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (19, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 15)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (20, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 16)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (21, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 17)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (22, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 18)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (23, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 19)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (24, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 20)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (25, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 21)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (26, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 22)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (27, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 23)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (28, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 24)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (29, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 25)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (30, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 26)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (31, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 27)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (32, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 28)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (33, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 29)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (34, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 30)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (35, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 31)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (36, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 32)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (37, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 33)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (38, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 34)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (39, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 35)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (40, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 36)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (41, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 37)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (42, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 38)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (43, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 39)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (44, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 40)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (45, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 41)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (46, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 42)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (47, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 43)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (48, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 44)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (49, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 45)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (50, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 46)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (51, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 47)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (52, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 48)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (53, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 49)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (54, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 50)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (55, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 51)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (56, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 52)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (57, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 53)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (58, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 54)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (59, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 55)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (60, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 56)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (61, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 57)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (62, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 58)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (63, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 59)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (64, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 60)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (65, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 61)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (66, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 62)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (67, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 63)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (68, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 64)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (69, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 65)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (70, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 66)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (71, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 67)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (72, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 68)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (73, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 69)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (74, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 70)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (75, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 71)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (76, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 72)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (77, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 73)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (78, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 74)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (79, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 75)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (80, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 76)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (81, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 78)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (82, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 80)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (83, N'987654321', N'6ebe76c9fb411be97b3b0d48b791a7c9', 81)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (84, N'', N'd41d8cd98f00b204e9800998ecf8427e', 82)
INSERT [dbo].[SifrelerVeHashler] ([ID], [Sifre], [Hash], [PersonelID]) VALUES (85, N'12345678', N'25d55ad283aa400af464c76d713c07ad', 80)
SET IDENTITY_INSERT [dbo].[SifrelerVeHashler] OFF
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK__Doktorlar__Perso__45F365D3] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK__Doktorlar__Perso__45F365D3]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD FOREIGN KEY([PoliklinikID])
REFERENCES [dbo].[Poliklinik] ([PoliklinikID])
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD FOREIGN KEY([Cinsiyet])
REFERENCES [dbo].[Cinsiyet] ([CinsiyetID])
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD FOREIGN KEY([HastaGecmisiID])
REFERENCES [dbo].[HastaGecmisi] ([HastaGecmisiID])
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD FOREIGN KEY([KanGrubuID])
REFERENCES [dbo].[KanGrubu] ([KanGrubuID])
GO
ALTER TABLE [dbo].[Izinler]  WITH CHECK ADD  CONSTRAINT [FK__Izinler__Persone__440B1D61] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Izinler] CHECK CONSTRAINT [FK__Izinler__Persone__440B1D61]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK__Personel__Cinsiy__412EB0B6] FOREIGN KEY([Cinsiyet])
REFERENCES [dbo].[Cinsiyet] ([CinsiyetID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK__Personel__Cinsiy__412EB0B6]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK__Personel__Hastan__4316F928] FOREIGN KEY([HastaneID])
REFERENCES [dbo].[HastaneBilgi] ([HastaneID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK__Personel__Hastan__4316F928]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK__Personel__KanGru__4222D4EF] FOREIGN KEY([KanGrubuID])
REFERENCES [dbo].[KanGrubu] ([KanGrubuID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK__Personel__KanGru__4222D4EF]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK__Personel__Meslek__403A8C7D] FOREIGN KEY([MeslekID])
REFERENCES [dbo].[Meslek] ([MeslekID])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK__Personel__Meslek__403A8C7D]
GO
ALTER TABLE [dbo].[Poliklinik]  WITH CHECK ADD FOREIGN KEY([HastaneID])
REFERENCES [dbo].[HastaneBilgi] ([HastaneID])
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD FOREIGN KEY([DoktorID])
REFERENCES [dbo].[Doktorlar] ([DoktorID])
GO
ALTER TABLE [dbo].[Randevu]  WITH CHECK ADD FOREIGN KEY([HastaID])
REFERENCES [dbo].[Hasta] ([HastaID])
GO
ALTER TABLE [dbo].[RandevuDetay]  WITH CHECK ADD  CONSTRAINT [FK__RandevuDe__Rande__3E52440B] FOREIGN KEY([RandevuID])
REFERENCES [dbo].[Randevu] ([RandevuID])
GO
ALTER TABLE [dbo].[RandevuDetay] CHECK CONSTRAINT [FK__RandevuDe__Rande__3E52440B]
GO
ALTER TABLE [dbo].[ReceteDetay]  WITH CHECK ADD FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Ilaclar] ([BarkodID])
GO
ALTER TABLE [dbo].[ReceteDetay]  WITH CHECK ADD FOREIGN KEY([RandevuID])
REFERENCES [dbo].[Randevu] ([RandevuID])
GO
ALTER TABLE [dbo].[Hasta]  WITH CHECK ADD CHECK  ((len([TCKN])=(11)))
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [CK__Personel__TCKN__2E1BDC42] CHECK  ((len([TCKN])=(11)))
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [CK__Personel__TCKN__2E1BDC42]
GO
USE [master]
GO
ALTER DATABASE [HastaneOtomasyon] SET  READ_WRITE 
GO
