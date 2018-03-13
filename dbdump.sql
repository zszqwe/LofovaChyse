USE [master]
GO
/****** Object:  Database [Knihovna]    Script Date: 13.03.2018 12:30:26 ******/
CREATE DATABASE [Knihovna]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Knihovna', FILENAME = N'D:\Misc\MSSQL14.MSSQLSERVER\MSSQL\DATA\Knihovna.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Knihovna_log', FILENAME = N'D:\Misc\MSSQL14.MSSQLSERVER\MSSQL\DATA\Knihovna_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Knihovna] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Knihovna].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Knihovna] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Knihovna] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Knihovna] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Knihovna] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Knihovna] SET ARITHABORT OFF 
GO
ALTER DATABASE [Knihovna] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Knihovna] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Knihovna] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Knihovna] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Knihovna] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Knihovna] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Knihovna] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Knihovna] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Knihovna] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Knihovna] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Knihovna] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Knihovna] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Knihovna] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Knihovna] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Knihovna] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Knihovna] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Knihovna] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Knihovna] SET RECOVERY FULL 
GO
ALTER DATABASE [Knihovna] SET  MULTI_USER 
GO
ALTER DATABASE [Knihovna] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Knihovna] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Knihovna] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Knihovna] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Knihovna] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Knihovna', N'ON'
GO
ALTER DATABASE [Knihovna] SET QUERY_STORE = OFF
GO
USE [Knihovna]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Knihovna]
GO
/****** Object:  User [DESKTOP-8RFQNAK\lof]    Script Date: 13.03.2018 12:30:26 ******/
CREATE USER [DESKTOP-8RFQNAK\lof] FOR LOGIN [DESKTOP-8RFQNAK\lof] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[book]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[author] [varchar](200) NOT NULL,
	[publishedYear] [int] NOT NULL,
	[description] [varchar](max) NULL,
	[imageName] [varchar](200) NULL,
	[category_id] [int] NOT NULL,
	[kategorie_id] [int] NOT NULL,
	[vlastnik_id] [int] NOT NULL,
	[version] [float] NULL,
	[date] [datetime] NULL,
	[isPayed] [bit] NULL,
	[unlockPrice] [int] NULL,
	[minimalLevel] [int] NULL,
	[sekce_id] [int] NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_category]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_book_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_odznaky]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_odznaky](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NOT NULL,
	[odznak_id] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_book_odznaky] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_odznaky_archetyp]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_odznaky_archetyp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [varchar](5000) NOT NULL,
	[image] [varchar](5000) NOT NULL,
	[name] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_payment]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[post_id] [int] NOT NULL,
	[dateUnlocked] [datetime2](7) NOT NULL,
	[isPreview] [bit] NOT NULL,
 CONSTRAINT [PK_book_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_sekce]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_sekce](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[parent_id] [int] NULL,
	[image] [varchar](500) NULL,
	[renderPriority] [int] NULL,
	[debugName] [varchar](500) NULL,
	[restrikce] [int] NULL,
 CONSTRAINT [PK_book_sekce] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_kategorie]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_kategorie](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](500) NOT NULL,
	[cat_description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_knihovna_kategorie] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_komentare]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_komentare](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_content] [varchar](max) NOT NULL,
	[post_date] [datetime] NOT NULL,
	[post_topic] [int] NOT NULL,
	[post_by] [int] NOT NULL,
	[post_reply] [int] NULL,
 CONSTRAINT [PK_knihovna_komentare] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_komentare_palce]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_komentare_palce](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[komentar_id] [int] NOT NULL,
	[value] [int] NOT NULL,
 CONSTRAINT [PK_knihovna_komentare_palce] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_notifikace]    Script Date: 13.03.2018 12:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_notifikace](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_from] [int] NOT NULL,
	[user_to] [int] NOT NULL,
	[text] [varchar](500) NOT NULL,
	[displayed] [bit] NOT NULL,
	[forceType] [int] NOT NULL,
	[rewardType] [int] NOT NULL,
	[dateSent] [datetime2](7) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_knihovna_notifikace] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_novinky]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_novinky](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[text] [varchar](1000) NOT NULL,
	[userId] [int] NOT NULL,
	[type] [int] NOT NULL,
	[typeSub] [int] NOT NULL,
	[version] [float] NOT NULL,
	[priority] [int] NOT NULL,
	[sticky] [bit] NOT NULL,
	[refId] [int] NOT NULL,
	[action] [varchar](500) NULL,
	[controller] [varchar](500) NULL,
 CONSTRAINT [PK_knihovna_novinky] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_odznaky]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_odznaky](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[odznakId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[venovani] [varchar](500) NOT NULL,
	[text] [varchar](1000) NOT NULL,
	[image] [varchar](500) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_knihovna_odznaky] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_odznaky_archetyp]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_odznaky_archetyp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[odznakId] [int] NOT NULL,
	[text] [varchar](500) NOT NULL,
	[image] [varchar](500) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_knihovna_odznaky_archetyp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_palce]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_palce](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[value] [int] NOT NULL,
 CONSTRAINT [PK_knihovna_palce] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_pratele]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_pratele](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_from] [int] NOT NULL,
	[user_to] [int] NOT NULL,
	[accepted] [bit] NOT NULL,
	[date_sent] [datetime2](7) NOT NULL,
	[date_accepted] [datetime2](7) NOT NULL,
	[declined] [bit] NOT NULL,
	[date_declined] [datetime2](7) NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_knihovna_pratele] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_role]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[identificator] [varchar](50) NOT NULL,
	[role_description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_knihovna_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_user]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[surname] [varchar](100) NOT NULL,
	[login] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
	[welcomeText] [varchar](800) NULL,
	[authLevel] [int] NULL,
	[exp] [int] NULL,
	[joinedDate] [datetime2](7) NULL,
	[postsNumber] [int] NULL,
	[commentsNumber] [int] NULL,
	[likesNumber] [int] NULL,
	[reputation] [int] NULL,
	[money] [float] NULL,
	[image] [varchar](200) NULL,
	[needJob] [int] NULL,
 CONSTRAINT [PK_knihovna_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_wall]    Script Date: 13.03.2018 12:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_wall](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postText] [varchar](1000) NOT NULL,
	[postDate] [datetime] NOT NULL,
	[postOwner] [int] NOT NULL,
	[version] [float] NOT NULL,
 CONSTRAINT [PK_knihovna_wall] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (2, N'Zaboc update', N'dsa', 45, N'<p>Dnes při&scaron;la řada na majoritn&iacute; aktualizaci Zaboců. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lně př&iacute;jemněj&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;če lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;ře a rozjede se směrem k hr&aacute;či. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zuřivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Při vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane neř&iacute;zen&aacute; bomba, kter&aacute; může ničit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konečně naraz&iacute; do nějak&eacute;ho bloku, přejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje polovičn&iacute; rychlost&iacute; a nemůže zač&iacute;t spin &uacute;tok.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', NULL, 5, 2, 2, 1.9000000000000001, CAST(N'2018-02-28T11:04:26.897' AS DateTime), 1, 10, 0, 3)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (3, N'Zakuti v železe', N'Žamboch', 2010, N'<p>vvv</p>', NULL, 5, 2, 2, 0.1, CAST(N'2018-01-29T12:10:36.853' AS DateTime), 0, 0, 0, 12)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (6, N'dasd', N'dsa', 40, N'<p>Tento text by neměl obsahovat v&iacute;ce než 8 000 znaků. Možn&aacute;.</p>', NULL, 5, 2, 2, 1.2000000000000002, CAST(N'2018-01-29T12:17:14.940' AS DateTime), 0, 0, 0, 3)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (7, N'Přidaná kniha', N'Mario', 2010, N'<p>Popis přidan&eacute; knihy</p>', NULL, 5, 2, 2, 1, CAST(N'2018-01-25T23:15:07.593' AS DateTime), 0, 0, 0, 3)
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[book_category] ON 

INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (5, N'Informatika', N'Popis')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (6, N'Vesmír', N'Knihy o vesmíru')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (7, N'Chemie', N'Chemická literatura')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (8, N'Biologie', N'Nějaká rakovina')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (9, N'Učebnice', N'Literatura o hovně')
SET IDENTITY_INSERT [dbo].[book_category] OFF
SET IDENTITY_INSERT [dbo].[book_odznaky] ON 

INSERT [dbo].[book_odznaky] ([id], [book_id], [odznak_id], [date]) VALUES (1, 2, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[book_odznaky] OFF
SET IDENTITY_INSERT [dbo].[book_odznaky_archetyp] ON 

INSERT [dbo].[book_odznaky_archetyp] ([id], [text], [image], [name]) VALUES (1, N'<p>Oceněn&iacute; za kvalitn&iacute; př&iacute;spěvek s vysokou informačn&iacute; hodnotou.</p>', N'8db53440-625e-4408-93f8-500a3163b489.png', N'Cena moderátora')
SET IDENTITY_INSERT [dbo].[book_odznaky_archetyp] OFF
SET IDENTITY_INSERT [dbo].[book_payment] ON 

INSERT [dbo].[book_payment] ([id], [user_id], [post_id], [dateUnlocked], [isPreview]) VALUES (7, 2, 2, CAST(N'2018-03-12T21:16:41.2865066' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[book_payment] OFF
SET IDENTITY_INSERT [dbo].[book_sekce] ON 

INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (1, N'Herní novinky', NULL, NULL, 0, N'Herní novinky', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (2, N'<h1>Recenze</h1>
<p>M&iacute;sto pro v&scaron;echny hern&iacute; nad&scaron;ence. Postřehy, z&aacute;žitky a mnoho dal&scaron;&iacute;ho!</p>', 1, N'd652ea8d-7221-4dbf-a495-f959001ce376.png', 0, N'Recenze', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (3, N'<h1>Tvorba</h1>
<p>Poděl se o svoje v&yacute;tvory s ostatn&iacute;mi nad&scaron;enci!</p>', 1, N'ab3723a6-0280-4228-a3ff-c55e2532832d.png', 1, N'Tvorba', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (4, N'Ryanovy recenze [složka]', 2, NULL, 0, N'Ryanovy recenze', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (6, N'Programování', NULL, NULL, 0, N'Programování', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (7, N'C#', 6, NULL, 0, N'C#', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (8, N'Základy', 7, NULL, 0, N'Základy', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (9, N'Oop', 7, NULL, 0, N'Oop', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (10, N'Asp', 7, NULL, 0, N'Asp', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (11, N'Lofova akademie', 8, NULL, 0, N'Lofova akademie', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (12, N'Cvičení', 11, NULL, 0, N'Cvičení', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (13, N'Lekce', 11, NULL, 0, N'Lekce', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (14, N'<h1><span style="color: #000000;">V&yacute;voj Ch&yacute;&scaron;e&nbsp;</span><img style="font-size: 14px;" src="https://s18.postimg.org/f27y6qx89/16507-200.png" alt="" width="33" height="33" /></h1>
<p><span style="color: #000000;">Intern&iacute; sekce viditeln&aacute; pouze <strong>mod+</strong> uživatelům.</span></p>', 1, N'bb00c648-809b-410c-978d-5ea1a3034556.png', 0, N'Interní vývoj', 1)
SET IDENTITY_INSERT [dbo].[book_sekce] OFF
SET IDENTITY_INSERT [dbo].[knihovna_kategorie] ON 

INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (2, N'Novinky', N'Novinky o vývoji hry')
INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (3, N'Oznámení fóra', N'Důležité věci')
INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (4, N'Dedikované fórum o smradlavosti PHP', N'UNIVERSE PLS')
SET IDENTITY_INSERT [dbo].[knihovna_kategorie] OFF
SET IDENTITY_INSERT [dbo].[knihovna_komentare] ON 

INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (49, N'<p>Ani te%d</p>', CAST(N'2018-02-25T11:19:40.983' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (53, N'<p>Odpověď</p>', CAST(N'2018-02-26T16:14:13.487' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (54, N'<p>Fuck off</p>', CAST(N'2018-02-26T17:27:32.817' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (55, N'<p>Test</p>', CAST(N'2018-02-26T20:38:57.973' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (56, N'<p>Test</p>', CAST(N'2018-02-26T20:39:04.200' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (59, N'<p>Testd sad sa das</p>', CAST(N'2018-02-26T20:56:37.873' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (60, N'<p>Test</p>', CAST(N'2018-02-26T20:56:45.070' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (61, N'<p>Test EDIT</p>', CAST(N'2018-02-26T20:57:23.790' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (62, N'<p>Taky se zapoj&iacute;m do diskuze</p>', CAST(N'2018-02-27T10:32:06.693' AS DateTime), 3, 1, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (63, N'<p>Koment&aacute;ř</p>', CAST(N'2018-02-27T12:35:18.100' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (64, N'<p>Shit</p>', CAST(N'2018-02-27T12:36:43.240' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (65, N'<p>Jej, nov&yacute; koment&aacute;ř</p>', CAST(N'2018-02-27T12:38:47.570' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (66, N'<p>Sample koment&aacute;ř</p>', CAST(N'2018-03-02T14:58:36.920' AS DateTime), 7, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (67, N'<p>Tohle je opravdu hezk&yacute; devlog! Tě&scaron;&iacute;m se na hru.</p>', CAST(N'2018-03-02T15:00:21.837' AS DateTime), 2, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (68, N'<p><strong>Super!</strong> Tě&scaron;&iacute;m se na pokračov&aacute;n&iacute;.</p>', CAST(N'2018-03-02T15:02:14.967' AS DateTime), 2, 1, 67)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (69, N'<p>M&aacute;me spoustu novinek, brzo přijde nov&yacute; update!</p>', CAST(N'2018-03-11T10:40:34.920' AS DateTime), 2, 2, -1)
SET IDENTITY_INSERT [dbo].[knihovna_komentare] OFF
SET IDENTITY_INSERT [dbo].[knihovna_komentare_palce] ON 

INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (181, 2, 62, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (182, 2, 63, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (183, 2, 64, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (184, 2, 59, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (185, 2, 55, 3)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (186, 2, 56, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (187, 2, 53, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (188, 2, 49, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (189, 2, 60, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (190, 2, 61, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (191, 2, 54, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (192, 2, 67, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (193, 1, 69, 0)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (194, 2, 68, 0)
SET IDENTITY_INSERT [dbo].[knihovna_komentare_palce] OFF
SET IDENTITY_INSERT [dbo].[knihovna_novinky] ON 

INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (9, CAST(N'2018-01-27T13:44:36.4515828' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zakuti v železe', 2, 3, 0, 1, 0, 0, 3, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (10, CAST(N'2018-01-28T16:01:21.1914016' AS DateTime2), N'Uživatel tz se zaregistroval', 9, 2, 0, 1, 0, 0, 9, N'Index', N'Profile')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (11, CAST(N'2018-02-27T12:38:49.8776862' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zakuti v železe', 2, 3, 0, 1, 0, 0, 3, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (12, CAST(N'2018-03-02T14:58:37.1504790' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Přidaná kniha', 2, 3, 0, 1, 0, 0, 7, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (13, CAST(N'2018-03-02T15:00:21.8450380' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (14, CAST(N'2018-03-02T15:02:14.9887358' AS DateTime2), N'Uživatel Matěj přidal komentář k příspěvku Zaboc update', 1, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (15, CAST(N'2018-03-11T10:40:35.1590043' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
SET IDENTITY_INSERT [dbo].[knihovna_novinky] OFF
SET IDENTITY_INSERT [dbo].[knihovna_odznaky] ON 

INSERT [dbo].[knihovna_odznaky] ([id], [odznakId], [userId], [date], [venovani], [text], [image], [name]) VALUES (3, 3, 2, CAST(N'2018-01-23T21:39:41.1466553' AS DateTime2), N'', N'<p>D&iacute;ky tobě je n&aacute;&scaron; server lep&scaron;&iacute;!</p>', N'17049746-bf6e-4200-a367-571c7aa89703.png', N'Pilíř komunity')
SET IDENTITY_INSERT [dbo].[knihovna_odznaky] OFF
SET IDENTITY_INSERT [dbo].[knihovna_odznaky_archetyp] ON 

INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (3, 2, N'<p>D&iacute;ky tobě je n&aacute;&scaron; server lep&scaron;&iacute;!</p>', N'17049746-bf6e-4200-a367-571c7aa89703.png', N'Pilíř komunity')
INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (4, 4, N'<p>Gratulujeme, jsi ověřen&yacute; uživatel!</p>', N'52c6bfe6-9e38-40f9-ae33-8698f1bcc61b.png', N'Ověřený uživatel')
INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (5, 2, N'<p>Oceněn&iacute; za kvalitn&iacute; př&iacute;spěvek.&nbsp;</p>', N'fd6bdd4e-75e8-401f-91a1-5634779fde88.png', N'Cena moderátora')
SET IDENTITY_INSERT [dbo].[knihovna_odznaky_archetyp] OFF
SET IDENTITY_INSERT [dbo].[knihovna_palce] ON 

INSERT [dbo].[knihovna_palce] ([id], [user_id], [book_id], [value]) VALUES (160, 2, 4, 1)
INSERT [dbo].[knihovna_palce] ([id], [user_id], [book_id], [value]) VALUES (192, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[knihovna_palce] OFF
SET IDENTITY_INSERT [dbo].[knihovna_pratele] ON 

INSERT [dbo].[knihovna_pratele] ([id], [user_from], [user_to], [accepted], [date_sent], [date_accepted], [declined], [date_declined], [type]) VALUES (4, 2, 1, 1, CAST(N'2018-03-12T21:12:09.0251975' AS DateTime2), CAST(N'2018-03-12T21:12:44.1584662' AS DateTime2), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[knihovna_pratele] OFF
SET IDENTITY_INSERT [dbo].[knihovna_role] ON 

INSERT [dbo].[knihovna_role] ([role_id], [identificator], [role_description]) VALUES (1, N'knihovnik', N'Admin')
INSERT [dbo].[knihovna_role] ([role_id], [identificator], [role_description]) VALUES (2, N'ctenar', N'Uživatel')
SET IDENTITY_INSERT [dbo].[knihovna_role] OFF
SET IDENTITY_INSERT [dbo].[knihovna_user] ON 

INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [money], [image], [needJob]) VALUES (1, N'Matěj', N'Štágl', N'uzivatel', N'uzivatel', 2, NULL, 0, 10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 4, 0.3999999999999993, N'7fcc234a-1f14-44d8-8d33-f1ab52c24292.png', 0)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [money], [image], [needJob]) VALUES (2, N'Standa', N'Noob', N'admin', N'admin', 1, N'<pre class="language-csharp"><code>class lof : superhuman
{
  var age = 19;
  var skills = ["Programming", "Game developement", "Love machine"];
}</code></pre>
<p>&nbsp;</p>
<p>Jsem autor zdej&scaron;&iacute;ho port&aacute;lu, nad&scaron;en&yacute; v&yacute;voj&aacute;ř. Miluju v&scaron;echno okolo IT, heur&eacute;ka moment, kvalitn&iacute; hudbu (od metalu až po černo&scaron;sk&eacute; blues). Pevně veř&iacute;m, že si už&iacute;v&aacute;te svůj pobyt na na&scaron;em f&oacute;ru!</p>
<p>&nbsp;</p>
<p><img src="https://s18.postimg.org/o6rgayoxl/free_kitten_lineart_psd_revised_by_mako_zune-d3k7jtw.png" alt="" width="456" height="405" /></p>', 0, 42, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 62, 29.300000000000004, N'7975b454-fc18-47c0-9b08-1c9ad7a0ea1d.png', 2)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [money], [image], [needJob]) VALUES (6, N'user', N'', N'user', N'user', 2, N'', 0, 0, CAST(N'2018-01-26T23:47:56.4677705' AS DateTime2), 0, 0, 0, 0, 0, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [money], [image], [needJob]) VALUES (8, N'user2', N'', N'user2', N'heslo', 2, N'', 0, 0, CAST(N'2018-01-27T00:37:05.5441422' AS DateTime2), 0, 0, 0, 0, 0, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [money], [image], [needJob]) VALUES (9, N'tz', N'', N'tz', N'tz', 2, N'', 0, 0, CAST(N'2018-01-28T16:01:21.0826117' AS DateTime2), 0, 0, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[knihovna_user] OFF
SET IDENTITY_INSERT [dbo].[knihovna_wall] ON 

INSERT [dbo].[knihovna_wall] ([id], [postText], [postDate], [postOwner], [version]) VALUES (2, N'<p>Ahoj!&nbsp;</p>', CAST(N'2018-01-20T12:03:36.000' AS DateTime), 2, 1)
INSERT [dbo].[knihovna_wall] ([id], [postText], [postDate], [postOwner], [version]) VALUES (3, N'<pre class="language-csharp"><code>// Fork bomb: 
:(){ :|:&amp; };: </code></pre>', CAST(N'2018-01-20T13:27:48.000' AS DateTime), 2, 1)
INSERT [dbo].[knihovna_wall] ([id], [postText], [postDate], [postOwner], [version]) VALUES (4, N'<p>Test</p>', CAST(N'2018-01-20T13:32:26.000' AS DateTime), 2, 1)
INSERT [dbo].[knihovna_wall] ([id], [postText], [postDate], [postOwner], [version]) VALUES (5, N'<p>#FeelingOld</p>
<p><iframe src="//www.youtube.com/embed/6NXnxTNIWkc" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>', CAST(N'2018-01-20T13:32:29.000' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[knihovna_wall] OFF
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_book_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[book_category] ([id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_book_category]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_knihovna_kategorie] FOREIGN KEY([kategorie_id])
REFERENCES [dbo].[knihovna_kategorie] ([cat_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_knihovna_kategorie]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_knihovna_user] FOREIGN KEY([vlastnik_id])
REFERENCES [dbo].[knihovna_user] ([user_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_knihovna_user]
GO
ALTER TABLE [dbo].[knihovna_komentare]  WITH CHECK ADD  CONSTRAINT [FK_knihovna_komentare_knihovna_user] FOREIGN KEY([post_by])
REFERENCES [dbo].[knihovna_user] ([user_id])
GO
ALTER TABLE [dbo].[knihovna_komentare] CHECK CONSTRAINT [FK_knihovna_komentare_knihovna_user]
GO
ALTER TABLE [dbo].[knihovna_user]  WITH CHECK ADD  CONSTRAINT [FK_knihovna_user_knihovna_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[knihovna_role] ([role_id])
GO
ALTER TABLE [dbo].[knihovna_user] CHECK CONSTRAINT [FK_knihovna_user_knihovna_role]
GO
ALTER TABLE [dbo].[knihovna_wall]  WITH CHECK ADD  CONSTRAINT [FK_knihovna_wall_knihovna_user] FOREIGN KEY([postOwner])
REFERENCES [dbo].[knihovna_user] ([user_id])
GO
ALTER TABLE [dbo].[knihovna_wall] CHECK CONSTRAINT [FK_knihovna_wall_knihovna_user]
GO
USE [master]
GO
ALTER DATABASE [Knihovna] SET  READ_WRITE 
GO
