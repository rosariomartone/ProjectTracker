USE [ProjectTracker]
GO
/****** Object:  Table [dbo].[tbl_Clients]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Clients](
	[ID_Client] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Clients] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Companies]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Companies](
	[ID_Company] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Companies] PRIMARY KEY CLUSTERED 
(
	[ID_Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Departments]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Departments](
	[ID_Department] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Store] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Departments] PRIMARY KEY CLUSTERED 
(
	[ID_Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_EmailDrop]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmailDrop](
	[EmailDropID] [int] IDENTITY(1,1) NOT NULL,
	[PostDate] [smalldatetime] NOT NULL,
	[DateSent] [smalldatetime] NULL,
	[ToName] [varchar](250) NOT NULL,
	[ToAddress] [varchar](250) NOT NULL,
	[FromName] [varchar](250) NOT NULL,
	[FromAddress] [varchar](250) NOT NULL,
	[CCName] [varchar](250) NULL,
	[CCAddress] [varchar](250) NULL,
	[Subject] [nvarchar](300) NULL,
	[BodyText] [ntext] NULL,
	[HTMLType] [bit] NOT NULL,
	[ConfirmRead] [bit] NOT NULL,
	[CC1Name] [varchar](250) NULL,
	[CC1Address] [varchar](250) NULL,
	[ErrorMessage] [varchar](1000) NULL,
	[To1Name] [varchar](250) NULL,
	[To1Address] [varchar](250) NULL,
	[To2Name] [varchar](250) NULL,
	[To2Address] [varchar](250) NULL,
	[CC2Name] [varchar](250) NULL,
	[CC2Address] [varchar](250) NULL,
	[BCCName] [varchar](250) NULL,
	[BCCAddress] [varchar](250) NULL,
	[BCC1Name] [varchar](250) NULL,
	[BCC1Address] [varchar](250) NULL,
	[BCC2Name] [varchar](250) NULL,
	[BCC2Address] [varchar](250) NULL,
	[AttachmentFileName] [varchar](250) NULL,
	[AttachmentBLOB] [image] NULL,
 CONSTRAINT [PK_tblEmailDrop] PRIMARY KEY CLUSTERED 
(
	[EmailDropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_EmailDrop_Archive]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmailDrop_Archive](
	[EmailDropID] [int] NOT NULL,
	[PostDate] [smalldatetime] NOT NULL,
	[DateSent] [smalldatetime] NULL,
	[ToName] [varchar](250) NOT NULL,
	[ToAddress] [varchar](250) NOT NULL,
	[FromName] [varchar](250) NOT NULL,
	[FromAddress] [varchar](250) NOT NULL,
	[CCName] [varchar](250) NULL,
	[CCAddress] [varchar](250) NULL,
	[Subject] [varchar](300) NULL,
	[BodyText] [text] NULL,
	[HTMLType] [bit] NOT NULL,
	[ConfirmRead] [bit] NOT NULL,
	[CC1Name] [varchar](250) NULL,
	[CC1Address] [varchar](250) NULL,
	[ErrorMessage] [varchar](1000) NULL,
	[To1Name] [varchar](250) NULL,
	[To1Address] [varchar](250) NULL,
	[To2Name] [varchar](250) NULL,
	[To2Address] [varchar](250) NULL,
	[CC2Name] [varchar](250) NULL,
	[CC2Address] [varchar](250) NULL,
	[BCCName] [varchar](250) NULL,
	[BCCAddress] [varchar](250) NULL,
	[BCC1Name] [varchar](250) NULL,
	[BCC1Address] [varchar](250) NULL,
	[BCC2Name] [varchar](250) NULL,
	[BCC2Address] [varchar](250) NULL,
	[AttachmentFileName] [varchar](250) NULL,
	[AttachmentBLOB] [image] NULL,
 CONSTRAINT [PK_tblEmailDrop_Archive_1] PRIMARY KEY CLUSTERED 
(
	[EmailDropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_EmailDrop_SendingFailures]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmailDrop_SendingFailures](
	[EmailDropID] [int] NOT NULL,
	[PostDate] [smalldatetime] NOT NULL,
	[DateSent] [smalldatetime] NULL,
	[ToName] [varchar](250) NOT NULL,
	[ToAddress] [varchar](250) NOT NULL,
	[FromName] [varchar](250) NOT NULL,
	[FromAddress] [varchar](250) NOT NULL,
	[CCName] [varchar](250) NULL,
	[CCAddress] [varchar](250) NULL,
	[Subject] [varchar](300) NULL,
	[BodyText] [text] NULL,
	[HTMLType] [bit] NOT NULL,
	[ConfirmRead] [bit] NOT NULL,
	[CC1Name] [varchar](250) NULL,
	[CC1Address] [varchar](250) NULL,
	[ErrorMessage] [varchar](1000) NULL,
	[To1Name] [varchar](250) NULL,
	[To1Address] [varchar](250) NULL,
	[To2Name] [varchar](250) NULL,
	[To2Address] [varchar](250) NULL,
	[CC2Name] [varchar](250) NULL,
	[CC2Address] [varchar](250) NULL,
	[BCCName] [varchar](250) NULL,
	[BCCAddress] [varchar](250) NULL,
	[BCC1Name] [varchar](250) NULL,
	[BCC1Address] [varchar](250) NULL,
	[BCC2Name] [varchar](250) NULL,
	[BCC2Address] [varchar](250) NULL,
	[AttachmentFileName] [varchar](250) NULL,
	[AttachmentBLOB] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[ID_Menu] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[ID_Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Menu_Voices]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu_Voices](
	[ID_Menu_Voice] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Menu] [bigint] NOT NULL,
	[text] [varchar](50) NOT NULL,
	[icon] [varchar](50) NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Menu_Voices] PRIMARY KEY CLUSTERED 
(
	[ID_Menu_Voice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Opportunities]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Opportunities](
	[ID_Opportunity] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Client] [bigint] NOT NULL,
	[ID_User] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Opportunities] PRIMARY KEY CLUSTERED 
(
	[ID_Opportunity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Password_Reset]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Password_Reset](
	[ID_Request] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_User] [bigint] NOT NULL,
	[token] [varchar](50) NOT NULL,
	[data_expiration] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Password_Reset] PRIMARY KEY CLUSTERED 
(
	[ID_Request] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[ID_Role] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Menu] [bigint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[userType] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Store]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Store](
	[ID_Store] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Company] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Store] PRIMARY KEY CLUSTERED 
(
	[ID_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[ID_User] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Department] [bigint] NOT NULL,
	[firstname] [varchar](max) NOT NULL,
	[surname] [varchar](max) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [bigint] NOT NULL,
	[is_Active] [bit] NOT NULL,
	[is_Password_Recovered] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_EmailDrop] ADD  CONSTRAINT [DF_tblEmailDrop_PostDate]  DEFAULT (getdate()) FOR [PostDate]
GO
ALTER TABLE [dbo].[tbl_EmailDrop] ADD  CONSTRAINT [DF_tblEmailDrop_FromName]  DEFAULT ('automailer@proximagroup.com') FOR [FromName]
GO
ALTER TABLE [dbo].[tbl_EmailDrop] ADD  CONSTRAINT [DF_tblEmailDrop_FromAddress]  DEFAULT ('automailer@proximagroup.com') FOR [FromAddress]
GO
ALTER TABLE [dbo].[tbl_EmailDrop] ADD  CONSTRAINT [DF_tblEmailDrop_HTMLType]  DEFAULT ((0)) FOR [HTMLType]
GO
ALTER TABLE [dbo].[tbl_EmailDrop] ADD  CONSTRAINT [DF_tblEmailDrop_ConfirmRead]  DEFAULT ((0)) FOR [ConfirmRead]
GO
ALTER TABLE [dbo].[tbl_Menu_Voices] ADD  DEFAULT ((1)) FOR [order]
GO
ALTER TABLE [dbo].[tbl_Roles] ADD  DEFAULT ((1)) FOR [ID_Menu]
GO
ALTER TABLE [dbo].[tbl_Users] ADD  DEFAULT ((0)) FOR [is_Password_Recovered]
GO
ALTER TABLE [dbo].[tbl_Departments]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Departments_tbl_Store] FOREIGN KEY([ID_Store])
REFERENCES [dbo].[tbl_Store] ([ID_Store])
GO
ALTER TABLE [dbo].[tbl_Departments] CHECK CONSTRAINT [FK_tbl_Departments_tbl_Store]
GO
ALTER TABLE [dbo].[tbl_Menu_Voices]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Menu_Voices_tbl_Menu] FOREIGN KEY([ID_Menu])
REFERENCES [dbo].[tbl_Menu] ([ID_Menu])
GO
ALTER TABLE [dbo].[tbl_Menu_Voices] CHECK CONSTRAINT [FK_tbl_Menu_Voices_tbl_Menu]
GO
ALTER TABLE [dbo].[tbl_Opportunities]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Opportunities_tbl_Clients] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[tbl_Clients] ([ID_Client])
GO
ALTER TABLE [dbo].[tbl_Opportunities] CHECK CONSTRAINT [FK_tbl_Opportunities_tbl_Clients]
GO
ALTER TABLE [dbo].[tbl_Opportunities]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Opportunities_tbl_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[tbl_Users] ([ID_User])
GO
ALTER TABLE [dbo].[tbl_Opportunities] CHECK CONSTRAINT [FK_tbl_Opportunities_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Password_Reset]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Password_Reset_tbl_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[tbl_Users] ([ID_User])
GO
ALTER TABLE [dbo].[tbl_Password_Reset] CHECK CONSTRAINT [FK_tbl_Password_Reset_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Roles]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Roles_tbl_Menu] FOREIGN KEY([ID_Menu])
REFERENCES [dbo].[tbl_Menu] ([ID_Menu])
GO
ALTER TABLE [dbo].[tbl_Roles] CHECK CONSTRAINT [FK_tbl_Roles_tbl_Menu]
GO
ALTER TABLE [dbo].[tbl_Store]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Store_tbl_Companies] FOREIGN KEY([ID_Company])
REFERENCES [dbo].[tbl_Companies] ([ID_Company])
GO
ALTER TABLE [dbo].[tbl_Store] CHECK CONSTRAINT [FK_tbl_Store_tbl_Companies]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Departments] FOREIGN KEY([ID_Department])
REFERENCES [dbo].[tbl_Departments] ([ID_Department])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Departments]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tbl_Roles] ([ID_Role])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Roles]
GO
/****** Object:  StoredProcedure [dbo].[usp_ArchiveMail]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_ArchiveMail]

AS

SET NOCOUNT ON

--// Move Sent Emails into dbo.tbl_EmailDrop_Archive
INSERT INTO dbo.tbl_EmailDrop_Archive
SELECT *
FROM dbo.tbl_EmailDrop 
WHERE DateSent IS NOT NULL

DELETE FROM dbo.tbl_EmailDrop WHERE DateSent IS NOT NULL

--// Move Failed Emails into tblEmailDrop_SendingFailures
INSERT INTO dbo.tbl_EmailDrop_SendingFailures
SELECT * 
FROM dbo.tbl_EmailDrop 
WHERE ErrorMessage IS NOT NULL

DELETE FROM dbo.tbl_EmailDrop
WHERE ErrorMessage IS NOT NULL






GO
/****** Object:  StoredProcedure [dbo].[usp_ChangePasswordUser]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 30.04.2017
-- Description:	This stored procedure change the user password giving id and password
-- =============================================
CREATE PROCEDURE [dbo].[usp_ChangePasswordUser] 
	@idUser bigint,
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CHANGED AS INT = 0;

	BEGIN TRY
		UPDATE tbl_Users SET [password] = @password, is_Active='1', is_Password_Recovered = '0' WHERE ID_User = @idUser;
		DELETE tbl_Password_Reset WHERE ID_User = @idUser;

		SET @CHANGED = 1;

		SELECT @CHANGED;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			DECLARE @ERRORMESSAGE NVARCHAR(4000) = ERROR_MESSAGE();
			DECLARE @ERRORSEVERITY INT = ERROR_SEVERITY();

			RAISERROR(@ERRORMESSAGE, @ERRORSEVERITY, 1);
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[usp_CheckUser]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 27.04.2017
-- Description:	This stored procedure check if the user exists giving username and password
-- =============================================
CREATE PROCEDURE [dbo].[usp_CheckUser] 
	@username varchar(50), 
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT users.is_Password_Recovered
	FROM tbl_users users
	WHERE email=@username AND password=@password
END

GO
/****** Object:  StoredProcedure [dbo].[usp_CreateEmail]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CreateEmail]
	
	@ToName varchar(250),
	@ToAddress varchar(250),
	@To1Name varchar(250) = NULL, --// Optional
	@To1Address varchar(250) = NULL, --// Optional
	@To2Name varchar(250) = NULL, --// Optional
	@To2Address varchar(250) = NULL, --// Optional
	@FromName varchar(250) = 'automailer@proximagroup.com', --// Optional
	@FromAddress varchar(250) = 'automailer@proximagroup.com', --// Optional
	@CCName varchar(250) = NULL, --// Optional
	@CCAddress varchar(250) = NULL, --// Optional
	@CC1Name varchar(250) = NULL, --// Optional
	@CC1Address varchar(250) = NULL, --// Optional
	@CC2Name varchar(250) = NULL, --// Optional
	@CC2Address varchar(250) = NULL, --// Optional
	@BCCName varchar(250) = NULL, --// Optional
	@BCCAddress varchar(250) = NULL, --// Optional
	@BCC1Name varchar(250) = NULL, --// Optional
	@BCC1Address varchar(250) = NULL, --// Optional
	@BCC2Name varchar(250) = NULL, --// Optional
	@BCC2Address varchar(250) = NULL, --// Optional
	@Subject nvarchar(300),
	@BodyText ntext,
	@HTMLType bit = 0, --// Optional
	@AttachmentFileName varchar(250) = NULL, --// Optional
	@AttachmentBLOB image = NULL --// Optional

AS

BEGIN

	INSERT INTO [EmailDrop].[dbo].[tbl_EmailDrop]
	(
		ToName,
		ToAddress,
		FromName,
		FromAddress,
		CCName,
		CCAddress,
		Subject,
		BodyText,
		HTMLType,
		CC1Name,
		CC1Address,
		To1Name,
		To1Address,
		To2Name,
		To2Address,
		CC2Name,
		CC2Address,
		BCCName,
		BCCAddress,
		BCC1Name,
		BCC1Address,
		BCC2Name,
		BCC2Address,
		AttachmentFileName,
		AttachmentBLOB
	)
	VALUES
	(
		@ToName,
		@ToAddress,
		@FromName,
		@FromAddress,
		@CCName,
		@CCAddress,
		@Subject,
		@BodyText,
		@HTMLType,
		@CC1Name,
		@CC1Address,
		@To1Name,
		@To1Address,
		@To2Name,
		@To2Address,
		@CC2Name,
		@CC2Address,
		@BCCName,
		@BCCAddress,
		@BCC1Name,
		@BCC1Address,
		@BCC2Name,
		@BCC2Address,
		@AttachmentFileName,
		@AttachmentBLOB
	)

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetDepartments]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the departments list
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetDepartments] 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT departments.*, store.Name, companies.ID_Company, companies.Name
	FROM tbl_Departments departments
	JOIN tbl_Store store on store.ID_Store=departments.ID_Store
	JOIN tbl_Companies companies on companies.ID_Company=store.ID_Company
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmails]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetEmails]

AS

SELECT TOP 100 *

FROM   	dbo.tbl_EmailDrop

WHERE  	
DateSent is NULL
AND
PostDate <= GETDATE()
AND
ErrorMessage is NULL

GO
/****** Object:  StoredProcedure [dbo].[usp_GetMenuVoicesByMenuId]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve menu voices giving menu id
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetMenuVoicesByMenuId] 
	@menuId bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM tbl_Menu_Voices
	WHERE ID_Menu=@menuId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetOpportunities]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the list of opportunities
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetOpportunities] 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM tbl_Opportunities
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetRoleById]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the user role giving roleID
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRoleById] 
	@roleId bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM tbl_Roles
	WHERE ID_Role=@roleId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetRoleByName]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the role giving role name
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRoleByName] 
	@rolename as varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM tbl_Roles
	WHERE name=@rolename
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetRoles]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve roles list
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetRoles] 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM tbl_Roles
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStores]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the stores list
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetStores] 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM tbl_Store
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUser]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the user giving username and password
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUser] 
	@username varchar(50), 
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT users.ID_User, users.firstname, users.surname, users.email, roles.ID_Role, roles.name, roles.ID_Menu, store.ID_Store, store.Name, department.ID_Department, department.Name, users.is_Password_Recovered
	FROM tbl_users users 
	JOIN tbl_Roles roles on roles.ID_Role=users.roleId 
	JOIN tbl_Departments department on department.ID_Department=users.ID_Department
	JOIN tbl_Store store on store.ID_Store=department.ID_Store
	WHERE email=@username AND password=@password and is_Active='1'
END

GO
/****** Object:  StoredProcedure [dbo].[usp_getUserIdByEmail]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 28.04.2017
-- Description:	This stored procedure retrieve the user id giving email
-- =============================================
CREATE PROCEDURE [dbo].[usp_getUserIdByEmail] 
	@email varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @retrieveUser int = 0

    SET @retrieveUser = (SELECT ISNULL(ID_User, 0)
	FROM tbl_users users 
	WHERE email=@email)

	SELECT @retrieveUser

END

GO
/****** Object:  StoredProcedure [dbo].[usp_getUserIdByToken]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 30.04.2017
-- Description:	This stored procedure retrieve the user id giving token
-- =============================================
CREATE PROCEDURE [dbo].[usp_getUserIdByToken] 
	@token varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @retrieveUser int = 0

    SET @retrieveUser = (SELECT COUNT(ID_User)
	FROM tbl_Password_Reset
	WHERE token=@token)

	IF @retrieveUser > 0
		BEGIN
			SET @retrieveUser = (SELECT ID_User
				FROM tbl_Password_Reset
				WHERE token=@token)
		END

	SELECT @retrieveUser

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetUsers]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the users list
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUsers] 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT users.ID_User, users.firstname, users.surname, users.email, roles.ID_Role, roles.name, roles.ID_Menu, users.is_Active, users.username, store.ID_Store, store.Name, department.ID_Department, department.Name
	FROM tbl_users users 
	JOIN tbl_Roles roles on roles.ID_Role=users.roleId
	JOIN tbl_Departments department on department.ID_Department=users.ID_Department
	JOIN tbl_Store store on store.ID_Store=department.ID_Store
END

GO
/****** Object:  StoredProcedure [dbo].[usp_RegisterNewUser]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure register a new user giving user's details
-- =============================================
CREATE PROCEDURE [dbo].[usp_RegisterNewUser] 
	@firstname varchar(50),
	@surname varchar(50),
	@email varchar(50),
	@username varchar(50), 
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @checkUser int = 0

    SET @checkUser = (SELECT count(*)
	FROM tbl_users users 
	WHERE email=@username)

	IF @checkUser = 0
		BEGIN
			--Add the user into the user table and profile him as Client
			INSERT INTO tbl_users VALUES (1,@firstname, @surname, @email, @username, @password, 2, '0', '0');

			--Send the email to the admin
			INSERT INTO [dbo].[tbl_EmailDrop]
				   ([PostDate]
				   ,[DateSent]
				   ,[ToName]
				   ,[ToAddress]
				   ,[FromName]
				   ,[FromAddress]
				   ,[CCName]
				   ,[CCAddress]
				   ,[Subject]
				   ,[BodyText]
				   ,[HTMLType]
				   ,[ConfirmRead]
				   ,[CC1Name]
				   ,[CC1Address]
				   ,[ErrorMessage]
				   ,[To1Name]
				   ,[To1Address]
				   ,[To2Name]
				   ,[To2Address]
				   ,[CC2Name]
				   ,[CC2Address]
				   ,[BCCName]
				   ,[BCCAddress]
				   ,[BCC1Name]
				   ,[BCC1Address]
				   ,[BCC2Name]
				   ,[BCC2Address]
				   ,[AttachmentFileName]
				   ,[AttachmentBLOB])
			 VALUES
				   (GETDATE()
				   ,NULL
				   ,'rosario.martone@gmail.com'
				   ,'rosario.martone@gmail.com'
				   ,'rosario.martone@gmail.com'
				   ,'rosario.martone@gmail.com'
				   ,NULL
				   ,NULL
				   ,'New user registration'
				   ,CONCAT(CONCAT(CONCAT(
								CONCAT(
									CONCAT(
										CONCAT('Hello,<BR/>A new user requested to be active on the system:<BR/><BR/>First name: ', 
											@firstname), 
									'<BR/>Surname: '), 
								@surname),
							'<BR/>Email: '),
						@email),
					'<BR/><BR/>Please proceed with activation from the admin panel.')
				   ,'1'
				   ,'0'
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL)

			--Send the confirmation email to the user
			INSERT INTO [dbo].[tbl_EmailDrop]
				   ([PostDate]
				   ,[DateSent]
				   ,[ToName]
				   ,[ToAddress]
				   ,[FromName]
				   ,[FromAddress]
				   ,[CCName]
				   ,[CCAddress]
				   ,[Subject]
				   ,[BodyText]
				   ,[HTMLType]
				   ,[ConfirmRead]
				   ,[CC1Name]
				   ,[CC1Address]
				   ,[ErrorMessage]
				   ,[To1Name]
				   ,[To1Address]
				   ,[To2Name]
				   ,[To2Address]
				   ,[CC2Name]
				   ,[CC2Address]
				   ,[BCCName]
				   ,[BCCAddress]
				   ,[BCC1Name]
				   ,[BCC1Address]
				   ,[BCC2Name]
				   ,[BCC2Address]
				   ,[AttachmentFileName]
				   ,[AttachmentBLOB])
			 VALUES
				   (GETDATE()
				   ,NULL
				   ,@email
				   ,@email
				   ,'rosario.martone@gmail.com'
				   ,'rosario.martone@gmail.com'
				   ,NULL
				   ,NULL
				   ,'Project Tracker - New user registration confirmation'
				   ,CONCAT(CONCAT(CONCAT(CONCAT('Hello ',
								@firstname),
							' '),
						@surname),
						', <BR/>your registration request has been correctly addressed and your account will be shortely managed by the Administrator.<BR>
							You will also receive a second email confirming your access credentials.')
				   ,'1'
				   ,'0'
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL
				   ,NULL)

			SET @checkUser = -1
		END

	SELECT @checkUser

END

GO
/****** Object:  StoredProcedure [dbo].[usp_RetrieveUser]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure retrieve the user giving email
-- =============================================
CREATE PROCEDURE [dbo].[usp_RetrieveUser] 
	@email varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @retrieveUser int = 0

    SET @retrieveUser = (SELECT count(*)
	FROM tbl_users users 
	WHERE email=@email)

	IF @retrieveUser > 0
		BEGIN
			UPDATE tbl_Users SET is_Active='0', is_Password_Recovered='1' WHERE email=@email;

			INSERT INTO tbl_Password_Reset VALUES(
				(SELECT ID_User FROM tbl_Users WHERE email=@email), NEWID(), DATEADD(dd, 7, GETDATE()));
		END

	SELECT @retrieveUser

END

GO
/****** Object:  StoredProcedure [dbo].[usp_SaveUserSettings]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_SaveUserSettings] 
	@idUser as bigint,
	@role as bigint,
	@department as bigint,
	@isActive as bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE tbl_Users
	SET roleID=@role, is_Active=@isActive, ID_Department=@department
	WHERE ID_User=@idUser
END

GO
/****** Object:  StoredProcedure [dbo].[usp_SaveUserSettings_Delete]    Script Date: 08/05/2017 20:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rosario Martone
-- Create date: 31.03.2017
-- Description:	This stored procedure delete an user
-- =============================================
CREATE PROCEDURE [dbo].[usp_SaveUserSettings_Delete] 
	@idUser as bigint
AS
BEGIN
	SET NOCOUNT ON;

    DELETE tbl_Users
	WHERE ID_User=@idUser
END

GO
