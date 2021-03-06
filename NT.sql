USE [master]
GO
/****** Object:  Database [NT]    Script Date: 2018/4/29 星期日 15:01:39 ******/
CREATE DATABASE [NT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\NT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\NT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NT] SET ARITHABORT OFF 
GO
ALTER DATABASE [NT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NT] SET RECOVERY FULL 
GO
ALTER DATABASE [NT] SET  MULTI_USER 
GO
ALTER DATABASE [NT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NT', N'ON'
GO
USE [NT]
GO
/****** Object:  Table [dbo].[ACG]    Script Date: 2018/4/29 星期日 15:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACG](
	[Pro_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Class] [nvarchar](10) NOT NULL,
	[Pro_Title] [nvarchar](30) NOT NULL,
	[Pro_Time] [datetime] NOT NULL,
	[Pro_Content] [nvarchar](max) NOT NULL,
	[Pro_Img] [nchar](50) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Tally_ID] [int] NOT NULL,
 CONSTRAINT [PK_ACG] PRIMARY KEY CLUSTERED 
(
	[Pro_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Act_ID] [int] IDENTITY(1,1) NOT NULL,
	[Act_Title] [nvarchar](30) NOT NULL,
	[Act_Content] [nvarchar](max) NOT NULL,
	[Act_Img] [nvarchar](50) NOT NULL,
	[Act_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[Act_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [nchar](10) NOT NULL,
	[Admin_Password] [nchar](20) NOT NULL,
	[Admin_Img] [nchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classification](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Classification] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[Coll_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Pro_ID] [int] NOT NULL,
	[collect] [nchar](10) NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[Coll_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comments_ID] [int] IDENTITY(1,1) NOT NULL,
	[Comments_Content] [nchar](400) NOT NULL,
	[Comments_Time] [datetime] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Pro_ID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comments_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cull]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cull](
	[Cull_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cull_Name] [nvarchar](20) NOT NULL,
	[Cull_Img] [nchar](50) NOT NULL,
	[Cull_Content] [nvarchar](150) NOT NULL,
	[Dyn_ID] [int] NOT NULL,
	[Class_ID] [int] NOT NULL,
 CONSTRAINT [PK_Cull] PRIMARY KEY CLUSTERED 
(
	[Cull_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dyn]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dyn](
	[Dyn_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Dyn_Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Dyn] PRIMARY KEY CLUSTERED 
(
	[Dyn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inform]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inform](
	[Inform_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Pro_ID] [int] NOT NULL,
	[results] [nchar](20) NULL,
 CONSTRAINT [PK_Inform] PRIMARY KEY CLUSTERED 
(
	[Inform_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leavewords]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leavewords](
	[Leavewords_ID] [int] IDENTITY(1,1) NOT NULL,
	[Leavewords_Content] [nvarchar](max) NOT NULL,
	[Leavewords_Time] [datetime] NOT NULL,
	[User_ID] [int] NOT NULL,
	[News_ID] [int] NOT NULL,
 CONSTRAINT [PK_Leavewords] PRIMARY KEY CLUSTERED 
(
	[Leavewords_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[News_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cull_ID] [int] NOT NULL,
	[News_Title] [nchar](50) NOT NULL,
	[News_Time] [datetime] NOT NULL,
	[News_Content] [nvarchar](max) NOT NULL,
	[News_Url] [nchar](100) NULL,
	[News_Img] [nchar](100) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[News_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyComments]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComments](
	[ReplyComments_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReplyComments_Content] [nvarchar](200) NOT NULL,
	[ReplyComments_Time] [datetime] NOT NULL,
	[Comments_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_ReplyComments] PRIMARY KEY CLUSTERED 
(
	[ReplyComments_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyLeavewords]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyLeavewords](
	[ReplyLeavewords_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReplyLeavewords_Comment] [nvarchar](max) NOT NULL,
	[ReplyLeavewords_Time] [datetime] NOT NULL,
	[Leavewords_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_ReplyLeavewords] PRIMARY KEY CLUSTERED 
(
	[ReplyLeavewords_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tally]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tally](
	[Tally_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tally_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Tally] PRIMARY KEY CLUSTERED 
(
	[Tally_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/4/29 星期日 15:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nchar](10) NOT NULL,
	[User_Password] [nvarchar](20) NOT NULL,
	[User_Img] [nvarchar](50) NOT NULL,
	[User_Email] [nvarchar](50) NOT NULL,
	[User_Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACG] ON 

INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (2, N'视频', N'一眼千年 ', CAST(N'2018-04-23T02:00:00.000' AS DateTime), N'video\JiJiDown.COM 那英献唱 国家宝藏 主题曲 一眼千年 bilibili12月3日24点正片上线 Av16850490 P1 .mp4', N'Image\videoimg\一眼千年.jpg                           ', 2, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (9, N'视频', N'央视爸爸《国家宝藏》超大气的开场效果', CAST(N'2018-04-23T19:00:00.000' AS DateTime), N'video\1.1(Av16799615,P1).Mp4', N'Image\videoimg\国家宝藏1.jpg                          ', 2, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (20, N'漫画', N'吉祥阿索', CAST(N'2018-04-27T21:33:07.610' AS DateTime), N'<h3>我叫良渚玉琮王 静水流深，沧笙踏歌 时间的沙漏沉淀着无法逃离的过往，记忆的双手总是拾起那些明媚的忧伤 自古神奇皆暗藏玄意，被尘封的终是最痛的 转瞬千年，那些我不能忘记也敢忘记的过去，远比泪水更加稍纵即逝 泥沙蒙住双眼，也掩不住你在我心中的模样。 几千幽载，終年仰望，愿你比肩在旁 被掩埋的古老城池啊，你何时才会回来?</h3>

<p><a href="https://www.bilibili.com/p/3268639" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/c569158dccfe6ba974ada561760b121ffcebc73d.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画5.webp.jpg                           ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (22, N'漫画', N'太阳神鸟金箔拟人，金灿灿', CAST(N'2018-04-27T21:41:16.733' AS DateTime), N'<h3>太阳神鸟金箔拟人，金灿灿<img src="https://i0.hdslb.com/bfs/album/84d7bc5a548d1a1e150385672161f700d085b3b1.jpg@.webp" /></h3>

<p>&nbsp;</p>
', N'Img\ACGImg\插画7.webp.jpg                           ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (41, N'插画', N'妇好鸮尊的', CAST(N'2018-04-27T22:35:50.883' AS DateTime), N'<h3>妇好鸮尊的主人是历史上第一位有文字记载的女将军，所以她的拟人形象是个战斗角色的女性。 因为鸮尊本身是青铜酒器，所以发色和战衣选择了同种色系来搭配。 而妇好的武器是钺，所以选择绘制了同类型武器设计。 绘画过程视频可以找我投稿。 还有宝宝！这个是参赛的作品！求点赞投票！！</h3>

<p><img src="https://i0.hdslb.com/bfs/album/414bb62e0d1e3627c8791c19afb7a5b14d6c15bf.jpg@.webp" /></p>
', N'Img\ACGImg\插画9.webp.jpg                           ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (42, N'插画', N'禾禾末', CAST(N'2018-04-27T22:37:29.263' AS DateTime), N'<h3>一个虽然年龄很大但是一直对新事物充满好奇的大龄酒器，酒量很大喝酒永远只是微醺，身上有一些猛兽的纹身虽然很在意但是依旧非常开朗的元气少女！</h3>

<p><img src="https://i0.hdslb.com/bfs/album/62b0e68dbacc8956d991e10ec10945a54d4358ea.jpg@.webp" /></p>
', N'Img\ACGImg\插画10.webp.jpg                          ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (43, N'插画', N'麻糬祝哦漏四周年快乐', CAST(N'2018-04-27T22:38:27.140' AS DateTime), N'<h3>龙山蛋壳黑陶杯！初见第一次看见此杯时 第一眼就被他高挑的设计吸引住了 极具美感黑和带有奢华之气形态不禁想到这样的杯是不是一位尊贵的女性使用？哈哈哈哈虽然只是猜想 应该为礼器更合适它的精致 这个孩子也是大致模仿了按黑陶杯的体态创作的！ 希望有人喜欢她=3=</h3>

<p><a href="https://www.bilibili.com/p/3103935" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/3fcdab16829c72563ee2bef36fa5bae9470c6890.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画11.webp.jpg                          ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (44, N'漫画', N'【漫画】Kiss and Cry #04', CAST(N'2018-04-27T22:40:43.647' AS DateTime), N'<p><strong>ドドドドドンパ疾走組</strong></p>

<p><img src="http://imgs.aixifan.com/o_1cc3m1ht4q4a1spi17on5ul1neajl.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht41bvquiiopp852d1fjm.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht41upa11591bc1t1dbljn.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht41t361ssf1utqp5s117cjo.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht4bt83bnj9o1f561utsjp.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht51nkg1laf1tkd1jq3ngmjq.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht51pan17dm5sn152sva8jr.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht5ibp1rr05ff1busfhmjs.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht510faat9uo015j0fehjt.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht617i8tla19j110k31rbgju.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht61dvb15i0il91frde0ejv.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht67kt18u21brhok917rtk0.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht61ti8f421os3261is8k1.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht61gvjhlfa3a6as1jibk2.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht6fvmdgfgus1u0vudsk3.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht6flb1m8amcq13c11ggbk4.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht61mo0jtkbldkkg1f5rk5.png" /><br />
<img src="http://imgs.aixifan.com/o_1cc3m1ht65kg1bobncb1ml419i3k6.png" /></p>
', N'Img\ACGImg\漫画1.png                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (45, N'漫画', N'【漫画】配信勇者 #01', CAST(N'2018-04-27T22:42:26.803' AS DateTime), N'<p><strong>茗茶&times;漫元shop漢化組</strong></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42smq1c4s1tmv19ts1vn117.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ts6vvei118bgs9131q18.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ueio7p31c81ncdnki19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u17fb10e51p4l1hls189t1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1h0u13cku452psb9a1b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u115t1rdk9icbjeda51c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ublm74726o1d76vnp1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42utfj1e4n136c7pt1hhu1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u18i41g8b3jnrdofbl1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1765n7s1pp218q5nni1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1n11173f1ci8nv3p5m1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ura06nivvb1n6jdbj1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u91hgp01od31um41i061j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ugjv1eo41o1gic01q5e1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1ub91fok1g3msokf161l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1ahbtt81rni1qo61keb1m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42ui73koc1u4u122u1llr1n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42uj9b1amj4e31e93n8j1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42uhs21sts161qsro6q1p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1btm1pvr1ah11q3r2n1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42uqhl14ft1builgpdf51r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u1ms0rf1bti1lomapr1s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42u11rh1ub010ir1bm314ud1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42v1b2n1h6n1u6rkus1lj81u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42vr1qnra8q1ecr1d9m1v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42v8kms091fkp10r2fsr20.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42vgu9f7o7m81to21h2921.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42vqr513su1s6319sg1ar322.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42va1b1eb54h4cnkq5m23.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42vnl048dcku1idg185724.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42v1juk4ea1q7kj0pbs725.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42v121c1ak61s5617hs64e26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3kv42vn501r6a1r4mib91jsl27.jpg" /></p>
', N'Img\ACGImg\漫画2.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (47, N'漫画', N'【漫画】宝石之国', CAST(N'2018-04-27T22:46:34.977' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc2t126leu06mn110b8ivksmt.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1q5016g8q3716ak1bsqu.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mautjeegqn1uen1os7v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mnhe40sj3g12a8bur10.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m7i71bvgs911rv1pbk11.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1uvp1inuamd1en41s5q12.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1rqiu261vtl13ht9qs13.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126miq8ut24tn13dp18b014.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1gvk1bbnfgu16nq3cv15.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m15831vj51ct91otiol516.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mh2p19pu666k1i11n917.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mp0k1va314nb1btvt9c18.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1o7blc81ph31h4gukq19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126muqhasn13oc1c14q1u1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mtdl19b71sgrp0r1nr91b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mf6a1ds8a0ai1a1c0j1c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mlfh176k63t1g80ckh1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1hva18oi173b115vmkc1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m7rg1buu90t1am916dk1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m15e31r601kjd19us1qtp1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1ro12q7cb5soe174v1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126mrl91t1915je16581dja1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2t126m1d1r17g2c76107bli91j.jpg" /></p>
', N'Img\ACGImg\漫画4.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (48, N'漫画', N'[玉皇朝]【皇朝君临-20普照佛光】', CAST(N'2018-04-27T22:47:53.167' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc3oq68a1pnj14001jpv4i7brc19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68a1c8cs301rv114joup1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68avem5cu107m1k6vfoe1b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68ajh94g2d531bqa16gl1c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1e31spdg6kfn51c4a1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68bf4e8l8kj4hvm1sug1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1sgu1h591nmb1k0u7qa1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68be201ol7174e1avt1tnr1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68be0u105c1mjq191m2of1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1o9l1bpsrg41ide1djv1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68blci5bhjn9novbmi1j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b10dk1foq1hulkqg166l1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68btv51kgb1l7d1p4kc0s1l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1g961quq18j140b1ue81m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1pr8chd1pu0158g1oi41n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1le11shc1qqk1gllgi11o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1se51kaldu51r9835s1p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68bdkuosm6rs1ucj135f1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b532rk21l60p421drr1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68b1kr7425ab7vf1sr81s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d1l6a10gong61scpbj41t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d13agj0v61e1m768ii1u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d1nd8ppu1plugv01c01v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68de8b1h05qu4d2bn7220.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68dcrr1i1f1vgk1e4n14rk21.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d1fqqgjg1e9l1nigak022.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d1d371egg1pm01voj1kr123.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d3j31lnk3pv11e114f924.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68d19n55cfmv41qqc6r325.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68ebjg7gn68q1vor6su26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68e1ni29nt140ek90tr427.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68edma1q5ukh1k0u1fv528.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68e11l1mkd1e7d1t51m0c29.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68e1j012vkda61buuc932a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc3oq68ee1q1748cckjq419f92b.jpg" /></p>
', N'Img\ACGImg\漫画5.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (49, N'漫画', N'[玉皇朝]【新著龙虎门外传-火云邪神1】', CAST(N'2018-04-27T22:49:21.660' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1c3rifn1ikvpnecs19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e13s11a1p163u7571nbm1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1u4m1l9ctt1apl1lig1b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8el2gbcr1v81g9q1f5f1c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e2r612jk1usua2jqq01d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8el9g9jh1mi1p9j9551e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1trajm11tm5cpu11gr1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e11kvppt1hhi138m18s41g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8ev861op8sc3g9djge1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1kho15p6id41b4dngf1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1fd88dl11q71l77vja1j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1pmt1mj5r38br6o5k1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1002qfq6ko1faqre31l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1g0u47c181llpp13dl1m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e5e3e6d155p189p11eu1n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1kvg10r0snjtps1qsj1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1gmp1ernpli1qps1q951p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e1snqi1i1spcn29n4j1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8e16nko3clsnh0p1vto1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f17rj1ga5lqfc8p1ed01s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8fhj11cm61fqt1fovp7c1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8ftd3qc04kb1dia1m3f1u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f1hbq15rb9oin111cj51v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8fl6k1qt5l2g11i81u1o20.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8fll3e672g81t6ijc621.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f9pr15c31a7k1l6213e922.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8fsg1li01n7gh231egp23.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f1g62rcgmro1mbl1knk24.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f9to19r67k31eag1mkp25.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f150e125818ju1a8e1d7g26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f1pge15fbrc1du4145327.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f6qoprjg6c15l113c928.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8f1u2d1fl01n7115dn165129.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8frgi1mlggsg1elmjab2a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0s1t8fa31m3s1k5e1pjv1ol82b.jpg" /></p>
', N'Img\ACGImg\漫画6.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (50, N'漫画', N'[玉皇朝]【皇朝君临-19血雨穹苍】', CAST(N'2018-04-27T22:50:23.997' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc2idjcoin9ag7aue1lomel819.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco178m36b1oul1r8p1o2a1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco1jnkuu21m5u2681lsu1b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco1c201ntd5ub1iev4sv1c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcok5aqu6nip4911lr21d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco1ump8l2gl8obu17tv1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjconi3kvd101tn1qc051f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcoc48nqg6v0v7c9ni1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcovq85paaou1k9vm461h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcob2r106416u1mmjahq1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco1lduje4n0m1hde4gd1j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco1o7li34dqmllhpdm1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco2rjta02q41fefne91l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcogls1bo41k3s39c18a61m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcojcj121rvnt16js2pv1n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcobmebqa1a021njhp6s1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcojku1v5665flk51i721p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcoef21ah21bo82c21fmb1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcou4k9pvimc158mucr1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco73ro114ue1vffhau1s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco37n16mlusb3u11pau1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjco39m1bbvauh14tm16dh1u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp19lovve11r61qub1dgm1v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp9ekdatf1be98s4l20.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcpnqm1q531b7qf2muhf21.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcppks1q4ebqm1fda150222.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp1nl012ufe3g69vt8123.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcpfmacpvbjg1dlk10un24.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcpa1o118916hk1lo818ce25.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp6sjlf111fj3t4bhb26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcpoa0d4311i8lc19i227.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp1r3g1o1bil1jbl2v28.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp1rfqv0ffab1teka9a29.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcp1oc61p0o18vri2n1sj22a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc2idjcpbqr156bscqb11p32b.jpg" /></p>

<p>&nbsp;</p>

<p>这次的战斗根据贴吧用户考证,基本上全程复刻了天1飘渺城绿毛老祖之战的招数和分镜,当然画风和天一比起来肯定天上地下,看的煞是过瘾...</p>

<p>&nbsp;</p>

<p>绿民的内心独白加分不少....</p>
', N'Img\ACGImg\漫画7.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (51, N'漫画', N'[玉皇朝]【皇朝君临-17相逢何必曾相识】', CAST(N'2018-04-27T22:51:36.673' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8b9n1hvl7aqa93sv819.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81kk51r73b6p1t2c13a81a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8pddfn6rpfu225vg1b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81t2su9g156u1sj1158t1c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8tf910r6148kb241ftg1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81q84di1aq91mg86b61e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d819ul8sp870i6b5mo1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d818us1jr3e8n1stj1eto1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8oo01opf1muo1gii9kh1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d817p11vv5aa21ne61qbn1i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d812gj14041b8p9en6o61j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8ikit3je2d1n1e3ul1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81k0910vp1n0n18bi6cc1l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81osvassjds73k1nkn1m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d81nfll0p1hij8so1fj51n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d8qsr1b8jfkm10tt1uqm1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9obsmn414e41aq817kn1p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d91hl1f4l1nve7ql3bn1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d93j21v9naev1lghq5m1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d916kfm5llo7ocatij1s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9ca814nf1l2qum31t4a1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d936u1j73rgk1tqv1iv61u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9rens5h1klh128k1et31v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9ia514uji7aekav8v20.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9c7cjgt1p3p1jpkfnu21.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9ghk14hco65oc15nd22.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9cg013i912kcogmra23.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d91ulg5ss1gq31ubr1a3g24.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d91gqf1s5315eidkhlfg25.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9pa01sic64kuol1poj26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d914joolr14101tq3l927.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9dpq28ttue15k97vq28.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d9e7v1ijk8od111iqpu29.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d93pl1b6d1631i9nfti2a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cbvlp9d91sud1ife78h15af14f82b.jpg" /></p>

<p><br />
&nbsp;</p>

<p>&nbsp;</p>

<p>这期出场老角色比较多啊,妲己按照林志玲造型来画的~~武曌则直接搬运了当年神兵F的造型</p>

<p>&nbsp;</p>

<p>古柔这个奸角我是佩服的,当年神兵玄奇时期,就是属于那种&quot;主角升级他也升级但是就是打不过主角一行人也没法做任何坏事&quot;的角色,算是港漫界的奇葩了</p>
', N'Img\ACGImg\漫画8.jpg                                ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (52, N'漫画', N'[玉皇朝]【皇朝君临-18天妖计谋】', CAST(N'2018-04-27T22:55:12.647' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc0p7hur1p6n1lj91hgvcs711b19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus15brja21qef4c11u8m1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1td21t15jkpnc37m01b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husj431ihv9aq25p18o71c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husfbtfllu6i1if324c1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1ihqb1e46m9531ukk1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1p76185i1vmf1j31ddv1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1rs615c3hmsusaoq1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1gd11l5719bpro0k3j1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus158i1ujb1sqha55rr11i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1k8g18729ngda63k01j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husdp8r751ue1hn51n0f1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus13r13appvc1l451a541l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1octo41d9tp2n14kj1m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1qaqv5n9lq137v97a1n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husm611rcgd691b8efdr1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1tl71na81lo1r9n4581p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1g3h1up1t1lchc1h6a1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus17213qegu51om7111c1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1kjf1nv11knc1526ibn1s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1a7h6h152p1dl1v4p1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husjp2uh81es21ipih3f1u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husjvk1iig1pam1akmpdn1v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1hn017e6pl6125bvb720.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus171f15mp1ir217namm721.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus4ditjogrs1vjqlks22.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husph9ddq1kf3re11l7s23.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1avklsvtge1g2jk8d24.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1g1m2m31h0lsp81knj25.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus18mo6s1gq1ug91k26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1t7f1dvsj16ui1d3127.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1ofafprd6n1vmcufg28.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husc3912el9l31pik1qnk29.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus7atm0u7ll1fqp1t0i2a.jpg" /></p>
', N'Img\ACGImg\漫画9.jpg                                ', 5, 2)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (53, N'漫画', N'[玉皇朝]【皇朝君临-18天妖计谋】', CAST(N'2018-04-27T22:57:39.450' AS DateTime), N'<p><img src="http://imgs.aixifan.com/o_1cc0p7hur1p6n1lj91hgvcs711b19.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus15brja21qef4c11u8m1a.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1td21t15jkpnc37m01b.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husj431ihv9aq25p18o71c.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husfbtfllu6i1if324c1d.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1ihqb1e46m9531ukk1e.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1p76185i1vmf1j31ddv1f.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1rs615c3hmsusaoq1g.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1gd11l5719bpro0k3j1h.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus158i1ujb1sqha55rr11i.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1k8g18729ngda63k01j.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husdp8r751ue1hn51n0f1k.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus13r13appvc1l451a541l.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1octo41d9tp2n14kj1m.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1qaqv5n9lq137v97a1n.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husm611rcgd691b8efdr1o.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1tl71na81lo1r9n4581p.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1g3h1up1t1lchc1h6a1q.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus17213qegu51om7111c1r.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1kjf1nv11knc1526ibn1s.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1a7h6h152p1dl1v4p1t.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husjp2uh81es21ipih3f1u.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husjvk1iig1pam1akmpdn1v.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1hn017e6pl6125bvb720.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus171f15mp1ir217namm721.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus4ditjogrs1vjqlks22.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husph9ddq1kf3re11l7s23.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1avklsvtge1g2jk8d24.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1g1m2m31h0lsp81knj25.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus18mo6s1gq1ug91k26.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1t7f1dvsj16ui1d3127.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus1ofafprd6n1vmcufg28.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7husc3912el9l31pik1qnk29.jpg" /></p>

<p><img src="http://imgs.aixifan.com/o_1cc0p7hus7atm0u7ll1fqp1t0i2a.jpg" /></p>
', N'Img\ACGImg\漫画9.jpg                                ', 5, 2)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (54, N'插画', N'青铜神树', CAST(N'2018-04-27T22:58:39.977' AS DateTime), N'<h3>青铜神树，被人打的一截一截的又被医好，可惜头部损毁还是太严重这样。 姑且2P无伤版本。3P新增画风突变&middot;真&middot;无伤&middot;年轻版本。一开心就又画了，谢谢大家喜欢！ 头一次参加活动请多指教啦！</h3>

<p><a href="https://www.bilibili.com/p/3200785" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/e6bcdb77641ee1a2f8507c33f20a19c3b8d240c7.png@.webp" /></a></p>
', N'Img\ACGImg\插画13.webp.jpg                          ', 5, 3)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (57, N'插画', N'莲鹤方壶', CAST(N'2018-04-27T23:05:05.643' AS DateTime), N'<h3>莲鹤方壶给我的感觉亦正亦邪的（笑。 所以人物就用了一半一半的画法 一半纯一半恶 构图的话上面是壶的莲花和鹤 下面是壶的兽纹 纹路我选择了蛇 （百度蛇的时候鸡皮疙瘩都起来了） 嗯。大概就是这样了qvq</h3>

<p><a href="https://www.bilibili.com/p/3210133" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/25501565a738573dbe4b5c511732df9820ac0ad6.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画1.webp.jpg                           ', 5, 4)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (58, N'插画', N'西汉堂阳侯错银铜虎符', CAST(N'2018-04-27T23:06:09.097' AS DateTime), N'<h3>看到这个活动就毫不犹豫的参加了。原型参考了西汉堂阳侯错银铜虎符。【右上用小篆也写出来了，小篆是西汉的官方字体】。 说道虎符拟人第一个想到的就是兽耳娘了！另外就是因为是两半所以变成了姐妹，一只穿着参考汉朝士兵，一只参考的是汉武帝的服饰。士兵的服饰虽然应该是红色的，但是为了体现虎符本身的黑色将其加以改造。另外铭文主要体现在大腿上带着的腿环上面了，说起来虎符要拼在一起才能够调动军队，那么应该是姐妹丼？！</h3>

<p><img src="https://i0.hdslb.com/bfs/album/4ab3370e008d0095cbbee5d2100fb1b55faf6f97.jpg@.webp" /></p>
', N'Img\ACGImg\插画15.webp.jpg                          ', 5, 3)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (59, N'插画', N'骨笛', CAST(N'2018-04-27T23:19:18.437' AS DateTime), N'<h3>大家好我来表演一个丢人(投稿）= = 这个是贾湖骨笛的拟人 灵感来源于骨笛的材料来自鹤翅骨所以在绘制的时候参考丹顶鹤 听了好几遍的骨笛声 笛声飘渺 宛如步入九千年的仙境般梦幻 于是也在设计中加入了轻飘飘（？）的感觉 中国最早的乐器真的是非常魅力呢（ps：p2字丑慎入OTZ）</h3>

<p><img src="https://i0.hdslb.com/bfs/album/d9b48f2eb2e89813a7be65beb4c36956baf0ec7e.jpg@.webp" /></p>
', N'Img\ACGImg\插画1.webp.jpg                           ', 5, 5)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (60, N'插画', N'龙山蛋壳黑陶杯', CAST(N'2018-04-27T23:28:27.070' AS DateTime), N'<h3>龙山蛋壳黑陶杯！初见第一次看见此杯时 第一眼就被他高挑的设计吸引住了 极具美感黑和带有奢华之气形态不禁想到这样的杯是不是一位尊贵的女性使用？哈哈哈哈虽然只是猜想 应该为礼器更合适它的精致 这个孩子也是大致模仿了按黑陶杯的体态创作的！ 希望有人喜欢她=3=</h3>

<p><img src="https://i0.hdslb.com/bfs/album/3fcdab16829c72563ee2bef36fa5bae9470c6890.jpg@.webp" /></p>
', N'Img\ACGImg\插画6.webp.jpg                           ', 5, 4)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (61, N'插画', N'莲鹤方壶', CAST(N'2018-04-27T23:29:17.560' AS DateTime), N'<h3>太阳神鸟金箔拟人，金灿灿</h3>

<p><a href="https://www.bilibili.com/p/2869152" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/84d7bc5a548d1a1e150385672161f700d085b3b1.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画10.webp.jpg                          ', 5, 3)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (62, N'插画', N'太阳神鸟金箔', CAST(N'2018-04-27T23:29:58.230' AS DateTime), N'<p>&nbsp;</p>

<h3>太阳神鸟金箔拟人，金灿灿</h3>

<p><a href="https://www.bilibili.com/p/2869152" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/84d7bc5a548d1a1e150385672161f700d085b3b1.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画13.webp.jpg                          ', 5, 3)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (63, N'插画', N'莲鹤方壶', CAST(N'2018-04-27T23:30:50.863' AS DateTime), N'<p>&nbsp;</p>

<h3>太阳神鸟金箔拟人，金灿灿</h3>

<p><a href="https://www.bilibili.com/p/2869152" target="_blank"><img alt="" src="https://i0.hdslb.com/bfs/album/84d7bc5a548d1a1e150385672161f700d085b3b1.jpg@.webp" /></a></p>
', N'Img\ACGImg\插画6.webp.jpg                           ', 5, 3)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (64, N'视频', N'国宝拟人-妇好鸮尊', CAST(N'2018-04-28T15:17:45.890' AS DateTime), N'video\1.2018-03-30 17-18-01_1(Av21561879,P1).Mp4', N'Img\ACGImg\国宝拟人-妇好鸮尊.jpg                          ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (65, N'视频', N'越王勾践剑与吴王夫差矛', CAST(N'2018-04-28T15:19:45.223' AS DateTime), N'video\1.P1(Av22346597,P1).Mp4', N'Img\ACGImg\越王勾践剑与吴王夫差矛.jpg                        ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (66, N'视频', N'万岁通天帖：我以残躯荐轩辕', CAST(N'2018-04-28T15:20:15.497' AS DateTime), N'video\1.1(Av19280404,P1).Mp4', N'Img\ACGImg\万岁通天帖：我以残躯荐轩辕.jpg                      ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (67, N'视频', N'国家宝藏】千里江山图', CAST(N'2018-04-28T15:20:55.947' AS DateTime), N'video\1.1(Av21329693,P1).Mp4', N'Img\ACGImg\{ND81EVGMUXZIS`_T`3J54R.png            ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (68, N'视频', N'【国家宝藏-如果文物会说话】妇好鸮尊：唯愿君臣千万世', CAST(N'2018-04-28T15:21:41.507' AS DateTime), N'video\1.1(Av20563736,P1).Mp4', N'Img\ACGImg\3ZJF}A}]OY`NU5DUG@X9}AG.png            ', 5, 1)
INSERT [dbo].[ACG] ([Pro_ID], [Pro_Class], [Pro_Title], [Pro_Time], [Pro_Content], [Pro_Img], [User_ID], [Tally_ID]) VALUES (69, N'视频', N'【国宝拟人】当国宝变成帅气的小哥哥并撩了你！', CAST(N'2018-04-28T15:22:17.713' AS DateTime), N'video\1.P1(Av19619051,P1).Mp4', N'Img\ACGImg\当国宝变成帅气的小哥哥并撩了你.jpg                    ', 5, 1)
SET IDENTITY_INSERT [dbo].[ACG] OFF
SET IDENTITY_INSERT [dbo].[Action] ON 

INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (12, N'国宝复活计划2', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国宝复活计划2.png', CAST(N'2018-04-29T13:47:01.787' AS DateTime))
INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (13, N'国宝复活计划3', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国宝复活计划3.png', CAST(N'2018-04-29T13:47:14.253' AS DateTime))
INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (14, N'国宝复活计划4', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国宝复活计划4.png', CAST(N'2018-04-29T13:47:30.513' AS DateTime))
INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (15, N'国宝复活计划5', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国家复活计划5.png', CAST(N'2018-04-29T13:47:42.617' AS DateTime))
INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (16, N'国宝复活计划6', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国宝复活计划6.png', CAST(N'2018-04-29T13:47:56.003' AS DateTime))
INSERT [dbo].[Action] ([Act_ID], [Act_Title], [Act_Content], [Act_Img], [Act_Time]) VALUES (17, N'国宝复活计划7', N'<p><img id="Image1" src="http://localhost:54210/Img/ActionImg/%E5%9B%BD%E5%AE%9D%E6%8B%9F%E4%BA%BA%E5%BD%A2%E8%B1%A1%E5%BE%81%E9%9B%86.png" /></p>', N'Img\ActionImg\国宝复活假话7.png', CAST(N'2018-04-29T13:48:08.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[Action] OFF
SET IDENTITY_INSERT [dbo].[Classification] ON 

INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (1, N'青铜器')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (2, N'玉器')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (3, N'陶瓷')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (4, N'金银器')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (5, N'钱币')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (6, N'雕塑')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (7, N'书画 ')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (8, N'漆器')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (9, N'家具')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (10, N'铜镜 ')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (11, N'织绣')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (12, N'文房四宝')
INSERT [dbo].[Classification] ([Class_ID], [Class_Name]) VALUES (13, N'紫砂器')
SET IDENTITY_INSERT [dbo].[Classification] OFF
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([Coll_ID], [User_ID], [Pro_ID], [collect]) VALUES (1, 5, 67, N'收藏        ')
SET IDENTITY_INSERT [dbo].[Collection] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Comments_ID], [Comments_Content], [Comments_Time], [User_ID], [Pro_ID]) VALUES (1, N'<p>SHIOYANFALOF M</p>
                                                                                                                                                                                                                                                                                                                                                                                         ', CAST(N'2018-04-24T23:41:21.297' AS DateTime), 5, 2)
INSERT [dbo].[Comments] ([Comments_ID], [Comments_Content], [Comments_Time], [User_ID], [Pro_ID]) VALUES (2, N'<p>累死了<img alt="" src="/ckfinder/userfiles/images/1.jpg" style="height:487px; width:854px" /></p>
                                                                                                                                                                                                                                                                                                             ', CAST(N'2018-04-24T23:45:35.990' AS DateTime), 5, 9)
INSERT [dbo].[Comments] ([Comments_ID], [Comments_Content], [Comments_Time], [User_ID], [Pro_ID]) VALUES (3, N'<p>&nbsp;RNFOQN FOPN NMFP OM[M [&nbsp;</p>
,                                                                                                                                                                                                                                                                                                                                                                   ', CAST(N'2018-04-26T11:11:18.803' AS DateTime), 5, 2)
INSERT [dbo].[Comments] ([Comments_ID], [Comments_Content], [Comments_Time], [User_ID], [Pro_ID]) VALUES (4, N',                                                                                                                                                                                                                                                                                                                                                                                                               ', CAST(N'2018-04-26T11:11:31.817' AS DateTime), 5, 2)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Cull] ON 

INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (1, N'青铜神树', N'Img\CullImg\青铜神树夏代.jpg                            ', N'三星堆出土的青铜神树，通高达到了396厘米，铜树底座呈穹窿形，构拟出三山相连的“神山”意向，座上铸饰，象征太阳的纹路与云气纹。', 1, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (3, N'司母戊鼎', N'Img\CullImg\司母戊鼎 西周.jpg                           ', N'重量约832.84千克，高度达133厘米、口长110厘米、口宽79厘米', 2, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (4, N'四羊方尊', N'Img\CullImg\四羊方尊 商朝.jpg                           ', N'四羊方尊作为全国排名第三的十大传世国宝曾多次出国展览，并作为中国古文物的精华和古代青铜工艺的杰作编入中小学历史教科书和各类教材 。', 2, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (5, N'西汉长信宫灯', N'Img\CullImg\西汉长信宫灯.jpg                            ', N'灯体通高48厘米，重15.85公斤。', 4, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (6, N'千里江山图', N'Img\CullImg\千里江山图.jpg                             ', N'该画作纵51.5厘米，横1191.5厘米，绢本，青绿设色，无款', 8, 7)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (7, N'金缕玉衣', N'Img\CullImg\金缕玉衣.jpg                              ', N'皇帝和高级贵族死后穿用的殓服，外观与人体形状相同。', 4, 2)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (8, N'瓷母', N'Img\CullImg\瓷母.jpg                                ', N'瓷母，是指清朝乾隆年间烧制的一件86厘米高的大瓷瓶，学者们至今还没给它取一个准确又响亮的名字，一些权威图录上称其为各色釉大瓶，还不如约定俗成的瓷母好听。', 10, 3)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (9, N'神仙起居法', N'Img\CullImg\神仙起居法.jpg                             ', N',杨凝式书,纸本,手卷,纵27cm,横21.2cm.草书8行', 7, 7)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (10, N'朱碧山银槎', N'Img\CullImg\朱碧山银槎.jpg                             ', N'此槎是由白银制，周身作桧柏纹理，形如老树杈枒。此银槎杯为铸成后加以雕刻，头、手、云履等部分是铸成后接焊的，接焊处混然无迹。', 9, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (11, N'金瓯永固杯', N'Img\CullImg\金瓯永固杯.jpg                             ', N'清·金瓯永固杯，高12.5cm，口径8cm', 10, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (12, N'清乾隆八徵耄念之宝碧玺', N'Img\CullImg\清乾隆八徵耄念之宝碧玺.jpg                       ', N'<p>纵33cm，横164cm</p>', 10, 2)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (13, N'清乾隆粉彩九桃瓶', N'Img\CullImg\清乾隆粉彩九桃瓶.jpg                          ', N'<p>文物高64.7cm，口径22.2cm，足径20.4cm。瓶直口微撇，直颈，腹部丰满浑圆，圈足。</p>', 10, 2)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (14, N'青花海水龙纹钵', N'Img\CullImg\青花海水龙纹钵.jpg                           ', N'', 10, 3)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (15, N'宣德炉', N'Img\CullImg\宣德炉.jpg                               ', N'<p>宣德炉，是由明宣宗 朱瞻基在大明宣德三年参与设计监造的 铜香炉，简称&ldquo;宣炉&rdquo;。</p>', 10, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (17, N'五牛图', N'Img\CullImg\五牛图.jpg                               ', N'<p>纵20.8厘米，横139.8厘米，无作者款印。</p>', 6, 7)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (18, N'洛神赋图', N'Img\CullImg\洛神赋图.jpg                              ', N'<p>绢本，设色，纵27.1厘米，横572.8厘米。</p>', 5, 7)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (19, N'韩熙载夜宴图', N'Img\CullImg\韩熙载夜宴图.jpg                            ', N'<p>绢本设色，宽28.7厘米，长335.5厘米</p>', 7, 7)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (20, N'金镶九龙戏珠镯', N'Img\CullImg\金镶九龙戏珠镯.jpg                           ', N'<p>外径 8.7cm,内径 5.8cm,厚 1.6cm</p>', 10, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (21, N'鎏金飞廉纹六曲银盘', N'Img\CullImg\鎏金飞廉纹六曲银盘.jpg                         ', N'<p>1970年窖藏出土于陕西省西安市南郊何家村，高1.4厘米，宽15.3厘米。</p>', 6, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (22, N'鸳鸯莲瓣纹金碗', N'Img\CullImg\鸳鸯莲瓣纹金碗.jpg                           ', N'<p>高5.5 厘米，口径13.5厘米。现收藏于<a href="https://baike.sogou.com/v139190.htm" target="_blank">陕西历史博物馆</a>。</p>', 6, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (23, N'鎏金双狐纹双桃形银盘', N'Img\CullImg\鎏金双狐纹双桃形银盘.jpg                        ', N'<p>高1.5，最大径22.5厘米。 盘身为相连的双桃形，浅腹、平底，窄平折沿，锤击成型，纹饰涂金。</p>', 6, 4)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (24, N'曾侯乙编钟', N'Img\CullImg\曾侯乙编钟.jpg                             ', N'<p>是由六十五件青铜编钟组成的庞大乐器，其音域跨五个半八度，十二个半音齐备。</p>', 3, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (25, N'“君幸酒”漆耳杯', N'Img\CullImg\“君幸酒”漆耳杯.jpg                          ', N'<p>杯口长9.4厘米</p>', 4, 8)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (26, N'西汉昭明镜', N'Img\CullImg\西汉昭明镜.jpg                             ', N'<p>昭明镜，宣帝至王莽前流行的一种汉镜。铭文为&ldquo;内清质以昭明，光辉向夫日月，心忽扬而愿忠，然雍塞而不泄&rdquo;。</p>', 4, 10)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (27, N'位至三公镜', N'Img\CullImg\位至三公镜.jpg                             ', N'<p>古镜之一种。<a href="https://baike.sogou.com/v502485.htm" target="_blank">古代铜镜</a>。镜体较厚重，纽特大，花纹较简单，多以连弧纹为主，有的有夔凤等纹饰。上有&ldquo;位至三公&rdquo;等简单铭文，故名。</p>', 4, 10)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (30, N'天命汗钱', N'Img\CullImg\天命汗钱.jpg                              ', N'<p>建元天命，开铸满文&ldquo;天命汗钱&rdquo;为清第一代货币。</p>', 10, 5)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (31, N'靖康通宝', N'Img\CullImg\靖康通宝.jpg                              ', N'<p>&ldquo;靖康通宝&rdquo;、&ldquo;靖康元宝&rdquo;是北宋 宋钦宗时期铸造</p>', 8, 5)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (34, N'政和通宝', N'Img\CullImg\政和通宝.jpg                              ', N'<p>直读光背，径3厘米</p>', 8, 5)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (35, N'人头壶', N'Img\CullImg\人头壶.jpg                               ', N'<p>人头与壶浑然一体，眉目清秀，鼻梁修长，双目上视，嘴唇上翘。</p>', 1, 6)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (36, N'贾湖骨笛', N'Img\CullImg\贾湖骨笛.jpg                              ', N'<p>长22.7厘米</p>', 1, 9)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (37, N'陶鹰鼎', N'Img\CullImg\陶鹰鼎.jpg                               ', N'<p>高36厘米</p>', 1, 6)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (38, N'龙山蛋壳黑陶杯', N'Img\CullImg\龙山蛋壳黑陶杯.jpg                           ', N'<p><strong>蛋壳黑陶杯，新石器时代龙山文化遗物，出土于山东省日照市东海峪龙山文化遗址，现收藏于山东省博物馆。</strong></p>', 1, 3)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (39, N'红山玉龙', N'Img\CullImg\红山玉龙.jpg                              ', N'<p>墨绿色<em>玉龙</em>，高26厘米，完整无缺，体蜷曲，呈C字形。</p>', 1, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (40, N'凌家滩玉版玉龟', N'Img\CullImg\凌家滩玉版玉龟1.jpg                          ', N'<p>安徽含山县<em>凌家</em>遗址旁一处距今4500年的墓地出土长9.4厘米，高4.6厘米，宽7.5厘米厚0.3-0.6厘米。</p>', 1, 2)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (41, N'良渚玉琮王', N'Img\CullImg\良渚玉琮王.jpg                             ', N'<p>此玉琮通高8.9厘米、上射径17.1&mdash;17.6厘米、下射径16.5&mdash;17.5厘米、孔外径5厘米、孔内径3.8厘米。</p>', 1, 2)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (42, N'镶嵌绿松石铜牌饰', N'Img\CullImg\镶嵌绿松石铜牌饰1.jpg                         ', N'<p>夏代文物，1984年秋 偃师二里头遗址出土。</p>', 2, 1)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (43, N'殷墟嵌绿松石甲骨', N'Img\CullImg\殷墟嵌绿松石甲骨1.jpg                         ', N'<p>甲骨文又称&ldquo;契文&rdquo;、&ldquo;甲骨卜辞&rdquo;、殷墟文字或&ldquo;龟甲兽骨文&rdquo;。</p>', 1, 13)
INSERT [dbo].[Cull] ([Cull_ID], [Cull_Name], [Cull_Img], [Cull_Content], [Dyn_ID], [Class_ID]) VALUES (44, N'后母戊鼎', N'Img\CullImg\后母戊鼎.jpg                              ', N'<p>后母戊鼎（原称司母戊鼎），又称后母戊大方鼎、后母戊方鼎。</p>', 2, 1)
SET IDENTITY_INSERT [dbo].[Cull] OFF
SET IDENTITY_INSERT [dbo].[Dyn] ON 

INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (1, N'史前时代')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (2, N'夏商')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (3, N'春秋战国')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (4, N'秦汉')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (5, N'魏晋南北朝')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (6, N'隋唐')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (7, N'五代十国')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (8, N'宋')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (9, N'元')
INSERT [dbo].[Dyn] ([Dyn_ID], [Dyn_Name]) VALUES (10, N'明清')
SET IDENTITY_INSERT [dbo].[Dyn] OFF
SET IDENTITY_INSERT [dbo].[Inform] ON 

INSERT [dbo].[Inform] ([Inform_ID], [User_ID], [Pro_ID], [results]) VALUES (6, 5, 2, N'等待处理结果              ')
SET IDENTITY_INSERT [dbo].[Inform] OFF
SET IDENTITY_INSERT [dbo].[Leavewords] ON 

INSERT [dbo].[Leavewords] ([Leavewords_ID], [Leavewords_Content], [Leavewords_Time], [User_ID], [News_ID]) VALUES (1, N'<p>回复一下</p>
', CAST(N'2018-04-26T12:19:00.433' AS DateTime), 5, 1)
SET IDENTITY_INSERT [dbo].[Leavewords] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (1, 8, N'乾隆"瓷母"大瓶1.51亿成交 买家来自中国(图)                         ', CAST(N'2018-04-24T17:47:03.037' AS DateTime), N'<p>人民网北京9月18日电 据悉，在美国波士顿斯纳金拍卖会上，备受瞩目的第96号拍品、有着&ldquo;瓷母&rdquo;之称的清朝乾隆年间大瓷瓶最终以22,000,000美元落槌，含佣金成交价为24,723,000美元，约合人民币1.51亿元。据上海第一财经频道财经评论员、制片人项立平在微博所述，该拍品为电话委托竞得，买家来自国内。</p>

<p>该拍品高34.375英寸(约合87.3厘米)，有5处小修，为通运公司(Ton-Ying &amp; Company)旧藏，因在窑变的地方有一条很大的&ldquo;冲&rdquo;，故拍前估价仅为15万至25万美元。</p>

<p>上月，这件&ldquo;乾隆御窑各色釉大瓶&rdquo;一在网上亮相，立刻引起了业内人士的极大关注。尽管有个别行家对这件&ldquo;瓷母&rdquo;的真实性表示怀疑，但多个专家&ldquo;倾向于看真&rdquo;。数位藏家都已前往现场一睹其究竟。</p>', NULL, N'Img\NewsImg\瓷母.jpg                                                                                  ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (2, 6, N'北宋 王希孟《千里江山图》：稀世珍宝                                ', CAST(N'2018-04-24T17:50:08.330' AS DateTime), N'<p>几个星期前去故宫，看了王希孟的《千里江山图》。&ldquo;天才少年&rdquo;王希孟所创作的这件作品确实是一幅宏伟巨作，能在半年之内凭一己之力完成近12米长的长卷实属不易。</p>

<p>　　《千里江山图》最妙之处当然是它的构图，如何将一幅高度只有半米，而长度近12米的绢本长卷巧妙而合理地布局，确实需要天赋。但是仔细观看画面，会发现这幅作品表现的山水特征忽南忽北，风格多变，既有典型江南风格的披麻皴，亦有宋代画院流行的斧劈皴，既有典型的二李一路的青绿山水，又有文人的水墨情趣，绘画风格相当复杂，而在技法上各部分的表现水准亦不太统一，时好时坏。</p>

<p>　　整幅画，画法最出色的地方当属后景的渲染部分，为了达到雾气萦绕的效果，画家通常会在完成山体之后，增染一层淡淡的水色。渲染的难度在于如何染得均匀、轻薄又不留痕迹，因此染色的时间、用笔的干湿程度要非常讲究。画面太干时染，色彩会浮在绢上渗透不到山体之中，融合不自然，而如果画面太湿时染，则山体已有的颜色容易走样，画面不够清爽。在绢本上进行渲染要比纸本的难度更大。《千里江山图》后景的晕染非常出色，非几十年功力，无法实现。</p>

<p>相比之下，前景部分某些树石的画法则略显稚嫩，比如树的枝干、茅屋和桥的线条力度较弱，画家对于笔的控制能力也有欠缺，更像是学画不久之人的手笔，与后景老练的渲染技法形成鲜明的对比，不禁令人怀疑这几部分是否出于同一个人之手。</p>

<p>　　观此画后，又读到学界一直有质疑此画为集体所作，而并非由王希孟一人所画。最早将此画与王希孟联系在一起的文字是蔡京题在画后的这段题跋：&ldquo;政和三年闰四月八日赐，希孟年十八岁，昔在画学为生徒，召入禁中文书库，数以画献，未甚工。上知其性可教，遂诲谕之，亲授其法。不逾半岁，乃以此图进。上嘉之，因以赐臣京，谓天下士在作之而已。&rdquo;</p>

<p>　　蔡京的跋中提到此画为徽宗所赐，蔡京的这段文字与其说是赞赏希孟的画功，不如说是变相地称赞徽宗调教有方，一位十八岁的画院学徒经徽宗半年的指导便进步神速，达到如此之水准，除了自身的努力，与老师的教导自然分不开。</p>

<p>　　宣和时期，徽宗定期组织大臣们聚会观摹书画，这是宋代皇室的一个传统。太宗开创了北宋的御书文化，仁宗开始染指绘事，至北宋晚期徽宗将御书与祥瑞的理念融合在御画创作中。内府的书画观摩活动有助于促进君臣关系，有着很强的政治寓意。在这种场合下，受宠的大臣们会得到御赐的书画，这对于臣子来说无疑是一种极大的荣耀。</p>

<p>　　我们无法确定蔡京是在怎样的一种场合下受赐此画，但是必定是将受赐一事视为一件值得炫耀的喜事，因此作跋于画后，对画作进行赞美亦在情理之中，但是此跋中却不见明显的溢美之词，而只是对赐画的时间和希孟的背景做了简单的交代，即使是这样也未写明希孟的姓氏。如今，我们是通过清初收藏家梁清标的题签和宋荦的题画诗确认了此画的作者，但是二者的考证过程我们并不清楚。</p>

<p>　　当然，要搞清楚一幅宋代古画的全部传承经历需要花费大量的时间和精力，即便是这样，也很有可能只是得到有缺憾的结论。如果只是单纯地从审美的角度来看，此画还是非常值得近距离观赏的，毕竟今天流传下来的宋画精品不多，如此的巨幅之作更是凤毛麟角，一幅北宋的长卷融合了南北风光，院体和文人绘画的特点，既保留了唐法又具有典型的北宋山水特征，的确算是一件稀世珍宝了。（21世纪经济报道）</p>', NULL, N'Img\NewsImg\千里江山.jpg                                                                                ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (3, 9, N'神仙起居法——闲在居士                                       ', CAST(N'2018-04-24T17:52:38.553' AS DateTime), N'<p>我国古老的健身法很多，今发一篇简便易行且收效显著的《神仙起居法》，此法流传了十一个世纪，被无数人印正，是行之有效的养身功法。而且此功法收不收功不做强求，简便易行不会出偏。在古本《易筋经》有关于此法的记载，马王堆出土帛书也有此功法记叙。一九六五年，金一鸣老师在苏州教拳时，在怡园中发现也有此功法石刻，另五代时大书法家杨凝式亦书有《神仙起居法》手卷纸本。</p>

<p>&nbsp;</p>

<p>上图书法文字如下：&ldquo;神仙起居法。行住坐卧处，手摩胁与肚。心腹通快时，两手肠下踞。踞之彻膀腰，背拳摩肾部。才觉力倦来，即使家人助。行之不厌频，昼夜无穷数。岁久积功成，渐入神仙路。&rdquo;</p>

<p>此书为杨凝式七十六岁时的作品，以小行草书,作品随意点画，不假思索，用墨浓淡相间，时有枯笔飞白。书字结势于攲侧险劲中求平正，且行间字距颇疏，在继承唐代书法的基础上，以险中求正的特点创立新风格，尽得天真烂漫之趣，是杨凝式行草书传世作品的代表作。</p>

<p>神仙起居法煅练方法：</p>

<p>此术主要是在睡前和起床前运用，故名：起居法。神仙之名，因此术长期习练可使人身体健康，延年益寿，故以神仙之名誉之。</p>

<p>1、息静神逸，站桩、端坐或自然散盘都可以，以舒适为度。</p>

<p>2、双手按摩两肋，左手摩脾区，右手摩肝区，在肋骨尽处用大拇指沿左右来回按摩至微有热感为止。</p>

<p>3、双手食指、中指、无名指和小指自下而上推磨腹部，从阴埠前起至前胸中部胸骨下两肋中间止；然后双手大拇指由胸骨下起至阴埠前止,自上而下推磨腹部。由上而下再由下而上为一次，共推磨36次。</p>

<p>4、手掌下移至腹部，以神阙穴为中心，由内向外作顺时针旋转三十六圈，然后再由外向内作逆时针旋转三十六圈。</p>

<p>5、等到心腹畅快时，手掌变为握空拳，用拳眼处上下摩擦后腰两肾处（命门两旁），至发热发烫疲倦，也可以请家人帮助继续按摩，至家人也疲倦为止。</p>

<p>6、然后双手回到下腹部，交叉于下丹田，静养15分钟，吸气三口即可收功。每日早晚各一次。</p>

<p>此法最主要的是按摩肾部，熟练后可不限次数，但初练时还是由轻至重逐渐增加次数为宜，初练上下按摩肾部，至发热两臂发麻为度，一般60次左右即可。肾在命门两旁，命门为调节全身平横的轴心，为上下体管辖之枢纽，按摩两肾必然加强命门功能。中医认为，周身元气出于肾，肾水足则气自旺，养于胃，胃得其气，则气自壮。久练此法可加强胃肠功能，使身体能吸收更多营养，同时有通便功能，月余可改善便秘。尤其是久摩两肾，可固本盈精，使肾壮精足，气旺神清，身体壮健，精力充沛,对肾虚病症大有改善。如能坚持锻练定享大年，这就是原文所说的日久功成，逐步走向神仙长寿之路的意思</p>', NULL, N'Img\NewsImg\神.jpg                                                                                   ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (4, 7, N'《楚王梦：金缕玉衣与永生》：解读中国古代墓葬仪式                          ', CAST(N'2018-04-24T22:49:14.633' AS DateTime), N'<p>在中国古代，人们认为死亡是生命的延续，因此将墓穴精心设计为&ldquo;灵魂不死&rdquo;的来世道场，并随葬兵马俑、乐舞陶俑、马拉战车、珠宝及玉石等冥器。12 月 16 日，位于美国密苏里州堪萨斯城的纳尔逊阿特金斯美术馆 (Nelson-Atkins Museum of Art) 举办了《楚王梦：金缕玉衣与永生》 (Dreams of the Kings: A Jade Suit for Eternity) 展览，通过展出二十世纪中叶在中国江苏省北部近 100 座古墓中发掘出土的精美文物，让世界了解中国古代墓葬仪式。</p>

<p>纳尔逊阿特金斯美术馆首席执行官兼馆长祖利安&bull;祖格扎戈伊蒂亚 (Juli&aacute;nZugazagoitia)表示：&ldquo;人类对永生之梦的追求长久不衰。本次展览中展出了迄今为止<a href="http://exhibit.artron.net/exhibition-11339.html" target="_blank">发现</a>的最高品质金缕玉衣及其他珍贵的随葬品，充分展现了楚王的永生梦想。&rdquo;</p>

<p>此次《楚王梦：金缕玉衣与永生》展览的核心藏品是一件2000 年前真人大小的金线缕结玉衣。这件金缕玉衣使用金线将 4000 多片玉片编缀在一起，不仅耗用材质贵重，而且做工十分精细。玉片成衣后排列整齐，对缝严密，表面平整，颜色协调，令人惊叹不已。玉石是中国最珍贵的材质，由于有着与来世相关的深远、神圣意义，因此自新石器时代以来就备受推崇。在西汉(公元前 206 年至公元 220 年)，王侯贵族死后，入殓者使用金缕玉衣将其遗体完全包裹，意在让人的精气不会外泄，尸骨不腐，以求来世再生。但用金缕玉衣作葬服不仅没有实现王侯贵族们保持尸骨不坏的心愿，反而招来盗墓毁尸的厄运，因此魏文帝曹丕下令禁止使用玉衣，从此玉衣从中国历史上消失了。本次展览中呈献的金缕玉衣是从中国古代保留至今的最精美的<a href="http://shop.artron.net/6013" target="_blank">典藏</a>珍品。</p>

<p><a href="http://shop.artron.net/781" target="_blank">东亚艺术</a>高级主管科林&bull;麦肯齐 (Colin Mackenzie) 表示：&ldquo;这是如此精美的玉器首次在美国进行公开展出，说明了玉石为何是中国最珍贵的材质。中国古代陵墓举世闻名，其中随葬品的精湛工艺和神秘的仪式氛围将会让游客感到惊叹不已。&rdquo;</p>

<p>据了解，《楚王梦：金缕玉衣与永生》展览分为三个部分：宫廷仪式、宴乐歌舞与礼制;战争和权力;以及玉衣与永生。第一部分展示了一系列乐舞陶俑，其中以一件挥舞巾袖、漫妙生姿的舞者俑最为引人瞩目，而另一件巨大的镀金铜盘则反映了古代中国个人卫生的重要性。战争和权力部分推出了一套完整的铁甲、微缩版兵马俑、玉剑配件及一组楚国王侯使用的金、银、铜印玺。最后，玉衣与永生部分探究了中国最珍贵材质发挥的作用，特别是玉石的道德象征及其保护尸骨的效用。</p>', NULL, N'Img\NewsImg\04.jpg                                                                                  ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (5, 8, N'陶瓷“问不倒”张甡，全本贯口说“瓷母”                               ', CAST(N'2018-04-24T22:51:31.680' AS DateTime), N'<p>法制晚报&middot;看法新闻（记者 刘畅）2018年1月6日上午，2017年故宫志愿者年终总结暨汇报展演会在故宫报告厅召开。 随着央视《 国家宝藏》节目的热播，让默默付出的故宫志愿者得以走上台前，他们对文物的热忱之心、专业而生动的讲解、为观众提供的热情服务不禁让电视机前的观众点赞。</p>

<p>特别是作为&ldquo;各种釉彩大瓶&rdquo;&mdash;&mdash;瓷母的护宝人，故宫博物院陶瓷馆志愿者张甡以专业的知识、利索的嘴皮子和超高的颜值收获大批粉丝。</p>

<p>在故宫的展演会上，陶瓷&ldquo;问不倒&rdquo;张甡坦言，由于受时间限制，对瓷母的介绍在节目中有所删减，作为&ldquo;暖场嘉宾&rdquo;张甡给现场观众重现了瓷母的&ldquo;全本&rdquo;介绍，在两分多钟内，一口气儿练了一大段的&ldquo;贯口活儿&rdquo;，引爆现场。</p>', NULL, N'Img\NewsImg\瓷母.jpg                                                                                  ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (6, 10, N'指尖上的银槎 | 苏州朱碧山银槎的发现                               ', CAST(N'2018-04-24T22:53:48.653' AS DateTime), N'<p>元人陶宗仪《辍耕录》记：&ldquo;银工之精于手艺，表表者有声音，有朱碧山、 谢君余、谢君和。&rdquo;谢氏兄弟均为吴县木渎人，与朱碧山为好友。《香祖笔记》载：&ldquo;元人所制银槎最奇古，腹有文，曰至正壬寅，吴门朱华玉甫制。华玉号碧山。&rdquo;《姑苏志》记：&ldquo;银作出木渎，元朱碧山蟹杯甚奇，其法不传。&rdquo;《乾隆吴县志》载：&ldquo;朱碧山，木渎银工，制蟹杯，甚奇。&rdquo;从以上这些史料中，我们初步可以知道朱碧山是元代银器制造名家，其生活、艺术活动在木渎镇一带。</p>

<p>现存的4件朱碧山银槎，虽然都出于他之手，但毕竟不是一个&ldquo;模子&rdquo;里浇出来的，而是凭手工雕琢出来的，所以现存的4件银槎，虽然主体均为一老人一树干，但老人的形态、举止各不相同，而树干的造型及纹理也迥然不同。苏州发现的朱碧山银槎，与姜文所列的两件朱碧山银槎，在造型和式样上有着明显的不同。在苏州发现的朱碧山银槎（如图），高11.4厘米，宽7.5厘米，斜长22厘米。杯呈槎形，槎上坐着一老者，道冠云履，一手抚膝，一手撑于槎面，微微昂着头，望着远处的天际星空，悠然作着凌空云游状。老者身上的衣巾飘拂生动，树干和树根上的纹理弯曲舒展，均达到了出神入化的境界。</p>

<p><br />
银槎是一种酒器，又称槎杯。朱碧山制作的这件银槎，做工考究精细，造型独特，极富艺术价值。</p>

<p><br />
朱碧山是浙江嘉兴人，晚年隐居苏州木渎镇，从事银器制作，尤以制槎形酒杯著称。据专家考证，槎杯乃是朱碧山独创。朱碧山一生中究竟制作了多少槎杯，无法得知。但据有关资料显示，现存世的&ldquo;朱碧山银槎&rdquo;仅为4件，一件在台湾故宫博物院；一件原藏圆明园，清咸丰10年（1860年）英法联军火烧圆明园，银槎被英国侵略军盗出国外，今流落在美国克利夫兰博物馆；一件藏在北京故宫博物院；另一件现由苏州吴中区（原吴县）文管会收藏。虽然它们同称为朱碧山银槎，但对于每一件银槎来说，都是独一无二的孤品。</p>

<p><br />
苏州朱碧山银槎的发现，颇具传奇色彩。</p>

<p><br />
1973年，当时的吴县农村正处于&ldquo;农业学大寨&rdquo;的高潮中，结合农田水利建设，开展了土地平整，搞田地&ldquo;方正化&rdquo;，因此有不少坟墩被平掉，其中也包括一些古墓。在藏书公社社光大队，有几个农民在翻地挖沟时，发掘到陶罐、玉器、砚台等。因当时农民缺乏对文物保护的意识，就将这些出土的东西大多敲碎了。当时的文化站站长闵大宝见到这些出土残片十分心痛，并经常教育农民要爱护文物。事隔半年，村里要购买轧面机。而买轧面机要&ldquo;回收旧铜废铁&rdquo;，大家只好到屋角各处东寻西翻，结果有个农民找到一件黑不溜秋的小铜器，就交到了村干部手里，之后就一直放在办公桌上，也不当回事。有一次，被闵大宝看到了，他反复端详后，虽不能识别这是件什么文物，但可以断定这小银器是件古玩宝贝。后来，他拿给下乡的苏州文物商店的王姓收购员看，又经国家文物专家鉴定，在银槎树干后侧发现刻有&ldquo;至正乙酉朱碧山造&rdquo;一行铭文，证实了这件稀世之宝。</p>

<p><br />
1987年，苏州朱碧山银槎曾参加过全国流散文物展览，1994年被鉴定为国家一级文物。</p>', NULL, N'Img\NewsImg\青铜神树夏代.jpg                                                                              ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (7, 35, N'“洛南人头壶”上央视！你见过吗？                                  ', CAST(N'2018-04-27T22:01:38.300' AS DateTime), N'<p><strong>洛南手机报12月31日消息（采编人/陈逸）</strong>：由中宣部、国家文物局、中央电视台共同实施的国家涵养工程百集纪录片《如果国宝会说话》第一季，将于2018年元旦在中央电视台纪录频道首播。洛报君获悉，<strong>该片将从出土自陕西洛南的国宝级文物&ldquo;洛南人头壶&rdquo;开始讲起</strong>，将国有馆藏文物的内涵和故事，通过活泼生动的电视语言呈现给观众，从国宝看国脉，思国魂，用文物讲文化，谈文明。</p>

<p>《如果国宝会说话》中的国宝来自全国近百家博物馆和考古研究所、50余处考古遗址，诞生时代从新石器时代到宋元明清，历史跨度达8000年。纪录片共100集，每集五分钟，采用&ldquo;一集主讲一宝&rdquo;的形式，介绍来自全国各地的100件国宝。本次播出的第一批内容共25集，将以每天五集的密度播出。</p>

<p>主创介绍，这是一部用文物讲文物、用文物梳理文明的纪录片。这部纪录片讲述的国宝故事的主角包括西安半坡博物馆的<strong>人头壶（出土自陕西洛南）</strong>、河南博物馆的贾湖骨笛、中国国家博物馆的陶鹰鼎、山东省文物考古研究所的龙山蛋壳黑陶杯、宝鸡青铜器博物院的何尊、三星堆博物馆的三星堆青铜人像、湖北省博物馆的越王勾践剑等文物。</p>

<p>据西安半坡遗址博物馆工作人员介绍，<strong>&ldquo;洛南人头壶&rdquo;于1953年在陕西省洛南县灵口镇焦村旧石器遗址出土，是该馆的镇馆之宝</strong>。该文物刻画出一个鲜活真实的仰韶文化时期人类面容，人头与壶身结合还酷似一个孕妇，是一件盛液体的生活用具。其体现了母系氏族社会对女性和人类繁衍的重视。她的微笑神秘而端庄，使人静静凝望，刻画手法细腻传神，甚为感人。</p>', NULL, N'Img\NewsImg\人头壶1.jpg                                                                                ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (8, 36, N'中国古老乐器“贾湖骨笛”获复原 上海之春将吹奏8000年前“中国之音”               ', CAST(N'2018-04-27T22:09:18.737' AS DateTime), N'<p>新华社上海４月９日电（记者孙丽萍）记者９日获悉，上海音乐学院教授、竹笛演奏家唐俊乔领衔的艺术家团队已成功复原８０００年前中国先民们制作、吹奏的贾湖骨笛，并以此为灵感创作了大型原创民族器乐剧《笛韵天籁》。在今年５月举行的上海之春国际音乐节上，《笛韵天籁》将登台首演，让人们倾听来自远古的&ldquo;中国之音&rdquo;。</p>

<p>　　骨笛是我国最古老的乐器。事实上，笛是最具中国文化韵味的乐器之一。与笛同属中国民族乐器的二胡、琵琶等，无不具有舶来文化基因，唯有笛子是源自中国文化、土生土长的乐器。上世纪８０年代，考古工作者曾在河南舞阳县贾湖村发掘出３０多支用丹顶鹤尺骨制成的骨笛。贾湖骨笛是我国目前出土的年代最早的乐器实物，也被认定为世界上最早的可吹奏乐器。</p>

<p>　　上海音乐学院教授唐俊乔介绍说，贾湖骨笛出土之际，素有&ldquo;江南笛王&rdquo;之誉的浙派笛艺创始人赵松庭受邀吹奏骨笛，留下了珍贵的音乐资料。赵松庭曾希望复原贾湖骨笛并登台演奏，但他心愿未了便抱憾辞世。</p>

<p>　　２０１６年底，作为赵松庭的女弟子，唐俊乔申请国家艺术基金支持继续推动复原工作。唐俊乔邀请资深制笛师王建宏共同复原贾湖骨笛，历时一年，试验６０余次。根据我国已有考古发掘的相关研究成果，先后采用红木、紫檀、杉木、紫竹、湘妃竹、苦竹、树脂合成材料等进行反复实践和实验。最终，他们以树脂合成材料和苦竹复原出了&ldquo;非常接近&rdquo;贾湖骨笛的音色。对比当年赵松庭留下的音频资料，上海音乐学院团队复原后的&ldquo;仿制骨笛&rdquo;与贾湖骨笛音色接近，但音准更准确、音质更丰满。</p>

<p>　　在上海音乐学院举办的新闻发布会上，同为赵松庭弟子的浙江民族管弦协会会长蒋国基即兴吹奏了仿制骨笛。记者看到，骨笛形状小巧，仅十多公分长，两端保留鸟骨特征，骨头上有大小不同的孔洞，吹奏时笛声悠扬，音色高亢嘹亮。</p>

<p>　　上海音乐学院院长林在勇介绍，笛是中国民族乐器，也是中华文化的载体与文化符号之一。成功复原贾湖骨笛后，上音组建了阵容强大的创作团队，包括作曲家许舒亚、多媒体音乐制作人代晓蓉、中国歌剧舞剧院编剧徐瑛、中央芭蕾舞团一级编导费波等，共同创作完成了大型原创民族器乐剧《笛韵天籁》，把８０００年&ldquo;笛&rdquo;的故事活态呈现于舞台之上，对源远流长的中华文化&ldquo;进行一次别开生面的艺术解读&rdquo;。</p>

<p>　　据悉，《笛韵天籁》将由唐俊乔、蒋国基和魏思骏主演，艺术风格跨界创新，在音乐上融合了民族器乐、交响乐、电子音乐、合唱等多种元素，在视觉上则以多媒体方式展现梦幻唯美效果，充满中国气质。</p>', NULL, N'Img\NewsImg\贾湖骨笛1.jpg                                                                               ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (9, 37, N'华州文物陶鹰鼎央视亮相 曾被当鸡饲料盆                               ', CAST(N'2018-04-27T22:14:17.610' AS DateTime), N'<p>在节目中第三个亮相的陶鹰鼎，被列入195件（组）禁止出境展览文物名单之中，堪称中国目前最顶级的文物之一。它于1987年出土于华县（今华州），和那个年代绝大多数出土文物一样，这件国宝并没有引起发现者殷思义的足够重视，甚至被当做鸡饲料盆使用。</p>

<p>它的命运转变出现在第二年，来自北京的考古队在当地进行考古发掘，在做田野调查时意外地发现了这件文物。殷思义便将这件文物主动上交给考古队，并由他们带回北京，最终被国家博物馆收藏。</p>

<p>国家博物馆的专家曾评价说：&ldquo;在已发现的新石器时代陶器中，鸟类造型的陶器，目前仅见此一件，是原始制陶工艺的杰作。其设计巧妙，比例相宜，造型优美，形态逼真，制作精致，注重造型与实用的完美结合，至今仍是国内少见的珍品，是五千年前我们祖先聪明智慧的结晶。同时，以陶鹰鼎为首的动物造型陶塑开启了商代鸟兽形青铜器造型之先河。&rdquo;</p>', NULL, N'Img\NewsImg\陶鹰鼎1.jpg                                                                                ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (10, 38, N'厉害了我的祖先 《如果国宝会说话》吐槽笑cry                           ', CAST(N'2018-04-27T22:23:36.307' AS DateTime), N'<p>当纪录片开始追&ldquo;潮流&rdquo;，当高冷文物变得&ldquo;不正经&rdquo;，当严肃的央视开始卖萌，种种不可思议的事件放在一起，会产生怎样的化学反应？正在央视纪录频道黄金时间播出的百集纪录片《如果国宝会说话》，告诉你如何将&ldquo;高大上&rdquo;玩出新意，在昨晚的播出首秀中，我们的老祖宗用各式各样的&ldquo;萌&rdquo;艺术征服大批观众，引得观众疯狂打call。</p>

<p>来自山东省文物考古研究院&ldquo;0.2毫米的精致&rdquo;的龙山蛋壳黑陶杯，以及中国国家博物馆的红山玉龙，它们无不显示着早期造物者的神奇创造力。远古&ldquo;黑科技&rdquo;的蛋壳黑陶杯，精湛工艺在现代社会也难以复原，&ldquo;小蛮腰&rdquo;让人不住称赞，网友也不断为古人打call，&ldquo;厉害了我的老祖宗&rdquo;。红山玉龙这一集，盘点千年龙形象在我国的演变，将&ldquo;我们都是龙的传人&rdquo;这一思想再次发扬光大了，满满都是民族自豪感。</p>', NULL, N'Img\NewsImg\龙山蛋壳黑陶杯1.jpg                                                                            ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (11, 40, N'最早的八卦图什么样 凌家滩玉版玉龟告诉你                              ', CAST(N'2018-04-27T22:35:41.013' AS DateTime), N'<p>2018年初，央视《如果国宝会说话》纪录片在央视开播，其中一集讲述故宫收藏的凌家滩出土的玉龟和玉版。究竟它们是如何发现的，有着怎样的重要意义？作为曾经在凌家滩遗址工作22年、5次主持凌家滩遗址考古发掘的领队，我很愿意和大家讲讲考古发掘背后的故事。</p>

<p>凌家滩遗址是1985年发现的，1987年5月进行第一次试掘。这次试掘在1985年所发现墓葬的地方开了4个5&times;5米的探方。第一次试掘就在墓葬M4中发现了玉版和玉龟，在M4墓口的上方正中央的位置，还发现了一个重达4.25公斤的石钺。</p>

<p>当时一看到出土了这么大一件石钺，大家都不敢动，因为意识到下面肯定会有非常重大的发现。按照程序绘图、照相、编号后，我们将巨大的石钺取出，开始清理墓葬。这座墓葬的随葬品是如此丰富，尤其是玉器，精美无比，数量众多，令照相、绘图、编号的考古人忙得不亦乐乎。然而在整理发掘完毕回到合肥打开相机冲洗时，才发现当时拍的胶卷都没有曝光，最后只冲洗出一张来，而冲洗出来的这张正好拍的就是玉版和玉龟。</p>

<p>据上古传说，《周易》和《洪范》来源于河图、洛书。传说伏羲时，有龙马从黄河出现，背负河图；夏禹时，有神龟从洛水出现，背负洛书。《周易》中，&ldquo;易有太极，是生两仪，两仪生四象，四象生八卦。&rdquo;玉版图形中的四方和八方，正与以上四象和八卦的概念相合。四象和八卦，在季节概念上，就相当于农历的四时八节。玉版图形表现的有可能是远古的洛书和最早的八卦。</p>

<p>远古没有文字，人们使用钻孔、画圈的办法计数，以代替五行交替时节转换。因此，河图、洛书就是历法，墓中出土的玉龟和玉版，几乎可以证实5300年前就有这种历法存在，也反映了我国夏代或夏代之前的律历制度。历法的出现表明当时的农业已经得到大发展。古人将他们的核心认识以最简单朴素的笔画表现出来，每一个细微之处都可能承载着极大的信息量。</p>

<p>玉版上的圆形就是一个例证。玉版上的大圆和小圆，特别是小圆的左边弧度很不规整。古凌家滩人为什么不把它画圆呢？按照古凌家滩人琢玉的技术，琢一个圆很容易。带着这个问题我观察了凌家滩的日出日落，终于找到了答案。在凌家滩，春夏秋冬，日出时太阳都显得很圆，日落的时候，刚开始，太阳也显得非常圆，但逐渐往下落，太阳就像玉版上的小圆一样不那么规整了。多次观察证明玉版上的大圆小圆是用写实的手法表现太阳一天的运行。</p>

<p>除了玉版上复杂的纹饰，一同出土的玉龟也有着重要的意义，这件玉龟为什么会分为上下龟甲，这其中应该还有一些我们所认识不到的问题在里头。除了1987年我们发掘的编号为4的大墓，2007年发掘的编号为23的大墓中，还出土了三件玉龟，更重要的是，与玉龟一起出土的还有&ldquo;玉签&rdquo;。玉签上还有两道刻痕。这可能是中国最早发现玉签上面有刻画符号的标志，应是作为占卜使用的。</p>

<p>在新石器时代，玉龟主要发现在红山文化、大汶口文化、凌家滩文化、良渚文化中。关于凌家滩文化年代，曾经做过几个碳14测年，一个数据是距今5500年，一个是距今5300年，还有一组数据将近6000年。这些年代数据与红山文化年代相当，表明两个文化在同时代都发展到这样一个高度。大汶口文化出土的玉龟较多，都是作为占卜工具使用，但是凌家滩玉版所展示的不仅仅是占卜，还有天文学。良渚文化出土的玉龟，比凌家滩文化晚1000年，显然是受了凌家滩的影响。</p>

<p>在考古发掘简报发表之后，凌家滩发现的玉龟和玉版引起了学术界的高度关注。饶宗颐先生曾经撰文写道，&ldquo;这是中国考古学革命胜利的成果，也是历史里程碑性的发现&rdquo;。关于它的讨论今天仍在进行中。</p>

<p>如果仅仅是出土了大量与日常生活相关的玉器，还不足以诠释凌家滩的含义，当体现了古凌家滩人智慧及精神世界的玉龟、原始八卦图玉版，穿越5000多年的时光，散发着遥远而神秘的气息出现在我们的面前时，就不能不让我们对这块土地，以及曾经生活在这块土地上的古人的智慧叹为观止。</p>', NULL, N'Img\NewsImg\凌家滩玉版玉龟.jpg                                                                             ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (12, 41, N'将良渚先民精湛玉雕技艺传向全世界                                  ', CAST(N'2018-04-27T22:39:51.907' AS DateTime), N'<p>&ldquo;这是一个年轻的节目，多年轻？也就上下五千年吧。&rdquo;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;看《国家宝藏》的时候，总能听到001号讲解员张国立的这句开场白。云淡风轻中，透着一股小骄傲。</p>

<p>&nbsp;&nbsp;&nbsp;<strong>&nbsp;那么，上下五千年的起点在哪里？</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&ldquo;其中一个就是我守护的出土地&mdash;&mdash;浙江省杭州市余杭区良渚&hellip;&hellip;&rdquo;周冬雨说。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;玉琮王，是周冬雨守护的国宝，《国家宝藏》节目收官之后，入选为九大&ldquo;国宝&rdquo;之一。称王者，自有独到魅力之处。&ldquo;首先是大，其次是纹饰独特繁复，五千年前的良渚先民没有金属制琢玉工具，居然能雕刻出如此精美的神人兽面纹图案&hellip;&hellip;&rdquo;玉雕大师蒋家洪复刻首个&ldquo;玉琮王&rdquo;时，也是这样被&ldquo;降伏&rdquo;的。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>1比1复刻出反山&ldquo;玉琮王&rdquo;</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&ldquo;1毫米居然刻四五根线&hellip;&hellip;&rdquo;2009年应邀浙江省博物馆复刻&ldquo;玉琮王&rdquo;时，看到瓶窑镇反山墓出土的原件，惊叹得说不出话。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;良渚，水中的一个美丽小洲。如果不是80年考古层层拨开，你很难把它与中华文明的起点联系在一起。玉琮王就是有力的实物物证，它重约6500克，直径约17厘米，高8.9厘米，装饰性线刻细若游丝，是已发现的良渚玉琮中最大、最重、做工最精美的一件，被誉为&ldquo;琮王&rdquo;。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;蒋家洪说，五千年前，并没有金属制的玉雕工具。&ldquo;这样一件精致的玉琮，可能要耗尽玉工毕生精力，琮体的四面四角都用浮雕技法，雕刻了神人兽面纹。&rdquo;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&ldquo;浙博当时只需要1件玉琮王，我一口气做了12件，有2件很满意，最后浙博2件都收去了。&rdquo;蒋家洪说，2014年又做了一整套反山12号墓的出土玉器，大大小小1000多件。&ldquo;都是1比1复刻的，每一件都不一样。&rdquo;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;在瓶窑镇蒋家洪良渚玉雕工作室，随地可见各种各样的良渚元素的玉器，有成品，有毛坯，有周边良渚元素设计的产品。日常，他就是这样带领2名徒弟制作良渚玉器的。&ldquo;别看小小的一个图案，用现代的工具最起码得四五天&hellip;&hellip;&rdquo;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;真的这么难？记者在工作台前坐下，拿起一件玉琮半成品以及一把雕刻刀，在蒋家洪的指导下，开始制作玉琮了。&ldquo;一定要平整地磨过去，要平均用力，不然玉面就不平。&rdquo;记者反复试了很多遍，&ldquo;如果力道总是不均，这复刻品恐怕就会失败&hellip;&hellip;&rdquo;蒋家洪说。如果不是亲自体验，难以想象，古人就是这么夜以继日、年复一年的打磨玉琮。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&ldquo;专家说，这块玉琮王可能是一个工匠用一生时间来完成的，我个人认为是两代人，因为刀工看起来像是两个人的。&rdquo;潜心研究良渚玉雕多年，蒋家洪有自己的看法。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>把&ldquo;良渚文明&rdquo;推广到全世界</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;作为一名土生土长的瓶窑人，蒋家洪在这块地方生活足足52年了。一开始，蒋家洪并不是做玉雕的。&ldquo;年轻的时候喜欢走街串巷收一些民间的古玩小物。收着收着，就发现不少当地人家都有那种鸡骨白的小玉器。那时还不知道是良渚时期的玉，很便宜，一个小样几十到一百不等。&rdquo;蒋家洪说，随着良渚考古的推进，当地人才恍然大悟：原来，家里&ldquo;祖传&rdquo;的这种小玉管竟是五千年前的先民制作的。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;蒋家洪一下子被良渚文化迷住了。&ldquo;我就前往苏州，跟着师傅学玉雕，研究良渚玉雕的特点，依葫芦画瓢，不断地摸索。&rdquo;慢慢地，蒋家洪在圈子里有了小名气。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;1999年起，他开始复制良渚玉器，&ldquo;记不清多少了，反正书上有的，我都复制过了，我自己还满意的，有1000多件。&rdquo;良渚人用的玉矿在哪里，至今是个谜，但他和专家的断定一致：&ldquo;应该是就地取材。&rdquo;这些年，他常常在天目山一带翻山越岭，只是沧海桑田，很难找到线索。痴迷如他，竟然用昂贵的和田玉复制了一件&ldquo;玉琮王&rdquo;，被身边的朋友们说是&ldquo;疯子&rdquo;。</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;2011年，蒋家洪被确定为第二批余杭非物质文化遗产传承人，也开启了良渚玉雕文化的传承与推广。2014年，蒋家洪作为民间艺人代表团成员赴友好城市荷兰韦尔特市进行文化艺术交流，他与荷兰雕塑家共同完成了一段长达3米的圆木雕塑造型，在圆木两端镶嵌了良渚玉雕。这件雕塑品被放置在韦尔特市新落成的市政府内，成为两地友谊的见证。</p>', NULL, N'Img\NewsImg\良渚玉琮王1.jpg                                                                              ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (13, 42, N'洛阳博物馆二里头玉器成暑期新焦点                                  ', CAST(N'2018-04-27T22:47:40.953' AS DateTime), N'<p>&ldquo;在学术界，绿松石一直被作为文化意义上的&lsquo;玉&rsquo;而受到关注。在二里头时代，它也的确与玉器一样，作为高端消费品为贵族阶层所使用，具有身份象征的意义。&rdquo;许宏说。</p>

<p>除了这件龙形器，能代表当时绿松石镶嵌工艺的，还有二里头遗址出土的兽面铜牌饰，也是目前所见最早的铜牌饰。其中，四期出土的一件铜牌饰置于墓主人胸前，正面用许多碎小的长方形绿松石片很整齐地镶嵌成兽面纹，四角四个穿孔钮上下两两对称，可系绳，形象生动，制作精巧。</p>

<p><strong>承上启下玉文化</strong></p>

<p>陈雪香说，从目前出土的玉器来看，二里头时期虽然还没有形成规律的用玉制度，玉器制造业并不十分发达，却是夏代玉器的代表性形态，对中国源远流长的玉文化有着承上启下的意义。二里头不同文化分期的用玉情况和治玉技术的进展的背后，则是中原王朝势力的消长。</p>

<p>在二里头文化二期，开始出现柄形器，三期则有各类大型有刃礼器出现。这些带刃的礼玉，都与其本来的装柄方式和用途无关，而是表现贵族的权威，作为在宫廷上昭示君臣关系的&ldquo;玉圭&rdquo;或&ldquo;笏&rdquo;来使用的。</p>

<p>&ldquo;在二里头遗址都邑，这些玉礼器与宫城、大型宫殿建筑群的出现大体同步，表明王权以及用以维持王权的宫廷礼仪已大体完备。&rdquo;许宏说。</p>', NULL, N'Img\NewsImg\镶嵌绿松石铜牌饰.jpg                                                                            ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (14, 43, N'殷墟嵌绿松石甲骨：刻辞骨柶 | 走寻                                ', CAST(N'2018-04-27T22:53:34.563' AS DateTime), N'<p>甲骨文，是中国目前可见最早的成熟文字。此刻，我们写出的横竖撇捺，曾经一笔一划地刻在骨头上记录天意。因为刻骨，所以铭心。</p>

<p>甲骨文又称&ldquo;契文&rdquo;、&ldquo;甲骨卜辞&rdquo;、殷墟文字或&ldquo;龟甲兽骨文&rdquo;。是汉字的早期形式，是现存中国王朝时期最古老的一种成熟文字，最早出土于河南省安阳市殷墟。距今约3600多年的历史。</p>

<p>内容为记载盘庚迁殷至纣王间二百七十年之卜辞，为最早之书迹。殷商有三大特色，即信史、饮酒及敬鬼神；也因为如此，这些决定渔捞、征伐、农业诸多事情的龟甲，才能在后世重见天日，成为研究中国文字重要的资料。</p>

<p>商代已有精良笔墨，书体因经契刻，风格瘦劲锋利，具有刀锋的趣味。受到文风盛衰之影响，其大至可分为五期，即第一期：盘庚、小辛、小乙、武丁；第二期：祖庚、祖甲；第三期：廪辛、康丁；第四期：武乙、文丁；第五期：帝乙、帝辛。</p>', NULL, N'Img\NewsImg\殷墟嵌绿松石甲骨1.jpg                                                                           ')
INSERT [dbo].[News] ([News_ID], [Cull_ID], [News_Title], [News_Time], [News_Content], [News_Url], [News_Img]) VALUES (15, 44, N'"司"母戊鼎为何改名"后"母戊鼎                                  ', CAST(N'2018-04-27T22:59:19.437' AS DateTime), N'<p>司（后）母戊鼎是目前已知中国古代最重的青铜器，其名称是按照惯例依据铜鼎内壁上的铭文而定的。但直到今天，这几个铭文的释读结果依然没有定论，争论最多的就是铭文中最上方的那个字究竟是&ldquo;司&rdquo;还是&ldquo;后&rdquo;。</p>

<p>　　这个表面上看似乎最容易辨认的&ldquo;司&rdquo;字，为什么却会引起专家学者们的争论呢？</p>

<p>　　这其实是因为在铸造司（后）母戊鼎的晚商时期，无论是甲骨文还是金文中的用字都存在正反通用的情况。</p>

<p>　　也就是说，铭文中这个看上去是&ldquo;司&rdquo;的字形，其实也完全有可能是&ldquo;后&rdquo;的异体。也正因此，司（后）母戊鼎的命名从一开始就陷入了争论。</p>

<p>　　晚商时期，同一片甲骨上的甲骨文中存在&ldquo;后&rdquo;&ldquo;司&rdquo;字形混用的情况。</p>

<p>　　司（后）母戊鼎最初是在1939年被河南安阳武官村的农民所发现，但为了避免文物落入日寇手中，村民们在将它掘出之后又重新埋入地下，直到1946 年4月，这座大鼎才再次被挖出。</p>

<p>　　在大鼎重新出土后不久，《申报》特派员邵慎之就赶到河南安阳进行了实地采访，在10月27日的《申报》报道中，他最早将大鼎内的铭文释读为&ldquo;后妻戊&rdquo;&ldquo;后戊妻&rdquo;或者&ldquo;妻戊&rdquo;。</p>

<p>　　但是仅在21天后，古文字学家张凤就在《中央日报》上发表了《安阳武官村出土方鼎铭文考释》一文，认为大鼎内的铭文应该释读为&ldquo;司母戊&rdquo;，这一观点后来被官方采用。</p>

<p>　　同年7月，司（后）母戊鼎被收归国有，并在10月运往南京作为蒋介石六十大寿的献礼，此后收藏于当时的中央博物院筹备处，其名采用&ldquo;司母戊方鼎&rdquo;。</p>

<p>　　1948年5月，司母戊鼎作为重要展品在南京中山门内半山园举办的国立北平故宫博物院、中央博物院筹备处联合展览会上展出。</p>

<p>　　1949年4月南京解放，&ldquo;司母戊鼎&rdquo;未及运往台湾，留藏当时的中央博物院筹备处。1950年3月，&ldquo;司母戊鼎&rdquo;入藏刚刚成立的南京博物院。1959年，又被征调至中国历史博物馆（中国国家博物馆前身），并在&ldquo;中国通史陈列&rdquo;中展出。在此期间，这件文物一直沿用&ldquo;司母戊鼎&rdquo;的名称。</p>

<p>　　不过，尽管官方收藏机构一直采用&ldquo;司母戊鼎&rdquo;的名称，但争论却从未停止过。反对者们质疑&ldquo;司母戊鼎&rdquo;这一名称的理由除了在字形上&ldquo;司&rdquo;也可以释为&ldquo;后&rdquo;以外，从铭文含义的解释来讲，&ldquo;后母戊鼎&rdquo;比&ldquo;司母戊鼎&rdquo;更加合理。</p>

<p>　　将铭文解读为&ldquo;司母戊&rdquo;的观点，普遍认为这里的&ldquo;司&rdquo;同&ldquo;祀&rdquo;，铭文的含义为&ldquo;祭祀母亲戊&rdquo;。但这样的解释却不符合青铜器铭文内容的惯例，在商周时期表示作器者或者受器者的青铜器铭文制度中，并不存在动宾关系的句式。</p>

<p>　　但如果将其释读为&ldquo;后母戊&rdquo;就完全符合惯例。&ldquo;后&rdquo;字在古时有&ldquo;君王&rdquo;&ldquo;领袖&rdquo;的含义，也可延伸为&ldquo;王后&rdquo;&ldquo;母后&rdquo;之意。如春秋时期的《竹书纪年》中就以&ldquo;后&rdquo;指夏朝的君王，即&ldquo;夏后&rdquo;；晚商甲骨文中则有将商王武丁之妻妇好称为&ldquo;后妇好&rdquo;的例证。</p>

<p>　　按照这样的解释，&ldquo;后母戊&rdquo;即可表示是商王的母亲戊，这样的释文在句式上似乎显得更为合理。</p>

<p>　　基于以上几点原因，2010-2011年基本完成改扩建工程之后，国家博物馆在出版图录和专题展览中将原来的&ldquo;司母戊鼎&rdquo;正式更名为&ldquo;后母戊鼎&rdquo;。</p>

<p>　　不过，国家博物馆的这次更名并没能终结半个多世纪以来的争论，学术界内的争议仍在继续。</p>', NULL, N'Img\NewsImg\后母戊鼎1.jpg                                                                               ')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[ReplyComments] ON 

INSERT [dbo].[ReplyComments] ([ReplyComments_ID], [ReplyComments_Content], [ReplyComments_Time], [Comments_ID], [User_ID]) VALUES (1, N'<p>FJ OPA JMF&#39;LM[ pfnm[&#39;m f[;jmm</p>
', CAST(N'2018-04-24T23:41:39.603' AS DateTime), 1, 5)
INSERT [dbo].[ReplyComments] ([ReplyComments_ID], [ReplyComments_Content], [ReplyComments_Time], [Comments_ID], [User_ID]) VALUES (2, N'<p>图书上传</p>
', CAST(N'2018-04-24T23:45:56.413' AS DateTime), 2, 5)
INSERT [dbo].[ReplyComments] ([ReplyComments_ID], [ReplyComments_Content], [ReplyComments_Time], [Comments_ID], [User_ID]) VALUES (3, N'<p>DJKLHNLK&nbsp;</p>
', CAST(N'2018-04-26T11:11:09.807' AS DateTime), 1, 5)
SET IDENTITY_INSERT [dbo].[ReplyComments] OFF
SET IDENTITY_INSERT [dbo].[ReplyLeavewords] ON 

INSERT [dbo].[ReplyLeavewords] ([ReplyLeavewords_ID], [ReplyLeavewords_Comment], [ReplyLeavewords_Time], [Leavewords_ID], [User_ID]) VALUES (1, N'<p>二级回复</p>
', CAST(N'2018-04-26T12:19:14.010' AS DateTime), 1, 5)
INSERT [dbo].[ReplyLeavewords] ([ReplyLeavewords_ID], [ReplyLeavewords_Comment], [ReplyLeavewords_Time], [Leavewords_ID], [User_ID]) VALUES (2, N'<p>再回复一次</p>
', CAST(N'2018-04-26T12:19:25.727' AS DateTime), 1, 5)
SET IDENTITY_INSERT [dbo].[ReplyLeavewords] OFF
SET IDENTITY_INSERT [dbo].[Tally] ON 

INSERT [dbo].[Tally] ([Tally_ID], [Tally_Name]) VALUES (1, N'国家宝藏      ')
INSERT [dbo].[Tally] ([Tally_ID], [Tally_Name]) VALUES (2, N'汉服        ')
INSERT [dbo].[Tally] ([Tally_ID], [Tally_Name]) VALUES (3, N'青铜器       ')
INSERT [dbo].[Tally] ([Tally_ID], [Tally_Name]) VALUES (4, N'瓷器        ')
INSERT [dbo].[Tally] ([Tally_ID], [Tally_Name]) VALUES (5, N'金银器       ')
SET IDENTITY_INSERT [dbo].[Tally] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([User_ID], [User_Name], [User_Password], [User_Img], [User_Email], [User_Phone]) VALUES (2, N'李         ', N'123456', N'Img\UserImg\头像1.jpg', N'705135798@qq.com', N'17770849635')
INSERT [dbo].[UserInfo] ([User_ID], [User_Name], [User_Password], [User_Img], [User_Email], [User_Phone]) VALUES (5, N'黎志峰       ', N'lzf1996', N'Img\UserImg\lzf.jpg', N'lzfsuifeng@foxmail.com', N'13155828951')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[ACG]  WITH CHECK ADD  CONSTRAINT [FK_ACG_Tally] FOREIGN KEY([Tally_ID])
REFERENCES [dbo].[Tally] ([Tally_ID])
GO
ALTER TABLE [dbo].[ACG] CHECK CONSTRAINT [FK_ACG_Tally]
GO
ALTER TABLE [dbo].[ACG]  WITH CHECK ADD  CONSTRAINT [FK_ACG_UserInfo] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[ACG] CHECK CONSTRAINT [FK_ACG_UserInfo]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_ACG] FOREIGN KEY([Pro_ID])
REFERENCES [dbo].[ACG] ([Pro_ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_ACG]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [FK_Collection_UserInfo] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [FK_Collection_UserInfo]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_ACG] FOREIGN KEY([Pro_ID])
REFERENCES [dbo].[ACG] ([Pro_ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_ACG]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
ALTER TABLE [dbo].[Cull]  WITH CHECK ADD  CONSTRAINT [FK_Cull_Classification] FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Classification] ([Class_ID])
GO
ALTER TABLE [dbo].[Cull] CHECK CONSTRAINT [FK_Cull_Classification]
GO
ALTER TABLE [dbo].[Cull]  WITH CHECK ADD  CONSTRAINT [FK_Cull_Dyn] FOREIGN KEY([Dyn_ID])
REFERENCES [dbo].[Dyn] ([Dyn_ID])
GO
ALTER TABLE [dbo].[Cull] CHECK CONSTRAINT [FK_Cull_Dyn]
GO
ALTER TABLE [dbo].[Inform]  WITH CHECK ADD  CONSTRAINT [FK_Inform_ACG] FOREIGN KEY([Pro_ID])
REFERENCES [dbo].[ACG] ([Pro_ID])
GO
ALTER TABLE [dbo].[Inform] CHECK CONSTRAINT [FK_Inform_ACG]
GO
ALTER TABLE [dbo].[Inform]  WITH CHECK ADD  CONSTRAINT [FK_Inform_UserInfo] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[Inform] CHECK CONSTRAINT [FK_Inform_UserInfo]
GO
ALTER TABLE [dbo].[Leavewords]  WITH CHECK ADD  CONSTRAINT [FK_Leavewords_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[Leavewords] CHECK CONSTRAINT [FK_Leavewords_User]
GO
ALTER TABLE [dbo].[ReplyComments]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComments_Comments] FOREIGN KEY([Comments_ID])
REFERENCES [dbo].[Comments] ([Comments_ID])
GO
ALTER TABLE [dbo].[ReplyComments] CHECK CONSTRAINT [FK_ReplyComments_Comments]
GO
ALTER TABLE [dbo].[ReplyComments]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComments_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[ReplyComments] CHECK CONSTRAINT [FK_ReplyComments_User]
GO
ALTER TABLE [dbo].[ReplyLeavewords]  WITH CHECK ADD  CONSTRAINT [FK_ReplyLeavewords_Leavewords] FOREIGN KEY([Leavewords_ID])
REFERENCES [dbo].[Leavewords] ([Leavewords_ID])
GO
ALTER TABLE [dbo].[ReplyLeavewords] CHECK CONSTRAINT [FK_ReplyLeavewords_Leavewords]
GO
ALTER TABLE [dbo].[ReplyLeavewords]  WITH CHECK ADD  CONSTRAINT [FK_ReplyLeavewords_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[UserInfo] ([User_ID])
GO
ALTER TABLE [dbo].[ReplyLeavewords] CHECK CONSTRAINT [FK_ReplyLeavewords_User]
GO
USE [master]
GO
ALTER DATABASE [NT] SET  READ_WRITE 
GO
