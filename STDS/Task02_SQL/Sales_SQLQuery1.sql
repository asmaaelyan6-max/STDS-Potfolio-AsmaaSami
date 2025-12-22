/*
--------------------------------------------
Data Cleaning & Exploration
Database: AdventureWorkslt2022
Table 1: Address
--------------------------------------------
Skills used: Data Exploration, Data Cleaning, Null Handling, Duplicate Check, Creating Clean Tables
--------------------------------------------
*/

-- Step 1️: Select Database
-- Ensures we are working in the correct database
USE AdventureWorksLT2022;
GO

-- Step 2️: Check Column Names & Data Types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Address';
GO


-- Step 3️: Count Total Rows in the Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.Address;
GO

-- Step 4️: Preview the Data
SELECT TOP (50) *
FROM SalesLT.Address;
GO

-- Step 5️: Create a Clean Version of the Table
SELECT 
    AddressID,
    AddressLine1,
    City,
    StateProvince,
    CountryRegion,
    PostalCode
INTO Clean_Address
FROM SalesLT.Address;
GO


-- Step 6️: Preview the Cleaned Data
SELECT TOP (10) * 
FROM dbo.Clean_Address;
GO

-- Step 7️: Check for Missing (NULL) Values in Clean_Address
SELECT
    SUM(CASE WHEN AddressID IS NULL THEN 1 ELSE 0 END) AS Null_AddressID,
    SUM(CASE WHEN AddressLine1 IS NULL THEN 1 ELSE 0 END) AS Null_AddressLine1,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS Null_City,
    SUM(CASE WHEN StateProvince IS NULL THEN 1 ELSE 0 END) AS Null_StateProvince,
    SUM(CASE WHEN CountryRegion IS NULL THEN 1 ELSE 0 END) AS Null_CountryRegion,
    SUM(CASE WHEN PostalCode IS NULL THEN 1 ELSE 0 END) AS Null_PostalCode
FROM dbo.Clean_Address;
GO

-- Step 8️: Check for Duplicate Records in Clean_Address
SELECT 
    AddressID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_Address
GROUP BY AddressID
HAVING COUNT(*) > 1;
GO

-- Verify the new table was created successfully
SELECT TOP (10) * 
FROM dbo.Clean_Address;
GO
/*
------------------------------------------------------------------------------------------
Table 2: Customer
------------------------------------------------------------------------------------------
*/

-- Step 1: Check Column Names & Data Types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customer';
GO

-- Step 2: Count Total Rows in the Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.Customer;
GO
-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.Customer;
GO

-- Step 4: Create a Clean Version of the Table
SELECT 
    CustomerID,
    CompanyName,
    SalesPerson
INTO Clean_Customer
FROM SalesLT.Customer;
GO

-- Step 5: Preview the Cleaned Data
SELECT TOP (10) * 
FROM dbo.Clean_Customer;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_Customer
SELECT
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
    SUM(CASE WHEN CompanyName IS NULL THEN 1 ELSE 0 END) AS Null_CompanyName,
    SUM(CASE WHEN SalesPerson IS NULL THEN 1 ELSE 0 END) AS Null_SalesPerson
FROM dbo.Clean_Customer;
GO

-- Step 7: Check for Duplicate Records in Clean_Customer
SELECT 
    CustomerID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_Customer
GROUP BY CustomerID
HAVING COUNT(*) > 1;
GO

-- Verify the new table was created successfully
SELECT TOP (10) * 
FROM dbo.Clean_Customer;
GO

/*
------------------------------------------------------------------------------------------
Table 3: CustomerAddress
------------------------------------------------------------------------------------------
*/

-- Step 1: Check Column Names & Data Types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CustomerAddress';
GO

-- Step 2: Count Total Rows in the Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.CustomerAddress;
GO

-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.CustomerAddress;
GO

-- Step 4: Create a Clean Version of the Table
SELECT 
    CustomerID,
    AddressID,
    AddressType
INTO Clean_CustomerAddress
FROM SalesLT.CustomerAddress;
GO

