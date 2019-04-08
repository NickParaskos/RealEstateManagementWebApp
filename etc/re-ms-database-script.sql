USE [master]
GO
/****** Object:  Database [re-ms-database]    Script Date: 4/8/2019 4:13:24 PM ******/
CREATE DATABASE [re-ms-database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N're-ms-database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\re-ms-database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N're-ms-database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\re-ms-database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [re-ms-database] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [re-ms-database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [re-ms-database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [re-ms-database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [re-ms-database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [re-ms-database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [re-ms-database] SET ARITHABORT OFF 
GO
ALTER DATABASE [re-ms-database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [re-ms-database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [re-ms-database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [re-ms-database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [re-ms-database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [re-ms-database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [re-ms-database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [re-ms-database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [re-ms-database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [re-ms-database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [re-ms-database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [re-ms-database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [re-ms-database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [re-ms-database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [re-ms-database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [re-ms-database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [re-ms-database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [re-ms-database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [re-ms-database] SET  MULTI_USER 
GO
ALTER DATABASE [re-ms-database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [re-ms-database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [re-ms-database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [re-ms-database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [re-ms-database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [re-ms-database] SET QUERY_STORE = OFF
GO
USE [re-ms-database]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [re-ms-database]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 4/8/2019 4:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](50) NOT NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[AmenityID] [int] IDENTITY(1,1) NOT NULL,
	[WasherDryerHookup] [bit] NULL,
	[AllowCats] [bit] NULL,
	[AllowDogs] [bit] NULL,
	[ParkingSpots] [nvarchar](50) NULL,
	[Gym] [bit] NULL,
	[Pool] [bit] NULL,
 CONSTRAINT [PK_Amenity] PRIMARY KEY CLUSTERED 
(
	[AmenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[SocialNumber] [int] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[LastApartmentAddress] [nvarchar](100) NULL,
	[LastApartmentOwner] [nvarchar](100) NULL,
	[LastApartmentContactPhoneNumber] [nvarchar](50) NULL,
	[LastApartmentTenancyStartDate] [nvarchar](50) NULL,
	[LastApartmentTenancyEndDate] [nvarchar](50) NULL,
	[EmploymentStatus] [bit] NULL,
	[Company] [nvarchar](50) NULL,
	[AnnualIncome] [nvarchar](50) NULL,
	[CompanyContactNumber] [nvarchar](50) NULL,
	[NumOfExpectedResident] [int] NULL,
	[NumberOfPets] [int] NULL,
	[ApprovalStatus] [bit] NULL,
	[UnitID] [int] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyOwnerID] [int] NOT NULL,
	[NumberOfUnits] [int] NULL,
	[PropertyType] [nvarchar](50) NULL,
	[ManagerID] [int] NOT NULL,
	[ImageSource] [nvarchar](max) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Emergency] [bit] NULL,
	[Category] [nvarchar](50) NULL,
	[Completed] [bit] NULL,
 CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[TenantID] [int] NOT NULL,
	[MonthlyRent] [float] NOT NULL,
	[Sqft] [int] NOT NULL,
	[NumOfBaths] [float] NOT NULL,
	[NumOfBeds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ApplicationFee] [float] NOT NULL,
	[SecurityDeposit] [float] NOT NULL,
	[PetDeposit] [float] NOT NULL,
	[TagLine] [nvarchar](280) NULL,
	[AddressID] [int] NOT NULL,
	[ImageSource] [nvarchar](max) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit_To_Amenities]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_To_Amenities](
	[UnitID] [int] NOT NULL,
	[AmenityID] [int] NOT NULL,
 CONSTRAINT [PK_Unit_To_Amenities] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC,
	[AmenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/8/2019 4:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_WasherDryerHookup]  DEFAULT ((0)) FOR [WasherDryerHookup]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_AllowCats]  DEFAULT ((0)) FOR [AllowCats]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_AllowDogs]  DEFAULT ((0)) FOR [AllowDogs]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_ParkingSpots]  DEFAULT ((0)) FOR [ParkingSpots]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_Gym]  DEFAULT ((0)) FOR [Gym]
GO
ALTER TABLE [dbo].[Amenity] ADD  CONSTRAINT [DF_Amenity_Pool]  DEFAULT ((0)) FOR [Pool]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_NumOfExpectedResident]  DEFAULT ((1)) FOR [NumOfExpectedResident]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_NumberOfPets]  DEFAULT ((0)) FOR [NumberOfPets]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_NumberOfUnits]  DEFAULT ((1)) FOR [NumberOfUnits]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_MonthlyRent]  DEFAULT ((0.0)) FOR [MonthlyRent]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_Sqft]  DEFAULT ((0)) FOR [Sqft]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_NumOfBaths]  DEFAULT ((0.0)) FOR [NumOfBaths]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_NumOfBeds]  DEFAULT ((0)) FOR [NumOfBeds]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_ApplicationFee]  DEFAULT ((0.0)) FOR [ApplicationFee]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_SecurityDeposit]  DEFAULT ((0.0)) FOR [SecurityDeposit]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_PetDeposit]  DEFAULT ((0.0)) FOR [PetDeposit]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Unit]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_User] FOREIGN KEY([TenantID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_User]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Address] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([PropertyID])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_Address]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Address1] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_Address1]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_User] FOREIGN KEY([TenantID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_User]
GO
ALTER TABLE [dbo].[Unit_To_Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Unit_To_Amenities_Amenity] FOREIGN KEY([AmenityID])
REFERENCES [dbo].[Amenity] ([AmenityID])
GO
ALTER TABLE [dbo].[Unit_To_Amenities] CHECK CONSTRAINT [FK_Unit_To_Amenities_Amenity]
GO
ALTER TABLE [dbo].[Unit_To_Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Unit_To_Amenities_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Unit_To_Amenities] CHECK CONSTRAINT [FK_Unit_To_Amenities_Unit]
GO
USE [master]
GO
ALTER DATABASE [re-ms-database] SET  READ_WRITE 
GO
