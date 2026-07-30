/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
  This script creates the 'DataWarehouse' database for the project. If the
  database already exists, it is safely dropped and recreated to ensure a
  clean development environment.

Additionally, the script sets up three schemas within the database:
  - bronze : Stores raw data imported from source systems.
  - silver : Stores cleaned and transformed data.
  - gold   : Stores business-ready data models for reporting and analytics.

WARNING:
  Executing this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will permanently deleted. Proceed with caution 
  and ensure that you have backed up any important data before running this script.

===============================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
