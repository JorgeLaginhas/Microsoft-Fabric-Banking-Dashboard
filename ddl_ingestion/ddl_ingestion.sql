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
	AccountID					NVARCHAR(250),
	CustomerKey					INT,
	AccountType					VARCHAR(250),
	AccountStatus				VARCHAR(250),
	OpenDate					DATE,
	CreditLimit					NVARCHAR(250),
	InterestRate				NVARCHAR(250)
);

IF OBJECT_ID ('dim_branch', 'U') IS NOT NULL
	DROP TABLE dim_branch;
CREATE TABLE dim_branch(
	BranchKey					 INT,
	BranchID					 NVARCHAR(250),
	BranchName					 NVARCHAR(250),
	City						 NVARCHAR(250),
	State						 NVARCHAR(250),
	Region						 NVARCHAR(250),
	BranchType					 NVARCHAR(250)
);

IF OBJECT_ID ('dim_customer', 'U') IS NOT NULL
	DROP TABLE dim_customer;
CREATE TABLE dim_customer(
	CustomerKey					INT,
	CustomerID					NVARCHAR(250),
	FirstName					NVARCHAR(250),
	LastName					NVARCHAR(250),
	Gender						NVARCHAR(250),
	DateOfBirth					DATE,
	City						NVARCHAR(250),
	State						NVARCHAR(250),
	Occupation					NVARCHAR(250),
	CustomerSegment				NVARCHAR(250),
	AnnualIncome				NVARCHAR(250),
	CustomerSince				DATE
);

IF OBJECT_ID ('dim_date', 'U') IS NOT NULL
	DROP TABLE dim_date;
CREATE TABLE dim_date(
	DateKey						INT,
	Date						DATE,
	Day							INT,
	Month						INT,
	MonthName					NVARCHAR(250),
	Quarter						NVARCHAR(250),
	Year						INT,
	WeekNumber					INT,
	DayName						NVARCHAR(250),
	IsWeekend					NVARCHAR(250)
);

IF OBJECT_ID ('fct_transaction', 'U') IS NOT NULL
	DROP TABLE fct_transaction;
CREATE TABLE fct_transaction(
	TransactionKey				    INT,
	DateKey						    INT,
	CustomerKey					    INT,
	AccountKey					    INT,
	BranchKey					    INT,
	TransactionID				    NVARCHAR(250),
	TransactionType				    NVARCHAR(250),
	TransactionChannel			  	NVARCHAR(250),
	TransactionAmount			    NVARCHAR(250),
	BalanceAfterTransaction			NVARCHAR(250),
	TransactionStatus			    NVARCHAR(250)
);
