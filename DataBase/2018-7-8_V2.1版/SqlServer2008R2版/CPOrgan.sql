USE [CPOrgan]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_Dep]    Script Date: 2018-7-8 18:50:11 ******/
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
/****** Object:  Table [dbo].[CP_DepUser]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_DepUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ShowOrder] [int] NULL,
 CONSTRAINT [PK_CP_DepUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CP_Role]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleUserIds] [nvarchar](max) NULL,
	[RoleUserNames] [nvarchar](max) NULL,
	[RoleUserSql] [nvarchar](max) NULL,
	[RoleRemark] [nvarchar](max) NULL,
 CONSTRAINT [PK_CP_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CP_RoleUser]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_RoleUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CP_RoleUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CP_User]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NULL,
	[UserPwd] [nvarchar](50) NULL,
	[UserName] [nvarchar](15) NULL,
	[IsCanLogin] [bit] NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[OfficePhone] [nvarchar](50) NULL,
	[IsOutUser] [bit] NULL,
	[UserWXId] [nvarchar](50) NULL,
	[UserSex] [int] NULL,
	[UserDescrip] [nvarchar](150) NULL,
	[UserPhotoName] [nvarchar](100) NULL,
	[UserPhotoPath] [nvarchar](100) NULL,
	[UserSignName] [nvarchar](100) NULL,
	[UserSignPath] [nvarchar](100) NULL,
 CONSTRAINT [PK_CP_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CP_UserIdentity]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_UserIdentity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserKey] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginTime] [datetime] NULL,
	[LoginDevice] [int] NULL,
 CONSTRAINT [PK_CP_UserLoginSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_CP_Dep]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_CP_Dep]
AS
SELECT   dbo.CP_Dep.*
FROM      dbo.CP_Dep


GO
/****** Object:  View [dbo].[V_CP_DepUser]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_CP_DepUser]
AS
SELECT   dbo.CP_DepUser.*
FROM      dbo.CP_DepUser


GO
/****** Object:  View [dbo].[V_CP_Role]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_CP_Role]
AS
SELECT   dbo.CP_Role.*
FROM      dbo.CP_Role




GO
/****** Object:  View [dbo].[V_CP_RoleUser]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_CP_RoleUser]
AS
SELECT   dbo.CP_RoleUser.*
FROM      dbo.CP_RoleUser



GO
/****** Object:  View [dbo].[V_CP_User]    Script Date: 2018-7-8 18:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_CP_User]
AS
SELECT   dbo.CP_User.*
FROM      dbo.CP_User




GO
SET IDENTITY_INSERT [dbo].[CP_Dep] ON 

INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (1, N'某集团公司', N'', N'', -1, 1, 1, 1, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (2, N'信息中心', N'', N'', 1, 2, 1, 10, 1, N'管理员', N'', N'', NULL, N'', N'2', N'测试用户一')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (3, N'办公室', N'', N'', 1, 2, 1, 30, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (4, N'财务室', N'', N'', 1, 2, 1, 20, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (5, N'北京研发中心', N'', N'', 1, 2, 1, 40, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (6, N'研发一部', N'', N'', 5, 2, 1, 10, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (7, N'研发二部', N'', N'', 5, 2, 1, 20, NULL, N'', N'', N'', NULL, N'', N'', N'')
INSERT [dbo].[CP_Dep] ([DepId], [DepName], [DepShortName], [DepShortCode], [ParentId], [DepType], [DepState], [ShowOrder], [DepMainLeaderId], [DepMainLeaderName], [DepViceLeaderIds], [DepViceLeaderNames], [DepSupervisorId], [DepSupervisorName], [UserIds], [UserNames]) VALUES (8, N'研发三部', N'', N'', 5, 2, 1, 30, NULL, N'', N'', N'', NULL, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[CP_Dep] OFF
SET IDENTITY_INSERT [dbo].[CP_DepUser] ON 

INSERT [dbo].[CP_DepUser] ([Id], [DepId], [UserId], [ShowOrder]) VALUES (1004, 2, 1, 3)
INSERT [dbo].[CP_DepUser] ([Id], [DepId], [UserId], [ShowOrder]) VALUES (1005, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[CP_DepUser] OFF
SET IDENTITY_INSERT [dbo].[CP_Role] ON 

INSERT [dbo].[CP_Role] ([RoleId], [RoleName], [RoleUserIds], [RoleUserNames], [RoleUserSql], [RoleRemark]) VALUES (1, N'全体用户', N'2,1', N'测试用户一,管理员', N'', N'')
INSERT [dbo].[CP_Role] ([RoleId], [RoleName], [RoleUserIds], [RoleUserNames], [RoleUserSql], [RoleRemark]) VALUES (2, N'系统管理员', N'1', N'管理员', N'', N'')
INSERT [dbo].[CP_Role] ([RoleId], [RoleName], [RoleUserIds], [RoleUserNames], [RoleUserSql], [RoleRemark]) VALUES (1009, N'流程发起人_动态', N'', N'', N'SELECT CreateUserName,CreateUserId FROM CPFLOW.DBO.Flow_Instance WHERE InsId=${CPFlow.InsId()}', N'')
SET IDENTITY_INSERT [dbo].[CP_Role] OFF
SET IDENTITY_INSERT [dbo].[CP_RoleUser] ON 

INSERT [dbo].[CP_RoleUser] ([Id], [RoleId], [UserId]) VALUES (10, 1, 1)
INSERT [dbo].[CP_RoleUser] ([Id], [RoleId], [UserId]) VALUES (11, 1, 2)
INSERT [dbo].[CP_RoleUser] ([Id], [RoleId], [UserId]) VALUES (1012, 2, 1)
SET IDENTITY_INSERT [dbo].[CP_RoleUser] OFF
SET IDENTITY_INSERT [dbo].[CP_User] ON 

INSERT [dbo].[CP_User] ([UserId], [LoginName], [UserPwd], [UserName], [IsCanLogin], [MobilePhone], [OfficePhone], [IsOutUser], [UserWXId], [UserSex], [UserDescrip], [UserPhotoName], [UserPhotoPath], [UserSignName], [UserSignPath]) VALUES (1, N'admin', N'd41d8cd98f00b204e9800998ecf8427e', N'管理员', 1, N'', N'', 0, N'', 0, N'', N'1-091104191214.jpg', N'Form201710291829260020/2017/11/5/081403/1-091104191214.jpg', N'', N'')
INSERT [dbo].[CP_User] ([UserId], [LoginName], [UserPwd], [UserName], [IsCanLogin], [MobilePhone], [OfficePhone], [IsOutUser], [UserWXId], [UserSex], [UserDescrip], [UserPhotoName], [UserPhotoPath], [UserSignName], [UserSignPath]) VALUES (2, N'test1', N'd41d8cd98f00b204e9800998ecf8427e', N'测试用户一', 1, N'', N'', 0, N'', 0, N'', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CP_User] OFF
SET IDENTITY_INSERT [dbo].[CP_UserIdentity] ON 

INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15488, N'4415a052-7d87-4cd1-abde-da51d457d629', 1, CAST(N'2018-07-08 14:00:12.643' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15489, N'dbb274c4-0eaa-43c6-87d1-281d9c13d979', 1, CAST(N'2018-07-08 14:54:34.730' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15490, N'085523a2-cedc-45a2-9605-a04f786036a5', 1, CAST(N'2018-07-08 15:07:26.100' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15491, N'36d300d4-71a6-4083-9f6e-7e4d0b7ac4f8', 1, CAST(N'2018-07-08 15:18:51.927' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15492, N'f4b82ef4-1979-45c6-8a11-3c2b281e8d4c', 1, CAST(N'2018-07-08 15:19:25.190' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15493, N'968f1877-049d-487a-b7ef-0a12b4919e25', 1, CAST(N'2018-07-08 15:20:56.450' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15494, N'1c0f24b0-a9b4-4a11-bd66-d15e15fd2b3e', 1, CAST(N'2018-07-08 15:22:29.070' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15495, N'81781f81-69f3-4c94-8f8b-bb968d943d0a', 1, CAST(N'2018-07-08 15:52:19.897' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15496, N'96275dc7-31eb-474b-8b89-ede997637b6e', 1, CAST(N'2018-07-08 15:57:34.337' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15497, N'2aef7658-c4a8-47f7-b2f6-47ef58809e2d', 1, CAST(N'2018-07-08 16:00:32.450' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15498, N'bed9dcbf-63ae-4b17-a529-60011b0724c7', 1, CAST(N'2018-07-08 16:06:00.270' AS DateTime), 1)
INSERT [dbo].[CP_UserIdentity] ([Id], [UserKey], [UserId], [LoginTime], [LoginDevice]) VALUES (15499, N'6346cc0e-158c-4deb-9b0f-b8e31d15d4ac', 1, CAST(N'2018-07-08 16:59:59.047' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CP_UserIdentity] OFF
ALTER TABLE [dbo].[CP_DepUser]  WITH CHECK ADD  CONSTRAINT [FK_CP_DepUser_CP_Dep] FOREIGN KEY([DepId])
REFERENCES [dbo].[CP_Dep] ([DepId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CP_DepUser] CHECK CONSTRAINT [FK_CP_DepUser_CP_Dep]
GO
ALTER TABLE [dbo].[CP_DepUser]  WITH CHECK ADD  CONSTRAINT [FK_CP_DepUser_CP_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CP_User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CP_DepUser] CHECK CONSTRAINT [FK_CP_DepUser_CP_User]
GO
ALTER TABLE [dbo].[CP_RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_CP_RoleUser_CP_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[CP_Role] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CP_RoleUser] CHECK CONSTRAINT [FK_CP_RoleUser_CP_Role]
GO
ALTER TABLE [dbo].[CP_RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_CP_RoleUser_CP_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CP_User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CP_RoleUser] CHECK CONSTRAINT [FK_CP_RoleUser_CP_User]
GO
/****** Object:  StoredProcedure [dbo].[CP_ReadDataPager]    Script Date: 2018-7-8 18:50:11 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CP_Dep"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CP_Dep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CP_Dep'
GO
