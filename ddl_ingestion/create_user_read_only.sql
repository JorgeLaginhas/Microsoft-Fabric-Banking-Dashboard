-- This script creates a database user thta only can read

-- Create a LOGIN in the server
CREATE LOGIN bankingdomain_read_only WITH PASSWORD = '7EB178CF89';

-- Defines access to the database
USE  banking_domain;
GO

-- Create a user in the database
CREATE USER bankingdomain_read_only FOR LOGIN bankingdomain_read_only;

-- Gives access of reading to the user
EXEC sp_addrolemember 'db_datareader', 'bankingdomain_read_only';

-- explicitly denies write permissions
DENY INSERT, UPDATE, DELETE, EXECUTE TO bankingdomain_read_only;
