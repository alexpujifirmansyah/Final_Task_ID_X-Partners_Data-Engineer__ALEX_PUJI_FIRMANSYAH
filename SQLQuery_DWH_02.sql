create database DWH

use DWH

drop database DWH

SELECT * FROM DimCustomer;
SELECT * FROM DimAccount;
SELECT * FROM DimBranch;
SELECT * FROM FactTransaction;


-- Tabel DimCustomer
CREATE TABLE DimCustomer (
    Customer_Id INT PRIMARY KEY NOT NULL, -- Primary Key
    Customer_Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City_Name VARCHAR(50) NOT NULL,
    State_Name VARCHAR(50) NOT NULL,
    Age int NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL
);

-- Tabel DimAccount
CREATE TABLE DimAccount (
    Account_Id INT PRIMARY KEY NOT NULL, -- Primary Key
    Customer_Id INT NOT NULL, -- Foreign Key ke DimCustomer
    Account_Type VARCHAR(50) NOT NULL,
    Balance INT NOT NULL,
    Date_Opened DATETIME NOT NULL,
    Status VARCHAR(50) NOT NULL,
	FOREIGN KEY (Customer_id) REFERENCES DimCustomer(Customer_Id)
	
);

-- Tabel DimBranch
CREATE TABLE DimBranch (
    Branch_Id INT PRIMARY KEY NOT NULL, -- Primary Key
    Branch_Name VARCHAR(50) NOT NULL,
    Branch_Location VARCHAR(50) NOT NULL
);

-- Tabel FactTransaction
CREATE TABLE FactTransaction (
    Transaction_Id INT PRIMARY KEY NOT NULL, -- Primary Key
    Account_Id INT NOT NULL, -- Foreign Key ke DimAccount
    Transaction_Date DATETIME2 NOT NULL,
    Amount DECIMAL NOT NULL,
    Transaction_Type VARCHAR(50) NOT NULL,
    Branch_Id INT NOT NULL, -- Foreign Key ke DimBranch

	FOREIGN KEY (Account_Id) REFERENCES DimAccount(Account_Id),
	FOREIGN KEY (Branch_Id) REFERENCES DimBranch(Branch_Id)
);