-- Step 5: Preview the Cleaned Data
SELECT TOP (10) * 
FROM dbo.Clean_CustomerAddress;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_CustomerAddress
SELECT
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
    SUM(CASE WHEN AddressID IS NULL THEN 1 ELSE 0 END) AS Null_AddressID,
    SUM(CASE WHEN AddressType IS NULL THEN 1 ELSE 0 END) AS Null_AddressType
FROM dbo.Clean_CustomerAddress;
GO

-- Step 7: Check for Duplicate Records in Clean_CustomerAddress
SELECT 
    CustomerID,
    AddressID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_CustomerAddress
GROUP BY CustomerID, AddressID
HAVING COUNT(*) > 1;
GO

-- Verify the new table was created successfully
SELECT TOP (10) * 
FROM dbo.Clean_CustomerAddress;
GO


/*
------------------------------------------------------------------------------------------
Table 4: Product
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product';
GO

-- Step 2: Count Total Rows in Product Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.Product;
GO

-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.Product;
GO

-- Step 4: Create a Clean Version of the Product Table
SELECT 
    ProductID,
    Name,
    ProductNumber,
    StandardCost,
    ListPrice,
    ProductCategoryID,
    ProductModelID,
    SellStartDate
INTO Clean_Product
FROM SalesLT.Product;
GO

-- Step 5: Preview the Cleaned Product Table
SELECT TOP (10) * 
FROM dbo.Clean_Product;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_Product
SELECT
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS Null_ProductID,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Null_Name,
    SUM(CASE WHEN ProductNumber IS NULL THEN 1 ELSE 0 END) AS Null_ProductNumber,
    SUM(CASE WHEN StandardCost IS NULL THEN 1 ELSE 0 END) AS Null_StandardCost,
    SUM(CASE WHEN ListPrice IS NULL THEN 1 ELSE 0 END) AS Null_ListPrice,
    SUM(CASE WHEN ProductCategoryID IS NULL THEN 1 ELSE 0 END) AS Null_ProductCategoryID,
    SUM(CASE WHEN ProductModelID IS NULL THEN 1 ELSE 0 END) AS Null_ProductModelID,
    SUM(CASE WHEN SellStartDate IS NULL THEN 1 ELSE 0 END) AS Null_SellStartDate
FROM dbo.Clean_Product;
GO

-- Step 7: Check for Duplicate Records in Clean_Product
SELECT 
    ProductID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_Product
GROUP BY ProductID
HAVING COUNT(*) > 1;
GO

-- Step 8: Add Day, Month, and Year columns for SellStartDate
ALTER TABLE dbo.Clean_Product
ADD 
    SellStartDay INT,
    SellStartMonth INT,
    SellStartYear INT;
GO

-- Step 9: Populate the new columns from SellStartDate
UPDATE dbo.Clean_Product
SET 
    SellStartDay = DAY(SellStartDate),
    SellStartMonth = MONTH(SellStartDate),
    SellStartYear = YEAR(SellStartDate);
GO

-- Step 10: (Optional) Drop the original SellStartDate column
ALTER TABLE dbo.Clean_Product
DROP COLUMN SellStartDate;
GO

-- Step 11: Verify Clean_Product Table
SELECT TOP (10) * 
FROM dbo.Clean_Product;
GO

/*
------------------------------------------------------------------------------------------
Table 5: ProductCategory
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProductCategory';
GO


-- Step 2: Count Total Rows in ProductCategory Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.ProductCategory;
GO

-- Step 3: Preview the Data
SELECT TOP (41) *
FROM SalesLT.ProductCategory;
GO

-- Step 4: Create a Clean Version of the Product Table
SELECT 
    ProductCategoryID,
    Name
INTO Clean_ProductCategory
FROM SalesLT.ProductCategory;
GO

/*
------------------------------------------------------------------------------------------
Table 6: ProductModel
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProductModel';
GO


-- Step 2: Count Total Rows in ProductModel Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.ProductModel;
GO

-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.ProductModel;
GO

-- Step 4: Create a Clean Version of the Product Table
SELECT 
    ProductModelID,
    Name
INTO Clean_ProductModel
FROM SalesLT.ProductModel;
GO

-- Step 5: Preview the Cleaned Product Table
SELECT TOP (10) * 
FROM dbo.Clean_ProductModel;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_ProductModel
SELECT
    SUM(CASE WHEN ProductModelID IS NULL THEN 1 ELSE 0 END) AS Null_ProductModelID,
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Null_Name
FROM dbo.Clean_ProductModel;
GO

-- Step 7: Check for Duplicate Records in Clean_Product
SELECT 
    ProductModelID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_ProductModel
GROUP BY ProductModelID
HAVING COUNT(*) > 1;
GO

-- Step 8: Verify Clean_Product Table
SELECT TOP (10) * 
FROM dbo.Clean_ProductModel;
GO

/*
------------------------------------------------------------------------------------------
Table 7: ProductModelProductDescription
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProductModelProductDescription';
GO

-- Step 2: Count Total Rows in ProductModel Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.ProductModelProductDescription;
GO

-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.ProductModelProductDescription;
GO


-- Step 4: Create a Clean Version of the Product Table
SELECT 
    ProductModelID,
    Culture
INTO Clean_ProductModelProductDescription
FROM SalesLT.ProductModelProductDescription;
GO

-- Step 5: Preview the Cleaned Product Table
SELECT TOP (10) * 
FROM dbo.Clean_ProductModelProductDescription;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_ProductModelProductDescription
SELECT
    SUM(CASE WHEN ProductModelID IS NULL THEN 1 ELSE 0 END) AS Null_ProductModelID,
    SUM(CASE WHEN Culture IS NULL THEN 1 ELSE 0 END) AS Null_Culture
FROM dbo.Clean_ProductModelProductDescription;
GO

-- Step 7: Check for Duplicate Records in Clean_Product
SELECT 
    ProductModelID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_ProductModelProductDescription
GROUP BY ProductModelID
HAVING COUNT(*) > 1;
GO

-- Step 8: Verify Clean_Product Table
SELECT TOP (10) * 
FROM dbo.Clean_ProductModelProductDescription;
GO

/*
------------------------------------------------------------------------------------------
Table 8: SalesOrderDetail
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderDetail';
GO


-- Step 2: Count Total Rows in ProductModel Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.SalesOrderDetail;
GO

-- Step 3: Preview the Data
SELECT TOP (50) *
FROM SalesLT.SalesOrderDetail;
GO


-- Step 4: Create a Clean Version of the Product Table
SELECT 
    SalesOrderID,
    SalesOrderDetailID,
    OrderQty,
    ProductID,
    UnitPrice,
    UnitPriceDiscount,
    LineTotal
INTO Clean_SalesOrderDetail
FROM SalesLT.SalesOrderDetail;
GO

-- Step 5: Preview the Cleaned Product Table
SELECT TOP (10) * 
FROM dbo.Clean_SalesOrderDetail;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_SalesOrderDetail
SELECT
    SUM(CASE WHEN SalesOrderID IS NULL THEN 1 ELSE 0 END) AS Null_SalesOrderID,
    SUM(CASE WHEN SalesOrderDetailID IS NULL THEN 1 ELSE 0 END) AS Null_SalesOrderDetailID,
    SUM(CASE WHEN OrderQty IS NULL THEN 1 ELSE 0 END) AS Null_OrderQty,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS Null_ProductID,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS Null_UnitPrice,
    SUM(CASE WHEN UnitPriceDiscount IS NULL THEN 1 ELSE 0 END) AS Null_UnitPriceDiscount,
    SUM(CASE WHEN LineTotal IS NULL THEN 1 ELSE 0 END) AS Null_LineTotal
FROM dbo.Clean_SalesOrderDetail;
GO

-- Step 7: Check for Duplicate Records in Clean_SalesOrderDetail
SELECT 
    SalesOrderDetailID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_SalesOrderDetail
GROUP BY SalesOrderDetailID
HAVING COUNT(*) > 1;
GO

-- Step 8: Verify Clean_SalesOrderDetail Table
SELECT TOP (10) * 
FROM dbo.Clean_SalesOrderDetail;
GO

/*
------------------------------------------------------------------------------------------
Table 9: SalesOrderHeader
------------------------------------------------------------------------------------------
*/
-- Step 1: Check Column Names & Data Types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader';
GO

