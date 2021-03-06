USE [IRTS]
GO
/****** Object:  Table [dbo].[ContribFactors]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[ContribFactorTypes]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[IncidentReports]    Script Date: 1/26/2016 12:17:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IncidentReports](
	[IRP_ID] [int] IDENTITY(1,1) NOT NULL,
	[IRP_Category] [varchar](25) NULL,
	[IRP_Location] [varchar](100) NULL,
	[IRP_ReportDate] [date] NULL,
	[IRP_IncidentDate] [date] NULL,
	[IRP_VictimFirstName] [varchar](50) NULL,
	[IRP_VictimLastName] [varchar](50) NULL,
	[IRP_ReportOn] [varchar](20) NULL,
	[IRP_ResMgrApprovedDate] [date] NULL,
	[IRP_DeptDirApprovedDate] [date] NULL,
	[IRP_RiskMgrApprovedDate] [date] NULL,
	[IRP_RiskMgrComment] [varchar](1000) NULL,
	[IRP_PreparedByFirstName] [varchar](50) NULL,
	[IRP_PreparedByLastName] [varchar](50) NULL,
	[IRP_Description] [varchar](1000) NULL,
	[IRP_InjuryType] [varchar](100) NULL,
	[IRP_BodyPart] [varchar](50) NULL,
	[IRP_InjuryFollowUp] [varchar](100) NULL,
	[IRP_ApprovalLevelReq] [varchar](50) NULL,
	[IRP_ProgramName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IRP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Incidents]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[IncidentTypes]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[IncidentTypes_ContribFactorTypes]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[Managers]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[NotifiedPersons]    Script Date: 1/26/2016 12:17:12 PM ******/
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
/****** Object:  Table [dbo].[Programs]    Script Date: 1/26/2016 12:17:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Programs](
	[Prg_ID] [int] IDENTITY(1,1) NOT NULL,
	[Prg_Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Prg_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Witnesses]    Script Date: 1/26/2016 12:17:12 PM ******/
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
ALTER TABLE [dbo].[IncidentReports] ADD  CONSTRAINT [DF_IncidentReports_IRP_ApprovalLevelReq]  DEFAULT ((1)) FOR [IRP_ApprovalLevelReq]
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
