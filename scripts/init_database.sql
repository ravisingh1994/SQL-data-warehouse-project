
/*
    Project      : Data Warehouse
    Script       : Create Data Warehouse Database and Schemas
    Description  : Initializes the DataWarehouse database
                   and creates Bronze, Silver, and Gold schemas.
*/

-- =============================================
-- 1. Create Data Warehouse Database
-- =============================================

USE master;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    CREATE DATABASE DataWarehouse;
END;
GO

-- =============================================
-- 2. Switch to Data Warehouse Database
-- =============================================

USE DataWarehouse;
GO

-- =============================================
-- 3. Create Data Warehouse Schemas
-- =============================================

-- Bronze Layer: Raw Data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

-- Silver Layer: Cleansed and Transformed Data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

-- Gold Layer: Business-Ready Data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO
