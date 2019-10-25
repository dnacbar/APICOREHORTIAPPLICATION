﻿USE [DBHORTI]
GO

/****** OBJECT:  TABLE [DBO].[PRODUCT]    SCRIPT DATE: 23/10/2019 23:03:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

EXEC P_REMOVE_FK N'PRODUCT'
GO

IF OBJECT_ID('DBO.PRODUCT', 'U') IS NOT NULL
	DROP TABLE DBO.PRODUCT;

CREATE TABLE [DBO].[PRODUCT](
	[ID_PRODUCT] [UNIQUEIDENTIFIER] NOT NULL,
	[DS_NAME] [VARCHAR](50) NULL,
	[BO_ACTIVE] [BIT] NOT NULL,
	[DT_CREATION] [DATETIME2](3) NOT NULL,
	[DT_ATUALIZATION] [DATETIME2](3) NOT NULL,
	[NM_VALUE] [DECIMAL](12, 2) NOT NULL,
	[NM_DISCOUNT] [TINYINT] NULL,
	[DT_DISCOUNT] [DATE] NULL,
	[CD_UNITY] [UNIQUEIDENTIFIER] NULL,
	[BO_STOCK] [BIT] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [DBO].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_UNITY] FOREIGN KEY([CD_UNITY])
REFERENCES [DBO].[UNITY] ([ID_UNITY])
GO

ALTER TABLE [DBO].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_UNITY]
GO

ALTER TABLE [DBO].[PRODUCT] ADD  CONSTRAINT [C_PRODUCT_ACTIVE]  DEFAULT ((1)) FOR [BO_ACTIVE]
GO

ALTER TABLE [DBO].[PRODUCT] ADD  CONSTRAINT [C_PRODUCT_DT_CREATION]  DEFAULT (GETDATE()) FOR [DT_CREATION]
GO

ALTER TABLE [DBO].[PRODUCT] ADD  CONSTRAINT [C_PRODUCT_DT_ATUALIZATION]  DEFAULT (GETDATE()) FOR [DT_ATUALIZATION]
GO

ALTER TABLE [DBO].[PRODUCT] ADD  CONSTRAINT [C_PRODUCT_STOCK]  DEFAULT ((1)) FOR [BO_STOCK]
GO
