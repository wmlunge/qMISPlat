USE [CPTest]
GO
/****** Object:  Table [dbo].[CP_Dep]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_Dep](
	[DepId] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](50) NULL,
	[DepShortName] [nvarchar](50) NULL,
	[DepShortCode] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
	[DepType] [int] NULL,
	[DepState] [int] NULL,
	[ShowOrder] [int] NULL,
	[DepMainLeaderId] [int] NULL,
	[DepMainLeaderName] [nvarchar](50) NULL,
	[DepViceLeaderIds] [nvarchar](50) NULL,
	[DepViceLeaderNames] [nvarchar](50) NULL,
	[DepSupervisorId] [int] NULL,
	[DepSupervisorName] [nvarchar](50) NULL,
	[UserIds] [nvarchar](max) NULL,
	[UserNames] [nvarchar](max) NULL,
 CONSTRAINT [PK_CP_Dep] PRIMARY KEY CLUSTERED 
(
	[DepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CusBasicInfo]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CusBasicInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CusCode] [nvarchar](50) NULL,
	[CusName] [nvarchar](100) NULL,
	[AutoIndex] [int] NULL,
	[CusType] [nvarchar](50) NULL,
	[CusIndustry] [nvarchar](50) NULL,
	[FZRUserId] [int] NULL,
	[FZRUserName] [nvarchar](50) NULL,
	[Website] [nvarchar](250) NULL,
	[BasicInfo] [nvarchar](max) NULL,
	[Address] [nvarchar](250) NULL,
	[AttachName] [nvarchar](max) NULL,
	[AttachPath] [nvarchar](max) NULL,
	[AddTime] [datetime] NULL,
	[AddUserId] [int] NULL,
	[AddUserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Test_CusInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CusContacts]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CusContacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CId] [int] NOT NULL,
	[RName] [nvarchar](50) NULL,
	[RMobile] [nvarchar](50) NULL,
	[RQQ] [nvarchar](50) NULL,
	[REmail] [nvarchar](50) NULL,
	[RRemark] [nvarchar](500) NULL,
 CONSTRAINT [PK_客户联系人信息] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ISO_QJForm]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ISO_QJForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QJUserId] [int] NOT NULL,
	[QJUserName] [nvarchar](50) NOT NULL,
	[QJDepId] [nvarchar](50) NOT NULL,
	[QJDepName] [nvarchar](500) NULL,
	[QJType] [nvarchar](50) NULL,
	[QJStartTime] [datetime] NULL,
	[QJEndTime] [datetime] NULL,
	[QJRemark] [nvarchar](max) NULL,
	[QJSignInfo] [nvarchar](50) NULL,
 CONSTRAINT [PK_ISO_QJForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ISO_QJFormChild]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ISO_QJFormChild](
	[Id] [int] NOT NULL,
	[QJId] [int] NOT NULL,
	[TName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ISO_QJFormChild] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CP_Dep] ON 

INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (1, N'广东某集团公司', N'集团总部', N'', -1, 1, 1, 10, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (2, N'信息中心', N'', N'', 1, 2, 1, 10, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (3, N'财务室', N'', N'', 1, 2, 1, 20, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (4, N'综合办公室', N'', N'', 1, 2, 1, 30, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (5, N'中山某公司', N'', N'', 1, 1, 1, 40, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (6, N'开发一部', N'', N'', 5, 2, 1, 10, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (7, N'开发二部', N'', N'', 5, 2, 1, 20, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (8, N'开发三部', N'', N'', 5, 2, 1, 30, NULL, N'', N'', N'', NULL, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[CP_Dep] OFF
SET IDENTITY_INSERT [dbo].[CusBasicInfo] ON 

INSERT [dbo].[CusBasicInfo] ([Id], [CusCode], [CusName], [AutoIndex], [CusType], [CusIndustry], [FZRUserId], [FZRUserName], [Website], [BasicInfo], [Address], [AttachName], [AttachPath], [AddTime], [AddUserId], [AddUserName]) VALUES (4, N'KH-20170001', N'9', 1, N'其他客户', N'房地产', 1, N'管理员', N'', N'', N'', N'', N'', CAST(N'2017-11-08 00:00:00.000' AS DateTime), 1, N'管理员')
INSERT [dbo].[CusBasicInfo] ([Id], [CusCode], [CusName], [AutoIndex], [CusType], [CusIndustry], [FZRUserId], [FZRUserName], [Website], [BasicInfo], [Address], [AttachName], [AttachPath], [AddTime], [AddUserId], [AddUserName]) VALUES (5, N'KH-20170002', N'333', 2, N'企业客户', N'房地产', 1, N'管理员', N'55', N'6666777', N'777', N'', N'', CAST(N'2017-11-08 00:00:00.000' AS DateTime), 1, N'管理员')
INSERT [dbo].[CusBasicInfo] ([Id], [CusCode], [CusName], [AutoIndex], [CusType], [CusIndustry], [FZRUserId], [FZRUserName], [Website], [BasicInfo], [Address], [AttachName], [AttachPath], [AddTime], [AddUserId], [AddUserName]) VALUES (1002, N'KH-20170003', N'中国建筑集团股份有限公司', 3, N'其他客户', N'房地产', 1, N'管理员', N'111', N'22
333
444', N'3453452354', N'标准图框A2竖（会签）.dwg,标准图框A3（会签）.dwg', N'Form201711072108040025/2017/11/10/091629/标准图框A2竖（会签）.dwg|Form201711072108040025/2017/11/10/091629/标准图框A3（会签）.dwg', CAST(N'2017-11-10 00:00:00.000' AS DateTime), 1, N'管理员')
INSERT [dbo].[CusBasicInfo] ([Id], [CusCode], [CusName], [AutoIndex], [CusType], [CusIndustry], [FZRUserId], [FZRUserName], [Website], [BasicInfo], [Address], [AttachName], [AttachPath], [AddTime], [AddUserId], [AddUserName]) VALUES (1003, N'KH-20170004', N'ww11', 4, N'企业客户', N'互联网', 2, N'测试用户一', N'', N'', N'', N'', N'', CAST(N'2017-12-09 00:00:00.000' AS DateTime), 1, N'管理员')
INSERT [dbo].[CusBasicInfo] ([Id], [CusCode], [CusName], [AutoIndex], [CusType], [CusIndustry], [FZRUserId], [FZRUserName], [Website], [BasicInfo], [Address], [AttachName], [AttachPath], [AddTime], [AddUserId], [AddUserName]) VALUES (1004, N'KH-20170005', N'76756', 5, N'其他客户', N'房地产', 1, N'管理员', N'', N'', N'', N'', N'', CAST(N'2017-12-09 00:00:00.000' AS DateTime), 1, N'管理员')
SET IDENTITY_INSERT [dbo].[CusBasicInfo] OFF
SET IDENTITY_INSERT [dbo].[CusContacts] ON 

INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (7, 4, N'8888', N'9999', N'', N'', N'')
INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (8, 4, N'666', N'', N'', N'', N'')
INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (9, 5, N'3333999', N'', N'', N'', N'')
INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (10, 5, N'55555999', N'', N'', N'', N'')
INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (1002, 1002, N'2222', N'', N'', N'', N'')
INSERT [dbo].[CusContacts] ([Id], [CId], [RName], [RMobile], [RQQ], [REmail], [RRemark]) VALUES (1003, 1002, N'34444', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[CusContacts] OFF
SET IDENTITY_INSERT [dbo].[ISO_QJForm] ON 

INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-08 00:00:00.000' AS DateTime), CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'asdfasdfasdf99999999', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-09 00:00:00.000' AS DateTime), CAST(N'2017-12-30 00:00:00.000' AS DateTime), N'adsfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (3, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-09 00:00:00.000' AS DateTime), CAST(N'2017-12-30 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (4, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-09 00:00:00.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'eeeettttttt66666', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (5, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-09 00:00:00.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'eeee', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (6, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-28 00:00:00.000' AS DateTime), CAST(N'2018-01-02 00:00:00.000' AS DateTime), N'asdfasdfadsfadfasdfasdfasdfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (7, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-28 00:00:00.000' AS DateTime), CAST(N'2018-01-02 00:00:00.000' AS DateTime), N'asdfasdfadsfadfasdfasdfasdfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (8, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-15 07:35:20.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'阿斯蒂芬阿斯蒂芬af', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (9, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-15 07:35:20.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'阿斯蒂芬阿斯蒂芬af', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (10, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-15 08:39:46.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'ASDFASDFASDF', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (11, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-15 08:39:46.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'ASDFASDFASDF', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (12, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-16 08:27:54.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'ASD', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (13, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-16 08:27:54.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'ASD', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (14, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 00:00:00.000' AS DateTime), CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (15, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 00:00:00.000' AS DateTime), CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (16, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 08:53:01.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (17, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 08:53:01.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (18, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 09:33:44.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (19, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-16 09:33:44.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (20, 2, N'测试用户一', N'2', N'信息中心', N'产假', CAST(N'2017-12-21 07:19:11.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (21, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-21 07:19:11.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (22, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-21 07:31:55.000' AS DateTime), CAST(N'2017-12-30 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (23, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-21 07:31:55.000' AS DateTime), CAST(N'2017-12-30 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1020, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-23 07:10:03.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1021, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-23 07:10:03.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1022, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-23 08:10:49.000' AS DateTime), CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1023, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2017-12-23 08:10:49.000' AS DateTime), CAST(N'2017-12-28 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1024, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-23 08:15:15.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1025, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2017-12-23 08:15:15.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1026, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-23 08:27:26.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1027, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2017-12-23 08:27:26.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1028, 1, N'管理员', N'2', N'信息中心', N'年假', CAST(N'2017-12-23 08:44:31.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (1029, 1, N'管理员', N'2', N'信息中心', N'年假', CAST(N'2017-12-23 08:44:31.000' AS DateTime), CAST(N'2017-12-29 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2020, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-01 17:56:12.000' AS DateTime), CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'阿斯达sdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2021, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-01 17:56:12.000' AS DateTime), CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'阿斯达sdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2022, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-01 18:00:36.000' AS DateTime), CAST(N'2018-01-19 00:00:00.000' AS DateTime), N'dddd', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2023, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-01 18:00:36.000' AS DateTime), CAST(N'2018-01-19 00:00:00.000' AS DateTime), N'dddd', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2024, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-26 00:00:00.000' AS DateTime), N'asdfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2025, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-26 00:00:00.000' AS DateTime), N'asdfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2026, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-02-09 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2027, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-02-09 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2028, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-18 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2029, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-18 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2030, 1, N'管理员', N'2', N'信息中心', N'丧假', CAST(N'2018-01-18 00:00:00.000' AS DateTime), CAST(N'2018-01-31 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2031, 1, N'管理员', N'2', N'信息中心', N'丧假', CAST(N'2018-01-18 00:00:00.000' AS DateTime), CAST(N'2018-01-31 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2032, 1, N'管理员', N'2', N'信息中心', N'年假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-17 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2033, 1, N'管理员', N'2', N'信息中心', N'年假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-17 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2034, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-18 00:00:00.000' AS DateTime), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2035, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-18 00:00:00.000' AS DateTime), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2036, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-26 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2037, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-26 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2038, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-19 00:00:00.000' AS DateTime), CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2039, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-01-19 00:00:00.000' AS DateTime), CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2040, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-19 00:00:00.000' AS DateTime), CAST(N'2018-01-31 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2041, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-19 00:00:00.000' AS DateTime), CAST(N'2018-01-31 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2042, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-31 00:00:00.000' AS DateTime), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'wwr', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2043, 1, N'管理员', N'2', N'信息中心', N'婚假', CAST(N'2018-01-31 00:00:00.000' AS DateTime), CAST(N'2018-02-01 00:00:00.000' AS DateTime), N'wwr', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2044, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-04-19 00:00:00.000' AS DateTime), CAST(N'2018-05-04 00:00:00.000' AS DateTime), N'44444', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2045, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-04-19 00:00:00.000' AS DateTime), CAST(N'2018-05-04 00:00:00.000' AS DateTime), N'44444', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2046, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2018-05-23 00:00:00.000' AS DateTime), CAST(N'2018-06-01 00:00:00.000' AS DateTime), N'asdfwwr', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2047, 1, N'管理员', N'2', N'信息中心', N'病假', CAST(N'2018-05-23 00:00:00.000' AS DateTime), CAST(N'2018-06-01 00:00:00.000' AS DateTime), N'asdfwwr', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2048, 1, N'管理员', N'2', N'信息中心', N'探亲假,事假,丧假,陪产假', CAST(N'2018-06-05 00:00:00.000' AS DateTime), CAST(N'2018-06-07 00:00:00.000' AS DateTime), N'asdfasdf', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2049, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-06 00:00:00.000' AS DateTime), CAST(N'2018-06-15 00:00:00.000' AS DateTime), N'<p>asdfadsfa</p><p>ds</p><p>fas</p><p>df</p><p>ads</p><p>fa</p><p>sdf</p><p>ads</p><p>fa</p><p>sdf</p><p>ads</p><p>f</p><p>ads</p><p>fa</p><p>dsf</p><p>ads</p><p>fa</p><p>dsfadsf</p>', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2050, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-13 00:00:00.000' AS DateTime), CAST(N'2018-06-28 00:00:00.000' AS DateTime), N'<p>asdfasd</p><p>fa</p><p>dsf</p><p>asd</p><p>f</p><p>asdf</p><p>as</p><p>df</p><p>asd</p><p>fas</p><p>df</p><p>asd</p><p>fa</p><p>sd</p><p>fas</p><p>df</p><p>asd</p><p>fas</p><p>df</p><p>ads</p><p>fa</p><p>dsf</p>', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2051, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-11 00:00:00.000' AS DateTime), CAST(N'2018-06-12 00:00:00.000' AS DateTime), N'测试备注初始化', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2052, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-11 00:00:00.000' AS DateTime), CAST(N'2018-06-12 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2053, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-11 00:00:00.000' AS DateTime), CAST(N'2018-06-11 00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[ISO_QJForm] ([Id], [QJUserId], [QJUserName], [QJDepId], [QJDepName], [QJType], [QJStartTime], [QJEndTime], [QJRemark], [QJSignInfo]) VALUES (2054, 1, N'管理员', N'2', N'信息中心', N'产假', CAST(N'2018-06-11 00:00:00.000' AS DateTime), CAST(N'2018-06-11 00:00:00.000' AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[ISO_QJForm] OFF
ALTER TABLE [dbo].[CusBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_CusBasicInfo_CusBasicInfo] FOREIGN KEY([Id])
REFERENCES [dbo].[CusBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[CusBasicInfo] CHECK CONSTRAINT [FK_CusBasicInfo_CusBasicInfo]
GO
ALTER TABLE [dbo].[CusContacts]  WITH CHECK ADD  CONSTRAINT [FK_CusContacts_CusBasicInfo] FOREIGN KEY([CId])
REFERENCES [dbo].[CusBasicInfo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CusContacts] CHECK CONSTRAINT [FK_CusContacts_CusBasicInfo]
GO
ALTER TABLE [dbo].[ISO_QJFormChild]  WITH CHECK ADD  CONSTRAINT [FK_ISO_QJFormChild_ISO_QJForm] FOREIGN KEY([QJId])
REFERENCES [dbo].[ISO_QJForm] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ISO_QJFormChild] CHECK CONSTRAINT [FK_ISO_QJFormChild_ISO_QJForm]
GO
/****** Object:  StoredProcedure [dbo].[CP_ReadDataPager]    Script Date: 2018-7-8 18:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[CP_ReadDataPager] 
  @sqlstr VARCHAR(MAX),               
  @currentpage INT,                      
  @pagesize INT                        
  AS 
  SET NOCOUNT ON 
  DECLARE @P1 INT,                    
   @rowcount INT 
  EXEC sp_cursoropen @P1 OUTPUT,@sqlstr,@scrollopt=1,@ccopt=1,@rowcount=@rowcount OUTPUT  
  SELECT @rowcount AS 总条数
  SET @currentpage=(@currentpage-1)*@pagesize+1 
  EXEC sp_cursorfetch @P1,16,@currentpage,@pagesize 
  EXEC sp_cursorclose @P1 
  SET NOCOUNT OFF


GO
