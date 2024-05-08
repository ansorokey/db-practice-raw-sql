-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Products] (
    [ProductName] varchar(100)  NOT NULL ,
    [PartNumber] int  NOT NULL ,
    [Size] varchar(20)  NULL ,
    [Color] varchar(20)  NULL ,
    [Price] money  NOT NULL ,
    [Supplier] varchar(100)  NOT NULL ,
    [QuantityInStock] int  NOT NULL CONSTRAINT [DF_Products_QuantityInStock] DEFAULT (0),
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED (
        [PartNumber] ASC
    ),
    CONSTRAINT [UK_Products_ProductName] UNIQUE (
        [ProductName]
    )
)

CREATE TABLE [Suppliers] (
    [SupplierID] int  NOT NULL ,
    [SupplierName] varchar(100)  NOT NULL ,
    [PhoneNumber] char(10)  NOT NULL ,
    [StreetAddress] varchar(100)  NOT NULL ,
    [City] varchar(50)  NOT NULL ,
    [State] char(2)  NOT NULL ,
    [Zip] char(9)  NOT NULL ,
    CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED (
        [SupplierID] ASC
    )
)

CREATE INDEX [idx_Suppliers_SupplierName]
ON [Suppliers] ([SupplierName])

COMMIT TRANSACTION QUICKDBD