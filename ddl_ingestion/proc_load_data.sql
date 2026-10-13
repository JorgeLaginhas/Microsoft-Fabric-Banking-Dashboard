/*

====================================================================================================
Stored Procedure: Load Data (Source -> Database)
=====================================================================================================

Script Purpose:
	
	This stored procedure loads data into database from external CSV files.
	It performs the following actions:
		- Truncates the tables before loadinbg data.
		- Uses the 'BULK INSERT' command to load data from csv files to database tables.

Paraemters:
	None.
	This stored procedure does not accept any parameters or return any values.

Usage Example:
	
	EXEC load_data;
=====================================================================================================

*/

CREATE OR ALTER PROCEDURE load_data AS
BEGIN

    SET NOCOUNT ON;

    DECLARE 
        @start_time DATETIME,
        @end_time   DATETIME,
		@batch_start_time DATETIME,
		@batch_end_time DATETIME;

    BEGIN TRY
		
		SET @batch_start_time = GETDATE();
        PRINT '===========================================================================================';
        PRINT 'Load Data';
        PRINT '===========================================================================================';

        -- ============================================================
        -- dim_Account
        -- ============================================================

        SET @start_time = GETDATE();

        PRINT '>>> Truncating Table: dim_Account';

        TRUNCATE TABLE dim_Account;

        PRINT '>>> Inserting data into: dim_Account';

        BULK INSERT dim_Account
        FROM 'C:\Users\Lenovo\Documents\XPERIUM\MICROSOFT_FABRIC_XPERIUM\banking_domain\Banking_Dataset\DimAccount.csv'
        WITH
        (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDQUOTE = '"',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '>> ------------------------------------------------------------------------------------------';


        -- ============================================================
        -- dim_branch
        -- ============================================================

        SET @start_time = GETDATE();

        PRINT '>>> Truncating Table: dim_branch';

        TRUNCATE TABLE dim_branch;

        PRINT '>>> Inserting data into: dim_branch';

        BULK INSERT dim_branch
        FROM 'C:\Users\Lenovo\Documents\XPERIUM\MICROSOFT_FABRIC_XPERIUM\banking_domain\Banking_Dataset\DimBranch.csv'
        WITH
        (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDQUOTE = '"',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '>> ------------------------------------------------------------------------------------------';


        -- ============================================================
        -- dim_customer
        -- ============================================================

        SET @start_time = GETDATE();

        PRINT '>>> Truncating Table: dim_customer';

        TRUNCATE TABLE dim_customer;

        PRINT '>>> Inserting data into: dim_customer';

        BULK INSERT dim_customer
        FROM 'C:\Users\Lenovo\Documents\XPERIUM\MICROSOFT_FABRIC_XPERIUM\banking_domain\Banking_Dataset\DimCustomer.csv'
        WITH
        (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDQUOTE = '"',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '-------------------------------------------------------------------------------------------';

		-- ============================================================
        -- dim_date
        -- ============================================================
        
		SET @start_time = GETDATE();

        PRINT '>>> Truncating Table: dim_date';

        TRUNCATE TABLE dim_date;

        PRINT '>>> Inserting data into: dim_date';

        BULK INSERT dim_date
        FROM 'C:\Users\Lenovo\Documents\XPERIUM\MICROSOFT_FABRIC_XPERIUM\banking_domain\Banking_Dataset\DimDate.csv'
        WITH
        (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDQUOTE = '"',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '>> ------------------------------------------------------------------------------------------';


        -- ============================================================
        -- fct_Transaction
        -- ============================================================

        SET @start_time = GETDATE();

        PRINT '>>> Truncating Table: fct_transaction';

        TRUNCATE TABLE fct_transaction;

        PRINT '>>> Inserting data into: fct_transaction';

        BULK INSERT fct_transaction
        FROM 'C:\Users\Lenovo\Documents\XPERIUM\MICROSOFT_FABRIC_XPERIUM\banking_domain\Banking_Dataset\FactTransaction.csv'
        WITH
        (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDQUOTE = '"',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(20))
            + ' seconds';

        PRINT '>> ------------------------------------------------------------------------------------------';

		SET @batch_end_time = GETDATE();
        PRINT '===========================================================================================';
        PRINT 'Tables Loaded Successfully';
		PRINT '	- Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '===========================================================================================';

    END TRY


    BEGIN CATCH

        PRINT '===========================================================================================';
        PRINT 'ERROR OCCURRED DURING LOADING TABLES';
        PRINT '===========================================================================================';

        PRINT 'Error Message: ' + ERROR_MESSAGE();

        PRINT 'Error Number: '
            + CAST(ERROR_NUMBER() AS NVARCHAR(20));

        PRINT 'Error State: '
            + CAST(ERROR_STATE() AS NVARCHAR(20));

        PRINT 'Error Severity: '
            + CAST(ERROR_SEVERITY() AS NVARCHAR(20));

        PRINT 'Error Line: '
            + CAST(ERROR_LINE() AS NVARCHAR(20));

        PRINT 'Error Procedure: '
            + ISNULL(ERROR_PROCEDURE(), 'N/A');

        PRINT '===========================================================================================';

        THROW;

    END CATCH;

END;