-- Step 2: Count Total Rows in ProductModel Table
SELECT COUNT(*) AS TotalRows
FROM SalesLT.SalesOrderHeader;
GO

-- Step 3: Preview the Data
SELECT TOP (32) *
FROM SalesLT.SalesOrderHeader;
GO

-- Step 4: Create a Clean Version of the SalesOrderHeader Table
SELECT 
    SalesOrderID,
    OrderDate,
    DueDate,
    ShipDate,
    Status,
    OnlineOrderFlag,
    SalesOrderNumber,
    PurchaseOrderNumber,
    AccountNumber,
    CustomerID,
    ShipToAddressID,
    BillToAddressID,
    ShipMethod,
    SubTotal,
    TaxAmt,
    Freight,
    TotalDue
INTO Clean_SalesOrderHeader
FROM SalesLT.SalesOrderHeader;
GO

-- Step 5: Preview the Cleaned Product Table
SELECT TOP (10) * 
FROM dbo.Clean_SalesOrderHeader;
GO

-- Step 6: Check for Missing (NULL) Values in Clean_SalesOrderHeader

SELECT
    SUM(CASE WHEN SalesOrderID IS NULL THEN 1 ELSE 0 END) AS Null_SalesOrderID,
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END) AS Null_OrderDate,
    SUM(CASE WHEN DueDate IS NULL THEN 1 ELSE 0 END) AS Null_DueDate,
    SUM(CASE WHEN ShipDate IS NULL THEN 1 ELSE 0 END) AS Null_ShipDate,
    SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END) AS Null_Status,
    SUM(CASE WHEN OnlineOrderFlag IS NULL THEN 1 ELSE 0 END) AS Null_OnlineOrderFlag,
    SUM(CASE WHEN SalesOrderNumber IS NULL THEN 1 ELSE 0 END) AS Null_SalesOrderNumber,
    SUM(CASE WHEN PurchaseOrderNumber IS NULL THEN 1 ELSE 0 END) AS Null_PurchaseOrderNumber,
    SUM(CASE WHEN AccountNumber IS NULL THEN 1 ELSE 0 END) AS Null_AccountNumber,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Null_CustomerID,
    SUM(CASE WHEN ShipToAddressID IS NULL THEN 1 ELSE 0 END) AS Null_ShipToAddressID,
    SUM(CASE WHEN BillToAddressID IS NULL THEN 1 ELSE 0 END) AS Null_BillToAddressID,
    SUM(CASE WHEN ShipMethod IS NULL THEN 1 ELSE 0 END) AS Null_ShipMethod,
    SUM(CASE WHEN SubTotal IS NULL THEN 1 ELSE 0 END) AS Null_SubTotal,
    SUM(CASE WHEN TaxAmt IS NULL THEN 1 ELSE 0 END) AS Null_TaxAmt,
    SUM(CASE WHEN Freight IS NULL THEN 1 ELSE 0 END) AS Null_Freight,
    SUM(CASE WHEN TotalDue IS NULL THEN 1 ELSE 0 END) AS Null_TotalDue
FROM dbo.Clean_SalesOrderHeader;
GO

-- Step 7: Check for Duplicate Records in Clean_SalesOrderHeader
SELECT 
    SalesOrderID,
    COUNT(*) AS DuplicateCount
FROM dbo.Clean_SalesOrderHeader
GROUP BY SalesOrderID
HAVING COUNT(*) > 1;
GO

-- Step 8: Add Day, Month, and Year columns for each date
ALTER TABLE dbo.Clean_SalesOrderHeader
ADD 
    OrderDay INT,
    OrderMonth INT,
    OrderYear INT,
    DueDay INT,
    DueMonth INT,
    DueYear INT,
    ShipDay INT,
    ShipMonth INT,
    ShipYear INT;
GO

-- Step 9: Populate the new columns from the original dates
UPDATE dbo.Clean_SalesOrderHeader
SET 
    OrderDay = DAY(OrderDate),
    OrderMonth = MONTH(OrderDate),
    OrderYear = YEAR(OrderDate),
    DueDay = DAY(DueDate),
    DueMonth = MONTH(DueDate),
    DueYear = YEAR(DueDate),
    ShipDay = DAY(ShipDate),
    ShipMonth = MONTH(ShipDate),
    ShipYear = YEAR(ShipDate);
GO

-- Step 10: Drop the original date columns after copying
ALTER TABLE dbo.Clean_SalesOrderHeader
DROP COLUMN OrderDate, DueDate, ShipDate;
GO

