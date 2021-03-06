USE [KnihovnaTest]
GO
/****** Object:  Table [dbo].[book]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_category]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_odznaky]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_odznaky_archetyp]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_payment]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_sekce]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[book_version]    Script Date: 25.07.2018 7:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [varchar](max) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[changedBy] [int] NOT NULL,
	[version] [float] NOT NULL,
	[postId] [int] NOT NULL,
	[sumText] [varchar](500) NOT NULL,
	[isSuggestion] [bit] NOT NULL,
	[isApproved] [bit] NOT NULL,
 CONSTRAINT [PK_book_version] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat_zpravy]    Script Date: 25.07.2018 7:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_zpravy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [varchar](max) NOT NULL,
	[userFrom] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_chat_zpravy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_achievementy]    Script Date: 25.07.2018 7:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_achievementy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[image] [varchar](500) NOT NULL,
 CONSTRAINT [PK_knihovna_achievementy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_kategorie]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[knihovna_komentare]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[knihovna_komentare_palce]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[knihovna_notifikace]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[knihovna_novinky]    Script Date: 25.07.2018 7:52:43 ******/
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
/****** Object:  Table [dbo].[knihovna_odznaky]    Script Date: 25.07.2018 7:52:44 ******/
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
/****** Object:  Table [dbo].[knihovna_odznaky_archetyp]    Script Date: 25.07.2018 7:52:44 ******/
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
/****** Object:  Table [dbo].[knihovna_palce]    Script Date: 25.07.2018 7:52:44 ******/
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
/****** Object:  Table [dbo].[knihovna_pratele]    Script Date: 25.07.2018 7:52:44 ******/
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
/****** Object:  Table [dbo].[knihovna_role]    Script Date: 25.07.2018 7:52:44 ******/
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
/****** Object:  Table [dbo].[knihovna_user]    Script Date: 25.07.2018 7:52:44 ******/
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
	[elan] [int] NULL,
	[money] [float] NULL,
	[image] [varchar](200) NULL,
	[needJob] [int] NULL,
	[restrictedTo] [datetime2](7) NULL,
	[profileViews] [int] NULL,
	[totalViews] [int] NULL,
	[lastLogin] [datetime2](7) NULL,
	[primaryIp] [varchar](50) NULL,
	[rateRemains] [int] NULL,
	[age] [int] NULL,
	[birthday] [datetime2](7) NULL,
	[education] [varchar](500) NULL,
	[hobbies] [varchar](500) NULL,
	[literature] [varchar](500) NULL,
	[music] [varchar](500) NULL,
	[movies] [varchar](500) NULL,
	[displayName] [bit] NULL,
	[displayAge] [bit] NULL,
	[displayJob] [bit] NULL,
	[displayEducation] [bit] NULL,
	[displayHobbies] [bit] NULL,
	[displayBooks] [bit] NULL,
	[displayMusic] [bit] NULL,
	[displayMovies] [bit] NULL,
	[displayProfileViews] [bit] NULL,
	[displayPrivateProfile] [bit] NULL,
	[displayTextNo] [bit] NULL,
	[displayStatisticsNo] [bit] NULL,
	[displayMedalsNo] [bit] NULL,
	[displayHelpNo] [bit] NULL,
 CONSTRAINT [PK_knihovna_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_user_role]    Script Date: 25.07.2018 7:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_user_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[roleId] [int] NOT NULL,
	[dateFrom] [datetime2](7) NOT NULL,
	[dateTo] [datetime2](7) NOT NULL,
	[data] [int] NOT NULL,
 CONSTRAINT [PK_knihovna_user_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_vouchery]    Script Date: 25.07.2018 7:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_vouchery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[used] [bit] NOT NULL,
	[usedId] [int] NOT NULL,
	[usedDate] [datetime2](7) NOT NULL,
	[type] [int] NOT NULL,
	[assigned] [bit] NULL,
 CONSTRAINT [PK_knihovna_vouchery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_vouchery_archetyp]    Script Date: 25.07.2018 7:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knihovna_vouchery_archetyp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [int] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[description] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_knihovna_vouchery_archetyp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[knihovna_wall]    Script Date: 25.07.2018 7:52:44 ******/
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

INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (2, N'Zaboc update', N'dsa', 45, N'<div id="obsahKnihy">
<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. &Uacute;prava</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.cc/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.cc/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.cc/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p><em>help</em></p>
</div>
</div>', NULL, 5, 2, 2, 2.8000000000000003, CAST(N'2018-06-02T09:46:01.033' AS DateTime), 1, 10, 0, 3)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (3, N'Zakuti v železe', N'Žamboch', 2010, N'<p>vvv</p>', NULL, 5, 2, 2, 0.1, CAST(N'2018-01-29T12:10:36.853' AS DateTime), 0, 0, 0, 12)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (6, N'dasd', N'dsa', 40, N'<p>Tento text by nemel obsahovat v&iacute;ce než 8 000 znaku. Možn&aacute;.</p>', NULL, 5, 2, 2, 1.2000000000000002, CAST(N'2018-01-29T12:17:14.940' AS DateTime), 0, 0, 0, 3)
INSERT [dbo].[book] ([id], [name], [author], [publishedYear], [description], [imageName], [category_id], [kategorie_id], [vlastnik_id], [version], [date], [isPayed], [unlockPrice], [minimalLevel], [sekce_id]) VALUES (7, N'Pridaná kniha', N'Mario', 2010, N'<p>Popis pridan&eacute; knihy</p>', NULL, 5, 2, 2, 1, CAST(N'2018-01-25T23:15:07.593' AS DateTime), 0, 0, 0, 3)
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[book_category] ON 

INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (5, N'Informatika', N'Popis')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (6, N'Vesmír', N'Knihy o vesmíru')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (7, N'Chemie', N'Chemická literatura')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (8, N'Biologie', N'Nejaká rakovina')
INSERT [dbo].[book_category] ([id], [name], [description]) VALUES (9, N'Ucebnice', N'Literatura o hovne')
SET IDENTITY_INSERT [dbo].[book_category] OFF
SET IDENTITY_INSERT [dbo].[book_odznaky] ON 

INSERT [dbo].[book_odznaky] ([id], [book_id], [odznak_id], [date]) VALUES (1, 2, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[book_odznaky] OFF
SET IDENTITY_INSERT [dbo].[book_odznaky_archetyp] ON 

INSERT [dbo].[book_odznaky_archetyp] ([id], [text], [image], [name]) VALUES (1, N'<p>Ocenen&iacute; za kvalitn&iacute; pr&iacute;spevek s vysokou informacn&iacute; hodnotou.</p>', N'8db53440-625e-4408-93f8-500a3163b489.png', N'Cena moderátora')
SET IDENTITY_INSERT [dbo].[book_odznaky_archetyp] OFF
SET IDENTITY_INSERT [dbo].[book_payment] ON 

INSERT [dbo].[book_payment] ([id], [user_id], [post_id], [dateUnlocked], [isPreview]) VALUES (11, 2, 2, CAST(N'2018-07-14T15:33:09.8273069' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[book_payment] OFF
SET IDENTITY_INSERT [dbo].[book_sekce] ON 

INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (1, N'Herní novinky', NULL, NULL, 0, N'Herní novinky', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (2, N'<h1>Recenze</h1>
<p>M&iacute;sto pro v&scaron;echny hern&iacute; nad&scaron;ence. Postrehy, z&aacute;žitky a mnoho dal&scaron;&iacute;ho!</p>', 1, N'd652ea8d-7221-4dbf-a495-f959001ce376.png', 0, N'Recenze', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (3, N'<h1>Tvorba</h1>
<p>Podel se o svoje v&yacute;tvory s ostatn&iacute;mi nad&scaron;enci!</p>', 1, N'ab3723a6-0280-4228-a3ff-c55e2532832d.png', 1, N'Tvorba', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (4, N'Ryanovy recenze [složka]', 2, NULL, 0, N'Ryanovy recenze', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (6, N'Programování', NULL, NULL, 0, N'Programování', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (7, N'C#', 6, NULL, 0, N'C#', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (8, N'Základy', 7, NULL, 0, N'Základy', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (9, N'Oop', 7, NULL, 0, N'Oop', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (10, N'Asp', 7, NULL, 0, N'Asp', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (11, N'Lofova akademie', 8, NULL, 0, N'Lofova akademie', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (12, N'Cvicení', 11, NULL, 0, N'Cvicení', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (13, N'Lekce', 11, NULL, 0, N'Lekce', 0)
INSERT [dbo].[book_sekce] ([id], [name], [parent_id], [image], [renderPriority], [debugName], [restrikce]) VALUES (14, N'<h1><span style="color: #000000;">V&yacute;voj Ch&yacute;&scaron;e&nbsp;</span><img style="font-size: 14px;" src="https://s18.postimg.org/f27y6qx89/16507-200.png" alt="" width="33" height="33" /></h1>
<p><span style="color: #000000;">Intern&iacute; sekce viditeln&aacute; pouze <strong>mod+</strong> uživatelum.</span></p>', 1, N'bb00c648-809b-410c-978d-5ea1a3034556.png', 0, N'Interní vývoj', 1)
SET IDENTITY_INSERT [dbo].[book_sekce] OFF
SET IDENTITY_INSERT [dbo].[book_version] ON 

INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (2, N'<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2018-03-16T19:26:08.2499787' AS DateTime2), 1, 2.3000000000000003, 2, N'<p>Fix typo <strong>#1</strong>&nbsp;</p>', 0, 0)
INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (3, N'<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2018-03-16T20:05:15.9645172' AS DateTime2), 2, 2.4, 2, N'<p>Aktualizace</p>', 1, 1)
INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (4, N'<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2018-03-16T20:44:21.8963378' AS DateTime2), 2, 2.5, 2, N'<p>Doplněn&iacute;</p>', 0, 0)
INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (6, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. &Uacute;prava</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-03-17T19:51:32.5042089' AS DateTime2), 2, 2.6, 2, N'Fix', 0, 0)
INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (7, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. &Uacute;prava</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.cc/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.cc/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.cc/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-06-02T09:46:01.0357921' AS DateTime2), 2, 2.7, 2, N'', 0, 0)
INSERT [dbo].[book_version] ([id], [text], [date], [changedBy], [version], [postId], [sumText], [isSuggestion], [isApproved]) VALUES (8, N'<div id="obsahKnihy">
<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. &Uacute;prava</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.cc/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.cc/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.cc/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p><em>help</em></p>
</div>
</div>', CAST(N'2018-07-14T15:38:41.2970151' AS DateTime2), 2, 2.8000000000000003, 2, N'sad', 0, 0)
SET IDENTITY_INSERT [dbo].[book_version] OFF
SET IDENTITY_INSERT [dbo].[chat_zpravy] ON 

INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2073, N'ads', 2, CAST(N'2018-06-01T09:27:58.9333067' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2074, N'test', 2, CAST(N'2018-06-01T09:28:44.4266545' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2075, N'dada', 2, CAST(N'2018-06-01T09:29:04.0740848' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2076, N'asd', 2, CAST(N'2018-06-01T09:30:04.7773049' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2077, N'as', 2, CAST(N'2018-06-01T09:31:27.7018522' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2078, N'kolo', 2, CAST(N'2018-06-01T09:32:15.7472593' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2079, N'tvoje máma', 2, CAST(N'2018-06-01T09:32:42.6143727' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2080, N'ada', 1, CAST(N'2018-06-01T09:33:03.8554200' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2081, N'ahoj, slyšíš?', 2, CAST(N'2018-06-01T09:48:25.8155086' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2082, N'jak to tam u vás jde?', 1, CAST(N'2018-06-01T09:51:11.4733450' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2083, N'nic moc', 2, CAST(N'2018-06-01T09:52:33.2405112' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2084, N'ahoj matěji', 2, CAST(N'2018-06-01T09:54:03.1039820' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2085, N'jojo, ahoj', 1, CAST(N'2018-06-01T09:54:15.6364155' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2086, N'nějaká zpráva', 2, CAST(N'2018-06-02T12:43:25.7606291' AS DateTime2))
INSERT [dbo].[chat_zpravy] ([id], [text], [userFrom], [date]) VALUES (2087, N'slyšíme se?', 1, CAST(N'2018-06-02T12:43:34.4842255' AS DateTime2))
SET IDENTITY_INSERT [dbo].[chat_zpravy] OFF
SET IDENTITY_INSERT [dbo].[knihovna_kategorie] ON 

INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (2, N'Novinky', N'Novinky o vývoji hry')
INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (3, N'Oznámení fóra', N'Duležité veci')
INSERT [dbo].[knihovna_kategorie] ([cat_id], [cat_name], [cat_description]) VALUES (4, N'Dedikované fórum o smradlavosti PHP', N'UNIVERSE PLS')
SET IDENTITY_INSERT [dbo].[knihovna_kategorie] OFF
SET IDENTITY_INSERT [dbo].[knihovna_komentare] ON 

INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (49, N'<p>Ani te%d</p>', CAST(N'2018-02-25T11:19:40.983' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (53, N'<p>Odpoved</p>', CAST(N'2018-02-26T16:14:13.487' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (54, N'<p>Fuck off</p>', CAST(N'2018-02-26T17:27:32.817' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (55, N'<p>Test</p>', CAST(N'2018-02-26T20:38:57.973' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (56, N'<p>Test</p>', CAST(N'2018-02-26T20:39:04.200' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (59, N'<p>Testd sad sa das</p>', CAST(N'2018-02-26T20:56:37.873' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (60, N'<p>Test</p>', CAST(N'2018-02-26T20:56:45.070' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (61, N'<p>Test EDIT</p>', CAST(N'2018-02-26T20:57:23.790' AS DateTime), 3, 2, 49)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (62, N'<p>Taky se zapoj&iacute;m do diskuze</p>', CAST(N'2018-02-27T10:32:06.693' AS DateTime), 3, 1, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (63, N'<p>Koment&aacute;r</p>', CAST(N'2018-02-27T12:35:18.100' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (64, N'<p>Shit</p>', CAST(N'2018-02-27T12:36:43.240' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (65, N'<p>Jej, nov&yacute; koment&aacute;r</p>', CAST(N'2018-02-27T12:38:47.570' AS DateTime), 3, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (66, N'<p>Sample koment&aacute;r</p>', CAST(N'2018-03-02T14:58:36.920' AS DateTime), 7, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (67, N'<p>Tohle je opravdu hezk&yacute; devlog! Te&scaron;&iacute;m se na hru.</p>', CAST(N'2018-03-02T15:00:21.837' AS DateTime), 2, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (68, N'<p><strong>Super!</strong> Te&scaron;&iacute;m se na pokracov&aacute;n&iacute;.</p>', CAST(N'2018-03-02T15:02:14.967' AS DateTime), 2, 1, 67)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (69, N'<p>M&aacute;me spoustu novinek, brzo prijde nov&yacute; update!</p>', CAST(N'2018-03-11T10:40:34.920' AS DateTime), 2, 2, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (70, N'<p>Omg, o co tady jde?! Jsem zl&yacute; a o&scaron;kliv&yacute; troll.</p>', CAST(N'2018-03-15T18:03:33.570' AS DateTime), 2, 12, -1)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (74, N'<p>Fuuj</p>', CAST(N'2018-03-15T22:21:39.797' AS DateTime), 2, 2, 70)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (78, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. &Uacute;prava</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-03-17T19:45:44.410' AS DateTime), 2, 2, 666)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (79, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-03-17T19:46:28.717' AS DateTime), 2, 2, 666)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (80, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat. Cancer</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-03-17T19:46:44.737' AS DateTime), 2, 2, 666)
INSERT [dbo].[knihovna_komentare] ([post_id], [post_content], [post_date], [post_topic], [post_by], [post_reply]) VALUES (81, N'<div id="obsahKnihy">
<p>Dnes pri&scaron;la rada na majoritn&iacute; aktualizaci Zabocu. C&iacute;lem bylo upravit st&aacute;vaj&iacute;c&iacute; <em>rush</em>&nbsp;model k vizu&aacute;lne pr&iacute;jemnej&scaron;&iacute;mu <em>spinu. </em>Nov&yacute; zaboc nyn&iacute; po zahl&eacute;dnut&iacute; hr&aacute;ce lehce nadskoč&iacute;, pot&eacute; zaleze do krun&yacute;re a rozjede se smerem k hr&aacute;ci. V tomto stavu je nezastaviteln&yacute; a nereaguje na z&aacute;sahy pomoc&iacute; cihel. Nejlep&scaron;&iacute; je, že v tomto stavu zurivosti bez milosti zab&iacute;j&iacute; sv&eacute; soukmenovce. Pri vhodn&eacute;m "natriggrov&aacute;n&iacute;" Zaboca se z něj tedy stane "ner&iacute;zen&aacute;" bomba, kter&aacute; muže nicit brick blocky nebo aktivovat jinak nedosažiteln&yacute; lucky block. Když konecne naraz&iacute; do nejak&eacute;ho bloku, prejde do <em>dizzy</em>&nbsp;stavu, ve kter&eacute;m se pohybuje zmen&scaron;enou rychlost&iacute; a nemuže zac&iacute;t spin &uacute;tok. Editov&aacute;no. Dal&scaron;&iacute; edit. Pojďme sem něco napsat.</p>
<p><em>Spin start:</em>&nbsp;</p>
<p><img src="https://s18.postimg.org/w8foslcrd/zaboc_spin_begin.png" alt="" width="120" height="30" /></p>
<p><em>Spin:</em></p>
<p><em><img src="https://s18.postimg.org/jh1im5fux/zaboc_spin.png" alt="" width="300" height="30" /></em></p>
<p><em>Dizzy walk:</em></p>
<p><em><img src="https://s18.postimg.org/ute442tqh/zaboc_dizzywalk.png" alt="" width="99" height="33" /></em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>', CAST(N'2018-03-17T19:47:52.450' AS DateTime), 2, 2, 666)
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
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (195, 10, 65, 1)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (196, 2, 69, 3)
INSERT [dbo].[knihovna_komentare_palce] ([id], [user_id], [komentar_id], [value]) VALUES (197, 2, 70, 1)
SET IDENTITY_INSERT [dbo].[knihovna_komentare_palce] OFF
SET IDENTITY_INSERT [dbo].[knihovna_notifikace] ON 

INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (2, -1, 2, N'Standa dal <b style="color: #a9a0e3">Užitečné</b> tvému kometáři u příspěvku Zaboc update', 1, 0, 0, CAST(N'2018-03-15T17:51:41.0245567' AS DateTime2), N'Získal jsi:</br><hr></hr>Krevity: <b>0.4</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (3, -1, 12, N'Standa dal <b style="color: #bbebff">Souhlasím</b> tvému kometáři u příspěvku Zaboc update', 0, 0, 0, CAST(N'2018-03-15T22:28:47.4311571' AS DateTime2), N'Získal jsi:</br><hr></hr>Zkušenosti: <b>2</b></br>Krevity: <b>0.2</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (4, -1, 12, N'Standa dal <b style="color: #bbebff">Souhlasím</b> tvému kometáři u příspěvku Zaboc update', 0, 0, 0, CAST(N'2018-03-15T22:30:43.1608508' AS DateTime2), N'Získal jsi:</br><hr></hr>Zkušenosti: <b>2</b></br>Krevity: <b>0.2</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (5, -1, 2, N'Standa dal <b style="color: #ff5252">Super</b> tvému kometáři u příspěvku Zaboc update', 1, 0, 0, CAST(N'2018-03-15T22:30:52.2934728' AS DateTime2), N'Získal jsi:</br><hr></hr>Reputace: <b>2</b></br>Krevity: <b>0.2</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (6, -1, 2, N'Standa dal <b style="color: #bbebff">Souhlasím</b> tvému kometáři u příspěvku Zaboc update', 1, 0, 0, CAST(N'2018-03-15T22:32:02.4342113' AS DateTime2), N'Získal jsi:</br><hr></hr>Zkušenosti: <b>2</b></br>Krevity: <b>0.2</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (7, -1, 2, N'Standa dal <b style="color: #bbebff">Souhlasím</b> tvému kometáři u příspěvku Zaboc update', 1, 0, 0, CAST(N'2018-03-15T22:33:48.9270856' AS DateTime2), N'Získal jsi:</br><hr></hr>Zkušenosti: <b>2</b></br>Krevity: <b>0.2</b>')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (8, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 5, -666, CAST(N'2018-06-03T19:43:49.4562179' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (9, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 6, -666, CAST(N'2018-06-03T19:44:21.0498928' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (10, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 7, -666, CAST(N'2018-06-03T19:49:50.1632362' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (11, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 8, -666, CAST(N'2018-06-03T22:57:46.0056900' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (12, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 9, -666, CAST(N'2018-06-05T10:18:04.3014690' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (1012, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 1009, -666, CAST(N'2018-07-23T18:39:58.2934865' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
INSERT [dbo].[knihovna_notifikace] ([id], [user_from], [user_to], [text], [displayed], [forceType], [rewardType], [dateSent], [description]) VALUES (1013, -1, 1, N'Uživatel Matěj si tě chce přidat do přátel', 0, 1010, -666, CAST(N'2018-07-23T18:46:18.6308225' AS DateTime2), N'Uživatel Matěj si tě chce přidat do přátel')
SET IDENTITY_INSERT [dbo].[knihovna_notifikace] OFF
SET IDENTITY_INSERT [dbo].[knihovna_novinky] ON 

INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (9, CAST(N'2018-01-27T13:44:36.4515828' AS DateTime2), N'Uživatel Standa pridal komentár k príspevku Zakuti v železe', 2, 3, 0, 1, 0, 0, 3, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (10, CAST(N'2018-01-28T16:01:21.1914016' AS DateTime2), N'Uživatel tz se zaregistroval', 9, 2, 0, 1, 0, 0, 9, N'Index', N'Profile')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (11, CAST(N'2018-02-27T12:38:49.8776862' AS DateTime2), N'Uživatel Standa pridal komentár k príspevku Zakuti v železe', 2, 3, 0, 1, 0, 0, 3, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (12, CAST(N'2018-03-02T14:58:37.1504790' AS DateTime2), N'Uživatel Standa pridal komentár k príspevku Pridaná kniha', 2, 3, 0, 1, 0, 0, 7, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (13, CAST(N'2018-03-02T15:00:21.8450380' AS DateTime2), N'Uživatel Standa pridal komentár k príspevku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (14, CAST(N'2018-03-02T15:02:14.9887358' AS DateTime2), N'Uživatel Matej pridal komentár k príspevku Zaboc update', 1, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (15, CAST(N'2018-03-11T10:40:35.1590043' AS DateTime2), N'Uživatel Standa pridal komentár k príspevku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (16, CAST(N'2018-03-15T00:10:25.4869444' AS DateTime2), N'Uživatel hnusak se zaregistroval', 11, 2, 0, 1, 0, 0, 11, N'Index', N'Profile')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (17, CAST(N'2018-03-15T18:02:23.8998824' AS DateTime2), N'Uživatel ivan se zaregistroval', 12, 2, 0, 1, 0, 0, 12, N'Index', N'Profile')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (18, CAST(N'2018-03-15T18:03:33.6495615' AS DateTime2), N'Uživatel ivan přidal komentář k příspěvku Zaboc update', 12, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (19, CAST(N'2018-03-15T22:21:39.8427747' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (20, CAST(N'2018-03-17T15:35:29.6216422' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (21, CAST(N'2018-03-17T19:32:47.6171932' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (22, CAST(N'2018-03-17T19:43:15.9355133' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (23, CAST(N'2018-03-17T19:45:44.4239114' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (24, CAST(N'2018-03-17T19:46:28.7253094' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (25, CAST(N'2018-03-17T19:46:44.7913476' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
INSERT [dbo].[knihovna_novinky] ([id], [date], [text], [userId], [type], [typeSub], [version], [priority], [sticky], [refId], [action], [controller]) VALUES (26, CAST(N'2018-03-17T19:47:54.6285493' AS DateTime2), N'Uživatel Standa přidal komentář k příspěvku Zaboc update', 2, 3, 0, 1, 0, 0, 2, N'Detail', N'Books')
SET IDENTITY_INSERT [dbo].[knihovna_novinky] OFF
SET IDENTITY_INSERT [dbo].[knihovna_odznaky] ON 

INSERT [dbo].[knihovna_odznaky] ([id], [odznakId], [userId], [date], [venovani], [text], [image], [name]) VALUES (3, 3, 2, CAST(N'2018-01-23T21:39:41.1466553' AS DateTime2), N'', N'<p>D&iacute;ky tobe je n&aacute;&scaron; server lep&scaron;&iacute;!</p>', N'17049746-bf6e-4200-a367-571c7aa89703.png', N'Pilír komunity')
SET IDENTITY_INSERT [dbo].[knihovna_odznaky] OFF
SET IDENTITY_INSERT [dbo].[knihovna_odznaky_archetyp] ON 

INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (3, 2, N'<p>D&iacute;ky tobe je n&aacute;&scaron; server lep&scaron;&iacute;!</p>', N'17049746-bf6e-4200-a367-571c7aa89703.png', N'Pilír komunity')
INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (4, 4, N'<p>Gratulujeme, jsi overen&yacute; uživatel!</p>', N'52c6bfe6-9e38-40f9-ae33-8698f1bcc61b.png', N'Overený uživatel')
INSERT [dbo].[knihovna_odznaky_archetyp] ([id], [odznakId], [text], [image], [name]) VALUES (5, 2, N'<p>Ocenen&iacute; za kvalitn&iacute; pr&iacute;spevek.&nbsp;</p>', N'fd6bdd4e-75e8-401f-91a1-5634779fde88.png', N'Cena moderátora')
SET IDENTITY_INSERT [dbo].[knihovna_odznaky_archetyp] OFF
SET IDENTITY_INSERT [dbo].[knihovna_palce] ON 

INSERT [dbo].[knihovna_palce] ([id], [user_id], [book_id], [value]) VALUES (160, 2, 4, 1)
SET IDENTITY_INSERT [dbo].[knihovna_palce] OFF
SET IDENTITY_INSERT [dbo].[knihovna_role] ON 

INSERT [dbo].[knihovna_role] ([role_id], [identificator], [role_description]) VALUES (1, N'knihovnik', N'Admin')
INSERT [dbo].[knihovna_role] ([role_id], [identificator], [role_description]) VALUES (2, N'ctenar', N'Uživatel')
SET IDENTITY_INSERT [dbo].[knihovna_role] OFF
SET IDENTITY_INSERT [dbo].[knihovna_user] ON 

INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (1, N'Standa', N'Knitzl', N'uzivatel', N'uzivatel', 2, NULL, 6, 10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 4, 0, 90, N'e3adaba7-7be3-4ee7-8172-0ddf2c2330c8.png', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, CAST(N'2018-06-02T12:43:08.4259953' AS DateTime2), N'::1', 0, 0, NULL, NULL, N'Příroda, filmy', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (2, N'Matěj', N'Štágl', N'admin', N'admin', 1, N'Jsem autor zdejšího portálu, nadšený vývojář. Miluju všechno okolo IT, heuréka moment, kvalitní hudbu (od metalu až po cernošské blues). Pevně věřím, že si užíváte svůj pobyt na našem fóru!





    
    
    
    
    
    
    ', 1, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 8, 4, 1, 5, 40.5, N'31d698fe-a063-4f0a-b6f4-ce789fce867f.png', 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, CAST(N'2018-07-25T07:49:17.1603996' AS DateTime2), N'::1', 0, 19, NULL, N'VŠE - Aplikovaná informatika,gymnázium česká lípa', N'Kytara,   Hry,   Běh,  csko,  quake3, ještě neco', N'Žamboch, Kulhánek, Moudrý, McCarthy, Merle, Howey', N'Rock, punk, metal, KISS', N'Pulp Fiction', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (6, N'user', N'', N'user', N'user', 2, N'', 0, 11, CAST(N'2018-01-26T23:47:56.4677705' AS DateTime2), 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (8, N'user2', N'', N'user2', N'heslo', 2, N'', 0, 0, CAST(N'2018-01-27T00:37:05.5441422' AS DateTime2), 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (9, N'tz', N'', N'tz', N'tz', 2, N'', 0, 0, CAST(N'2018-01-28T16:01:21.0826117' AS DateTime2), 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (10, N'Daniel', N'Milián', N'cloudy', N'root', 1, N'<p>hj</p>', 0, 0, CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, NULL, 990, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (11, N'hnusak', N'', N'hnusak', N'hnusak', 2, N'', 0, 0, CAST(N'2018-03-15T00:10:24.4158779' AS DateTime2), 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[knihovna_user] ([user_id], [name], [surname], [login], [password], [role_id], [welcomeText], [authLevel], [exp], [joinedDate], [postsNumber], [commentsNumber], [likesNumber], [reputation], [elan], [money], [image], [needJob], [restrictedTo], [profileViews], [totalViews], [lastLogin], [primaryIp], [rateRemains], [age], [birthday], [education], [hobbies], [literature], [music], [movies], [displayName], [displayAge], [displayJob], [displayEducation], [displayHobbies], [displayBooks], [displayMusic], [displayMovies], [displayProfileViews], [displayPrivateProfile], [displayTextNo], [displayStatisticsNo], [displayMedalsNo], [displayHelpNo]) VALUES (12, N'ivan', N'', N'ivan', N'ivan', 2, N'', 0, 4, CAST(N'2018-03-15T18:02:23.7454203' AS DateTime2), 0, 0, 0, 0, NULL, 10.399999999999999, N'avatar.png', 0, CAST(N'2019-03-15T18:02:23.7454203' AS DateTime2), 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[knihovna_user] OFF
SET IDENTITY_INSERT [dbo].[knihovna_user_role] ON 

INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (3, 1, 2, CAST(N'2018-03-14T22:50:35.9617336' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (4, 2, 2, CAST(N'2018-03-14T22:50:36.0208225' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (5, 6, 2, CAST(N'2018-03-14T22:50:36.0228282' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (6, 8, 2, CAST(N'2018-03-14T22:50:36.0288438' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (7, 9, 2, CAST(N'2018-03-14T22:50:36.0308495' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (8, 10, 2, CAST(N'2018-03-14T22:50:36.0328582' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (9, 2, 1, CAST(N'2018-03-14T23:38:18.7225328' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (10, 11, 2, CAST(N'2018-03-15T00:10:25.4401771' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), -1)
INSERT [dbo].[knihovna_user_role] ([id], [userId], [roleId], [dateFrom], [dateTo], [data]) VALUES (11, 12, 2, CAST(N'2018-03-15T18:02:23.8284523' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), -1)
SET IDENTITY_INSERT [dbo].[knihovna_user_role] OFF
SET IDENTITY_INSERT [dbo].[knihovna_vouchery] ON 

INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (4, N'J1U5M-R68WO-3HQBN-5PFEW', 1, 2, CAST(N'2018-03-21T17:59:18.1424283' AS DateTime2), 0, 0)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (5, N'PSWWH-X30YK-X5MGL-94D3P', 1, 2, CAST(N'2018-03-21T17:59:46.0074043' AS DateTime2), 0, 0)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (6, N'DYSJ8-EUWGS-MVTE2-9F3K8', 1, 2, CAST(N'2018-03-21T17:59:35.0175831' AS DateTime2), 0, 0)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (7, N'CPYGC-M5QI3-PHBWV-58UBR', 0, -1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 1)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (8, N'QOB3J-KVM42-2EW8S-9W75A', 0, -1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 1)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (9, N'IRG37-N2NBL-LMMLR-BGS6N', 1, 2, CAST(N'2018-03-21T21:08:04.0766851' AS DateTime2), 0, 1)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (10, N'E4ZPK-MISYV-KBGCZ-YE56B', 1, 2, CAST(N'2018-03-21T21:20:48.8440787' AS DateTime2), 0, 1)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (11, N'2865T-M5XLQ-P6XU4-E2AAG', 1, 2, CAST(N'2018-03-21T21:08:24.3614535' AS DateTime2), 0, 0)
INSERT [dbo].[knihovna_vouchery] ([id], [code], [used], [usedId], [usedDate], [type], [assigned]) VALUES (12, N'V9VM6-BM5J4-JLXCI-CDZNZ', 1, 2, CAST(N'2018-07-21T21:06:57.8216744' AS DateTime2), 0, 0)
SET IDENTITY_INSERT [dbo].[knihovna_vouchery] OFF
SET IDENTITY_INSERT [dbo].[knihovna_vouchery_archetyp] ON 

INSERT [dbo].[knihovna_vouchery_archetyp] ([id], [type], [name], [description]) VALUES (1, 0, N'Balík krevitů (x20)', N'<p>Uplatnil jsi poukaz na&nbsp;<strong>Bal&iacute;k krevitů</strong></p>
<p><em>Z&iacute;sk&aacute;no:</em></p>
<ol>
<li><em>Krevity</em> <strong>x20</strong></li>
</ol>')
SET IDENTITY_INSERT [dbo].[knihovna_vouchery_archetyp] OFF
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
