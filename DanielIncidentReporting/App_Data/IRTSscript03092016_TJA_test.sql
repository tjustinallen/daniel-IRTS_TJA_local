USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'¾¶Ï½\?°NJD\£ZjØt¦*6¿ÕË', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'%ÊVArdÂ.¸ö?Éù*
ð0VyªÞ9Ò
', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [DANIELKIDS\gfatt]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [DANIELKIDS\gfatt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DANIELKIDS\jallen]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [DANIELKIDS\jallen] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DANIELKIDS\mellera]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [DANIELKIDS\mellera] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DANIELKIDS\sjones]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [DANIELKIDS\sjones] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQL$RAPTOR]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [NT Service\MSSQL$RAPTOR] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$RAPTOR]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [NT SERVICE\SQLAgent$RAPTOR] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 3/9/2016 6:56:18 PM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DANIELKIDS\gfatt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DANIELKIDS\jallen]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DANIELKIDS\mellera]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DANIELKIDS\sjones]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$RAPTOR]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLAgent$RAPTOR]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
USE [IRTS]
GO
/****** Object:  Table [dbo].[ContribFactors]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContribFactors](
	[IRP_ID] [int] NOT NULL,
	[CFT_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IRP_ID] ASC,
	[CFT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[ContribFactors] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ContribFactorTypes]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContribFactorTypes](
	[CFT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CFT_Name] [varchar](50) NOT NULL,
	[CFT_Category] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CFT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[ContribFactorTypes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[IncidentReports]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IncidentReports](
	[IRP_ID] [int] IDENTITY(1,1) NOT NULL,
	[IRP_Category] [varchar](100) NULL,
	[IRP_Location] [varchar](500) NULL,
	[IRP_ReportDate] [date] NULL,
	[IRP_IncidentDate] [date] NULL,
	[IRP_VictimFirstName] [varchar](100) NULL,
	[IRP_VictimLastName] [varchar](100) NULL,
	[IRP_ReportOn] [varchar](50) NULL,
	[IRP_ResMgrApprovedDate] [date] NULL,
	[IRP_DeptDirApprovedDate] [date] NULL,
	[IRP_RiskMgrApprovedDate] [date] NULL,
	[IRP_RiskMgrComment] [varchar](1000) NULL,
	[IRP_PreparedByFirstName] [varchar](50) NULL,
	[IRP_PreparedByLastName] [varchar](50) NULL,
	[IRP_Description] [varchar](1000) NULL,
	[IRP_InjuryType] [varchar](250) NULL,
	[IRP_BodyPart] [varchar](250) NULL,
	[IRP_InjuryFollowUp] [varchar](100) NULL,
	[IRP_ApprovalLevelReq] [varchar](50) NULL,
	[IRP_ProgramName] [nvarchar](100) NULL,
	[IRP_Witness] [varchar](1000) NULL,
	[IRP_Notified] [varchar](1000) NULL,
	[IRP_AbuseAllegation] [varchar](200) NULL,
	[IRP_ContribFactor] [varchar](200) NULL,
	[IRP_Death] [varchar](200) NULL,
	[IRP_PoliceFire] [varchar](200) NULL,
	[IRP_SuicideGestures] [varchar](200) NULL,
	[IRP_UnplannedHospitalization] [varchar](200) NULL,
	[IRP_SexualEncounter] [varchar](200) NULL,
	[IRP_SubstanceAbuse] [varchar](200) NULL,
	[IRP_MedicationError] [varchar](200) NULL,
	[IRP_Injury] [varchar](200) NULL,
	[IRP_ClientGrievance] [varchar](200) NULL,
	[IRP_PhysicalRestraint] [varchar](200) NULL,
	[IRP_Seclusion] [varchar](200) NULL,
	[IRP_PropertyDamage] [varchar](200) NULL,
	[IRP_PropertyMissing] [varchar](200) NULL,
	[IRP_Theft] [varchar](200) NULL,
	[IRP_Other] [varchar](200) NULL,
	[IRP_RestraintSTTime] [varchar](200) NULL,
	[IRP_RestraintENTime] [varchar](200) NULL,
	[IRP_SeclusionSTTime] [varchar](200) NULL,
	[IRP_SeclusionENTime] [varchar](200) NULL,
	[IRP_PoliceRepNo] [varchar](200) NULL,
	[IRP_Contrib1] [varchar](200) NULL,
	[IRP_Contrib2] [varchar](200) NULL,
	[IRP_Contrib3] [varchar](200) NULL,
	[IRP_Contrib4] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IRP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[IncidentReports] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Incidents]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Incidents](
	[IRP_ID] [int] NOT NULL,
	[INT_ID] [int] NOT NULL,
	[INC_PoliceReportNo] [varchar](50) NULL,
	[INC_StartTime] [varchar](10) NULL,
	[INC_EndTime] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IRP_ID] ASC,
	[INT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Incidents] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[IncidentTypes]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IncidentTypes](
	[INT_ID] [int] IDENTITY(1,1) NOT NULL,
	[INT_Name] [varchar](50) NULL,
	[INT_Category] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[INT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[IncidentTypes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[IncidentTypes_ContribFactorTypes]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentTypes_ContribFactorTypes](
	[INT_ID] [int] NOT NULL,
	[CFT_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INT_ID] ASC,
	[CFT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[IncidentTypes_ContribFactorTypes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[InjuryFollowUps]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InjuryFollowUps](
	[IFU_ID] [int] NOT NULL,
	[IFU_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IFU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[InjuryFollowUps] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Managers](
	[Mgr_ID] [int] IDENTITY(1,1) NOT NULL,
	[Prg_ID] [int] NULL,
	[Mgr_Username] [varchar](50) NOT NULL,
	[Mgr_Password] [varchar](50) NOT NULL,
	[Mgr_FirstName] [varchar](50) NOT NULL,
	[Mgr_LastName] [varchar](50) NOT NULL,
	[Mgr_Title] [varchar](50) NOT NULL,
	[Mgr_Email] [varchar](50) NOT NULL,
	[Mgr_ApprovedByID] [int] NULL,
	[Mgr_IsActive] [bit] NOT NULL,
	[Mgr_ApprovalLevel] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mgr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Managers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NotifiedPersons]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotifiedPersons](
	[IRP_ID] [int] NOT NULL,
	[NOP_FirstName] [varchar](50) NOT NULL,
	[NOP_LastName] [varchar](50) NOT NULL,
	[NOP_Title] [varchar](50) NOT NULL,
	[NOP_Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IRP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[NotifiedPersons] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Programs](
	[Prg_ID] [int] IDENTITY(1,1) NOT NULL,
	[Prg_Name] [varchar](100) NOT NULL,
	[Prg_Active] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Prg_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Programs] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Table]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table](
	[IFU_ID] [int] NOT NULL,
	[IFU_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IFU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Table] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Witnesses]    Script Date: 3/9/2016 6:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Witnesses](
	[IRP_ID] [int] NULL,
	[WIT_ID] [int] NOT NULL,
	[WIT_FirstName] [varchar](50) NOT NULL,
	[WIT_LastName] [varchar](50) NOT NULL,
	[WIT_Title] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WIT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Witnesses] TO  SCHEMA OWNER 
GO
ALTER TABLE [dbo].[IncidentReports] ADD  CONSTRAINT [DF_IncidentReports_IRP_ReportDate]  DEFAULT (getdate()) FOR [IRP_ReportDate]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  CONSTRAINT [DF_IncidentReports_IRP_ApprovalLevelReq]  DEFAULT ((0)) FOR [IRP_ApprovalLevelReq]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_AbuseAllegation]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_Death]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_PoliceFire]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_SuicideGestures]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_UnplannedHospitalization]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_SexualEncounter]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_SubstanceAbuse]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_MedicationError]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_Injury]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_ClientGrievance]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_PhysicalRestraint]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_Seclusion]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_PropertyDamage]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_PropertyMissing]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_Theft]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT ((0)) FOR [IRP_Other]
GO
ALTER TABLE [dbo].[ContribFactors]  WITH CHECK ADD FOREIGN KEY([CFT_ID])
REFERENCES [dbo].[ContribFactorTypes] ([CFT_ID])
GO
ALTER TABLE [dbo].[ContribFactors]  WITH CHECK ADD FOREIGN KEY([IRP_ID])
REFERENCES [dbo].[IncidentReports] ([IRP_ID])
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD FOREIGN KEY([INT_ID])
REFERENCES [dbo].[IncidentTypes] ([INT_ID])
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD FOREIGN KEY([IRP_ID])
REFERENCES [dbo].[IncidentReports] ([IRP_ID])
GO
ALTER TABLE [dbo].[IncidentTypes_ContribFactorTypes]  WITH CHECK ADD FOREIGN KEY([CFT_ID])
REFERENCES [dbo].[ContribFactorTypes] ([CFT_ID])
GO
ALTER TABLE [dbo].[IncidentTypes_ContribFactorTypes]  WITH CHECK ADD FOREIGN KEY([INT_ID])
REFERENCES [dbo].[IncidentTypes] ([INT_ID])
GO
ALTER TABLE [dbo].[Managers]  WITH CHECK ADD FOREIGN KEY([Prg_ID])
REFERENCES [dbo].[Programs] ([Prg_ID])
GO
ALTER TABLE [dbo].[NotifiedPersons]  WITH CHECK ADD FOREIGN KEY([IRP_ID])
REFERENCES [dbo].[IncidentReports] ([IRP_ID])
GO
ALTER TABLE [dbo].[Witnesses]  WITH CHECK ADD FOREIGN KEY([IRP_ID])
REFERENCES [dbo].[IncidentReports] ([IRP_ID])
GO