-- Step 11: Verify the results
SELECT TOP (10) 
    SalesOrderID,
    OrderDay, OrderMonth, OrderYear,
    DueDay, DueMonth, DueYear,
    ShipDay, ShipMonth, ShipYear
FROM dbo.Clean_SalesOrderHeader;
GO

-- Step 12: Verify Clean_SalesOrderHeader Table
SELECT TOP (10) * 
FROM dbo.Clean_SalesOrderHeader;
GO


/*
DROP TABLE IF EXISTS dbo.Clean_Address;
DROP TABLE IF EXISTS dbo.Clean_Customer;
DROP TABLE IF EXISTS dbo.Clean_CustomerAddress;
DROP TABLE IF EXISTS dbo.Clean_Product;
DROP TABLE IF EXISTS dbo.Clean_ProductCategory;
DROP TABLE IF EXISTS dbo.Clean_ProductModel;
DROP TABLE IF EXISTS dbo.Clean_ProductModelProductDescription;
DROP TABLE IF EXISTS dbo.Clean_SalesOrderDetail;
DROP TABLE IF EXISTS dbo.Clean_SalesOrderHeader;
GO
*/


/*
------------------------------------------------------------------------------------------
Table: Merged_SalesData
------------------------------------------------------------------------------------------
*/

SELECT 
    soh.SalesOrderID,
    soh.Status,
    soh.OnlineOrderFlag,
    soh.SalesOrderNumber,
    soh.PurchaseOrderNumber,
    soh.AccountNumber,

    c.CustomerID,
    c.CompanyName,

    a_ship.AddressLine1 AS ShipAddress,
    a_ship.City AS ShipCity,
    a_ship.StateProvince AS ShipState,
    a_ship.PostalCode AS ShipPostalCode,
    a_bill.AddressLine1 AS BillAddress,
    a_bill.City AS BillCity,
    a_bill.StateProvince AS BillState,
    a_bill.PostalCode AS BillPostalCode,

    sod.SalesOrderDetailID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal,

    p.ProductID,
    p.Name AS ProductName,
    p.StandardCost,
    p.ListPrice,
    pc.Name AS ProductCategory,

    pm.Name AS ProductModel,

    pmpd.Culture AS ProductDescription
INTO Merged_SalesData
FROM dbo.Clean_SalesOrderHeader AS soh
LEFT JOIN dbo.Clean_Customer AS c
    ON soh.CustomerID = c.CustomerID
LEFT JOIN dbo.Clean_CustomerAddress AS ca_ship
    ON soh.ShipToAddressID = ca_ship.AddressID AND soh.CustomerID = ca_ship.CustomerID
LEFT JOIN dbo.Clean_Address AS a_ship
    ON ca_ship.AddressID = a_ship.AddressID
LEFT JOIN dbo.Clean_CustomerAddress AS ca_bill
    ON soh.BillToAddressID = ca_bill.AddressID AND soh.CustomerID = ca_bill.CustomerID
LEFT JOIN dbo.Clean_Address AS a_bill
    ON ca_bill.AddressID = a_bill.AddressID
LEFT JOIN dbo.Clean_SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN dbo.Clean_Product AS p
    ON sod.ProductID = p.ProductID
LEFT JOIN dbo.Clean_ProductCategory AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN dbo.Clean_ProductModel AS pm
    ON p.ProductModelID = pm.ProductModelID
LEFT JOIN dbo.Clean_ProductModelProductDescription AS pmpd
    ON p.ProductModelID = pmpd.ProductModelID;
GO



SELECT *
FROM Merged_SalesData;
GO
