/*
=======================================================================================================
ddl Script Create Tables
=======================================================================================================
Script Purpose:

	This script creates tables, dropping existing tables
	if they already exist.
	Run this script to re-define the DDL structure of Tables
=======================================================================================================
*/

IF OBJECT_ID ('dim_Account', 'U') IS NOT NULL
	DROP TABLE dim_Account;
CREATE TABLE dim_Account(
	AccountKey					INT,
	AccountID					INT,
	CustomerKey					INT,
	AccountType					VARCHAR(50),
	AccountStatus				VARCHAR(50),
	OpenDate					DATE,
	CreditLimit					DECIMAL(10,2),
	InterestRate				DECIMAL(2,2)
);

IF OBJECT_ID ('dim_branch', 'U') IS NOT NULL
	DROP TABLE dim_branch;
CREATE TABLE dim_branch(
	BranchKey					 INT,
	BranchID					 NVARCHAR(50),
	BranchName					 NVARCHAR(50),
	City						 NVARCHAR(50),
	State						 NVARCHAR(50),
	Region						 NVARCHAR(50),
	BranchType					 NVARCHAR(50)
);

IF OBJECT_ID ('dim_customer', 'U') IS NOT NULL
	DROP TABLE dim_customer;
CREATE TABLE dim_customer(
	CustomerKey					INT,
	CustomerID					NVARCHAR(50),
	FirstName					NVARCHAR(50),
	LastName					NVARCHAR(50),
	Gender						NVARCHAR(50),
	DateOfBirth					DATE,
	City						NVARCHAR(50),
	State						NVARCHAR(50),
	Occupation					NVARCHAR(50),
	CustomerSegment				NVARCHAR(50),
	AnnualIncome				DECIMAL(10, 2),
	CustomerSince				DATE
);

IF OBJECT_ID ('dim_date', 'U') IS NOT NULL
	DROP TABLE dim_date;
CREATE TABLE dim_date(
	DateKey						INT,
	Date						DATE,
	Day							INT,
	Month						INT,
	MonthName					NVARCHAR(50),
	Quarter						NVARCHAR(50),
	Year						INT,
	WeekNumber					INT,
	DayName						NVARCHAR(50),
	IsWeekend					NVARCHAR(50)
);

IF OBJECT_ID ('fct_transaction', 'U') IS NOT NULL
	DROP TABLE fct_transaction;
CREATE TABLE fct_transaction(
	TransactionKey				    INT,
	DateKey						    INT,
	CustomerKey					    INT,
	AccountKey					    INT,
	BranchKey					    INT,
	TransactionID				    NVARCHAR(50),
	TransactionType				    NVARCHAR(50),
	TransactionChannel			  	NVARCHAR(50),
	TransactionAmount			    DECIMAL(10,2),
	BalanceAfterTransaction			DECIMAl(10,2),
	TransactionStatus			    NVARCHAR(50)
);


