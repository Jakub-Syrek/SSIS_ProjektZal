-->Zadanie 0
USE [master]
GO
DROP DATABASE [SSIS_db]
GO
CREATE DATABASE [SSIS_db]
GO
USE [SSIS_db]
GO
CREATE TABLE [dbo].[FlagsData](
	[Name] [nvarchar](50) NULL,
	[Landmass] [nvarchar](50) NULL,
	[Zone] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Population] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[Bars] [nvarchar](50) NULL,
	[Stripes] [nvarchar](50) NULL,
	[Colours] [nvarchar](50) NULL,
	[Red] [nvarchar](50) NULL,
	[Green] [nvarchar](50) NULL,
	[Blue] [nvarchar](50) NULL,
	[Gold] [nvarchar](50) NULL,
	[White] [nvarchar](50) NULL,
	[Black] [nvarchar](50) NULL,
	[Orange] [nvarchar](50) NULL,
	[Mainhue] [nvarchar](50) NULL,
	[Circles] [nvarchar](50) NULL,
	[Crosses] [nvarchar](50) NULL,
	[Saltires] [nvarchar](50) NULL,
	[Quarters] [nvarchar](50) NULL,
	[Sunstars] [nvarchar](50) NULL,
	[Crescent] [nvarchar](50) NULL,
	[Triangle] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[Animate] [nvarchar](50) NULL,
	[Text] [nvarchar](50) NULL,
	[TopleftColour] [nvarchar](50) NULL,
	[BotrightColour] [nvarchar](50) NULL
) 

GO
CREATE TABLE [dbo].[IrisData](
	[SepalLength] [nvarchar](50) NULL,
	[SepalWidth] [nvarchar](50) NULL,
	[PetalLength] [nvarchar](50) NULL,
	[PetalWidth] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL
) 

GO
CREATE TABLE [dbo].[ZooData](
	[AnimalName] [nvarchar](50) NULL,
	[Hair] [nvarchar](50) NULL,
	[Feathers] [nvarchar](50) NULL,
	[Eggs] [nvarchar](50) NULL,
	[Milk] [nvarchar](50) NULL,
	[Airborne] [nvarchar](50) NULL,
	[Aquatic] [nvarchar](50) NULL,
	[Predator] [nvarchar](50) NULL,
	[Toothed] [nvarchar](50) NULL,
	[Backbone] [nvarchar](50) NULL,
	[Breathes] [nvarchar](50) NULL,
	[Venomous] [nvarchar](50) NULL,
	[Fins] [nvarchar](50) NULL,
	[Legs] [nvarchar](50) NULL,
	[Tail] [nvarchar](50) NULL,
	[Domestic] [nvarchar](50) NULL,
	[Catsize] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[SepalLength] [nvarchar](50) NULL,
	[SepalWidth] [nvarchar](50) NULL,
	[PetalLength] [nvarchar](50) NULL,
	[PetalWidth] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL
) 

GO
CREATE TABLE [dbo].[Log](
	[Date] [datetime] NULL,
	[User] [nvarchar](50) NULL,
	[PcgNam] [nvarchar](50) NULL
) 
GO


-->Zadanie 1
DROP DATABASE [SSIS_db1]
GO
CREATE DATABASE [SSIS_db1]
GO
USE [SSIS_db1]
GO

CREATE TABLE [dbo].[T01_WizyWydane](
	[OSG] [nvarchar](50) NULL,
	[PSG] [nvarchar](50) NULL,
	[Obywatelstwo] [nvarchar](50) NULL,
	[Symbol] [nvarchar](50) NULL,
	[WydaniewizySchengenZasięgTerytorialnyPaństwaSchengen] [nvarchar](50) NULL,
	[WydaniewizySchengenZasięgterytorialnyPolska] [nvarchar](50) NULL,
	[ZastąpienieNaklejkiWizowejRodzajWizy-VD] [nvarchar](50) NULL,
	[ZastąpienieNaklejkiWizowejRodzajwizy-VC] [nvarchar](50) NULL
)
GO

CREATE TABLE [dbo].[T02_WizyAgregacje](
	[OSG] [varchar](50) NULL,
	[PSG] [varchar](50) NULL,
	[WydaniewizySchengenZasięgTerytorialnyPaństwaSchengen] [numeric](20, 0) NULL,
	[WydaniewizySchengenZasięgTerytorialnyPaństwaPolska] [numeric](20, 0) NULL,
	[ZastąpienieNaklejkiWizowejRodzajwizyVD] [numeric](20, 0) NULL,
	[ZastąpienieNaklejkiWizowejRodzajwizyVC] [numeric](20, 0) NULL
)
GO

CREATE TABLE [dbo].[T03_MOSG](
	[PSG] [varchar](50) NULL,
	[Obywatelstwo] [varchar](50) NULL,
	[Symbol] [varchar](50) NULL,
	[WydanieWizySchengenSchengen] [varchar](50) NULL,
	[WydanieWizySchengenPolska] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVD] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVC] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[T03_NOSG](
	[PSG] [varchar](50) NULL,
	[Obywatelstwo] [varchar](50) NULL,
	[Symbol] [varchar](50) NULL,
	[WydanieWizySchengenSchengen] [varchar](50) NULL,
	[WydanieWizySchengenPolska] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVD] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVC] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[T04_DerivedColumns](
	[OSG] [varchar](50) NULL,
	[PSG] [varchar](50) NULL,
	[WydanieWizySchengenSchengen] [varchar](50) NULL,
	[WydanieWizySchengenPolska] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVD] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVC] [varchar](50) NULL,
	[ZastapienieNaklejki] [nvarchar](103) NULL,
	[WydaneWizySchengen] [nvarchar](103) NULL,
	[ObywatelstwoSymbol] [nvarchar](103) NULL
)
GO

CREATE TABLE [dbo].[T05_MultiA](
	[OSG] [varchar](50) NULL,
	[PSG] [varchar](50) NULL,
	[Obywatelstwo] [varchar](50) NULL,
	[Symbol] [varchar](50) NULL,
	[WydanieWizySchengenSchengen] [varchar](50) NULL,
	[WydanieWizySchengenPolska] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVD] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVC] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[T05_MultiB](
	[OSG] [varchar](50) NULL,
	[PSG] [varchar](50) NULL,
	[Obywatelstwo] [varchar](50) NULL,
	[Symbol] [varchar](50) NULL,
	[WydanieWizySchengenSchengen] [varchar](50) NULL,
	[WydanieWizySchengenPolska] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVD] [varchar](50) NULL,
	[ZastąpienieNaklejkiWizowejVC] [varchar](50) NULL
)