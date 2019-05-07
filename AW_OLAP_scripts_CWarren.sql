USE [master]
GO
/****** Object:  Database [DW-AdventureWorks-CWarren]    Script Date: 12/5/2016 1:15:09 AM ******/
CREATE DATABASE [DW-AdventureWorks-CWarren]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW-AdventureWorks-CWarren', FILENAME = N'C:\_BISolutions\_BIConceptsProject\DW-AdventureWorks-CWarren.mdf' , SIZE = 10240KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'DW-AdventureWorks-CWarren_log', FILENAME = N'C:\_BISolutions\_BIConceptsProject\DW-AdventureWorks-CWarren_log.ldf' , SIZE = 11264KB , MAXSIZE = 1048576KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW-AdventureWorks-CWarren].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET RECOVERY BULK_LOGGED 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET  MULTI_USER 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DW-AdventureWorks-CWarren', N'ON'
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET QUERY_STORE = OFF
GO
USE [DW-AdventureWorks-CWarren]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DW-AdventureWorks-CWarren]
GO
/****** Object:  Table [dbo].[DimAddresses]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAddresses](
	[AddressID] [int] NOT NULL,
	[AddressKey] [int] NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[AddressCity] [nvarchar](100) NOT NULL,
	[AddressStateProvinceCode] [nvarchar](10) NOT NULL,
	[AddressStateProvinceName] [nvarchar](100) NOT NULL,
	[AddressCountryRegionCode] [nvarchar](10) NOT NULL,
	[AddressCountryRegionName] [nvarchar](100) NOT NULL,
	[AddressPostalCode] [nvarchar](50) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NULL,
	[IsCurrent] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_DimAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimAddressTypes]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAddressTypes](
	[AddressTypeID] [int] NOT NULL,
	[AddressTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DimAddressTypes] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimCustomerAccounts]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomerAccounts](
	[CustomerID] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[PersonFirstName] [nvarchar](100) NULL,
	[PersonLastName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsCurrent] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_DimCustomerAccounts] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimCustomerAddresses]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomerAddresses](
	[BusinessEntityID] [int] NOT NULL,
	[BusinessEntityKey] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressKey] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
 CONSTRAINT [PK_DimCustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDates]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDates](
	[DateKey] [int] NOT NULL,
	[USADateName] [nvarchar](100) NOT NULL,
	[MonthKey] [int] NOT NULL,
	[MonthName] [nvarchar](100) NOT NULL,
	[QuarterKey] [int] NOT NULL,
	[QuarterName] [nvarchar](100) NOT NULL,
	[YearKey] [int] NOT NULL,
	[YearName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DimDates] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- This file is a record of my draft as of 2016-12-05. It has many flaws. 

GO
/****** Object:  Table [dbo].[DimProducts]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducts](
	[ProductID] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductSubcategoryName] [nvarchar](50) NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimProducts] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 12/5/2016 1:15:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[OrderID] [int] NOT NULL,
	[OrderKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[OrderQty] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[OrderKey] ASC,
	[OrderDateKey] ASC,
	[CustomerID] ASC,
	[CustomerKey] ASC,
	[ProductID] ASC,
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DimCustomerAccounts]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomerAccounts_DimCustomerAddresses] FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[DimCustomerAddresses] ([BusinessEntityKey])
GO
ALTER TABLE [dbo].[DimCustomerAccounts] CHECK CONSTRAINT [FK_DimCustomerAccounts_DimCustomerAddresses]
GO
ALTER TABLE [dbo].[DimCustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomerAddresses_DimAddresses] FOREIGN KEY([AddressKey])
REFERENCES [dbo].[DimAddresses] ([AddressKey])
GO
ALTER TABLE [dbo].[DimCustomerAddresses] CHECK CONSTRAINT [FK_DimCustomerAddresses_DimAddresses]
GO
ALTER TABLE [dbo].[DimCustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomerAddresses_DimAddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[DimAddressTypes] ([AddressTypeID])
GO
ALTER TABLE [dbo].[DimCustomerAddresses] CHECK CONSTRAINT [FK_DimCustomerAddresses_DimAddressTypes]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDates] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDates] ([DateKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDates]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProducts] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProducts] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProducts]
GO
USE [master]
GO
ALTER DATABASE [DW-AdventureWorks-CWarren] SET  READ_WRITE 
GO
