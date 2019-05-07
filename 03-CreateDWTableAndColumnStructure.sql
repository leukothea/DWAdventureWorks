-- Create Data Warehouse tables and column structure
-- Revised 2016-12-02 & on. This is my working version! 

USE [DW-AdventureWorks-CWarren]
GO

/****** Object:  Table [dbo].[FactSales]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSales]( --updated 2016-12-11
	[OrderKey] [int] NOT NULL IDENTITY,
	[OrderID] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[OrderDetailID] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderQty] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(	[OrderKey] ASC,
	[OrderID] ASC,
	[OrderDateKey] ASC,
	[OrderDetailID] ASC,
	[CustomerKey] ASC,
	[CustomerID] ASC,
	[ProductKey] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



/****** Object:  Table [dbo].[DimProducts]   ******/

CREATE TABLE [dbo].[DimProducts]( -- updated 2016-12-11
	[ProductKey] [int] NOT NULL IDENTITY,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductSubcategoryName] [nvarchar](50) NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [char](3) NOT NULL,
 CONSTRAINT [PK_DimProducts] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimCustomers]   ******/

CREATE TABLE [dbo].[DimCustomers]( -- updated 2016-12-10
	[CustomerKey][int] NOT NULL IDENTITY,
	[CustomerID] [int] NOT NULL,
	[CustomerPersonID] [int] NOT NULL,
	[CustomerAccountNumber] [nvarchar](100) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [char](3) NOT NULL,
 CONSTRAINT [PK_DimCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[DimCustomerAccounts]   -- DELETED 

CREATE TABLE [dbo].[DimCustomerAccounts]( -- updated 2016-12-10
	[CustomerAccountFactKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[BusinessEntityKey] [int] NOT NULL,
	[PersonFirstName] [nvarchar](100) NULL,
	[PersonLastName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [char](3) NOT NULL,
 CONSTRAINT [PK_DimCustomerAccounts] PRIMARY KEY CLUSTERED 
(	[CustomerAccountFactKey] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
******/

/****** Object:  Table [dbo].[FactCustomerAddresses]  ******/

CREATE TABLE [dbo].[FactCustomerAddresses]( -- updated 2016-12-10
	[CustomerAddressFactKey] [int] NOT NULL IDENTITY,
	[CustomerKey] [int] NOT NULL,
	[AddressKey] [int] NOT NULL,
	[AddressTypeKey] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [char](3) NOT NULL,
 CONSTRAINT [PK_DimCustomerAddresses] PRIMARY KEY CLUSTERED 
(	[CustomerAddressFactKey] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimAddressTypes]  ******/

CREATE TABLE [dbo].[DimAddressTypes]( -- updated 2016-12-10
	[AddressTypeKey] [int] NOT NULL IDENTITY,
	[AddressTypeID] [int] NOT NULL,
	[AddressTypeName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [char](3) NOT NULL,
 CONSTRAINT [PK_DimAddressTypes] PRIMARY KEY CLUSTERED 
(	[AddressTypeKey] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[DimAddresses]  ******/

CREATE TABLE [dbo].[DimAddresses]( -- updated 2016-12-10
	[AddressKey] [int] NOT NULL IDENTITY,
	[AddressID] [int] NOT NULL,
	[AddressCity] [nVarchar](100) NOT NULL, 
	[AddressStateProvinceID] [int] NOT NULL,
	[AddressStateProvinceCode] [nVarchar](10) NOT NULL,
	[AddressStateProvinceName] [nVarchar] (100) NOT NULL,
	[AddressCountryRegionCode] [nVarchar] (10) NOT NULL,
	[AddressCountryRegionName] [nVarchar] (100) NOT NULL,
	[AddressPostalCode] [nVarchar](50) NOT NULL, 
	[StartDate] [int] NOT NULL, 
	[EndDate] [int] NULL, 
	[IsCurrent] [char] (3) NOT NULL
 CONSTRAINT [PK_DimAddresses] PRIMARY KEY CLUSTERED 
(	[AddressKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[DimDates]  ******/

CREATE TABLE [dbo].[DimDates]( -- updated 2016-12-10
	[DateKey] int NOT NULL PRIMARY KEY IDENTITY,
	[PlainDate] datetime NOT NULL,
	[USADateName] [nvarchar](100) NOT NULL,
	[MonthKey] [int] NOT NULL,
	[MonthName] [nvarchar](100) NOT NULL,
	[QuarterKey] [int] NOT NULL,
	[QuarterName] [nvarchar](100) NOT NULL,
	[YearKey] [int] NOT NULL,
	[YearName] [nvarchar](100) NOT NULL
)



/****** Add foreign keys. ******/

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProducts] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProducts] ([ProductKey])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProducts]
GO

ALTER TABLE [dbo].[FactCustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_FactCustomerAddresses_DimAddresses] FOREIGN KEY([AddressKey])
REFERENCES [dbo].[DimAddresses] ([AddressKey])
GO

ALTER TABLE [dbo].[FactCustomerAddresses] CHECK CONSTRAINT [FK_FactCustomerAddresses_DimAddresses]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCustomers] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomers] ([CustomerKey])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCustomers]
GO

ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDates] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDates] ([DateKey])
GO

ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDates]
GO

ALTER TABLE [dbo].[FactCustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_FactCustomerAddresses_DimAddressTypes] FOREIGN KEY([AddressTypeKey])
REFERENCES [dbo].[DimAddressTypes] ([AddressTypeKey])
GO

ALTER TABLE [dbo].[FactCustomerAddresses] CHECK CONSTRAINT [FK_FactCustomerAddresses_DimAddressTypes]
GO

ALTER TABLE [dbo].[FactCustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_FactCustomerAddresses_DimCustomers] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomers] ([CustomerKey])
GO

ALTER TABLE [dbo].[FactCustomerAddresses] CHECK CONSTRAINT [FK_FactCustomerAddresses_DimCustomers]
GO


-- Check on the tables and their relationships. 
/******
SELECT 
  NAME
, [Parent object] = iif(parent_obj = 0, 'NA', Object_Name(parent_obj))
--, *  
FROM SysObjects 
WHERE xtype in ('u', 'pk', 'f')
and NAME != 'sysdiagrams'
and (Object_Name(parent_obj) IS NULL OR Object_Name(parent_obj) != 'sysdiagrams')
ORDER BY parent_obj;
  ******/