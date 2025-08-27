USE ZanempiloDB;
GO

-- Donor
IF OBJECT_ID('Donor','U') IS NULL
  CREATE TABLE Donor (
    Donor_ID      INT            IDENTITY(1,1) PRIMARY KEY,
    First_Name    NVARCHAR(100)  NOT NULL,
    Last_Name     NVARCHAR(100)  NOT NULL,
    Email         NVARCHAR(255)  UNIQUE
  );
GO

-- Donation
IF OBJECT_ID('Donation','U') IS NULL
  CREATE TABLE Donation (
    Donation_ID       INT            IDENTITY(1,1) PRIMARY KEY,
    Donor_ID          INT            NOT NULL,
    DonationType      NVARCHAR(255)  NOT NULL,
    Donation_Date     DATETIME       NOT NULL,
    Description       NVARCHAR(500),
    Quantity          INT            NOT NULL,
    CONSTRAINT FK_Donation_Donor       FOREIGN KEY(Donor_ID)         REFERENCES Donor(Donor_ID)
  );
GO

-- Stock
IF OBJECT_ID('Stock','U') IS NULL
  CREATE TABLE Stock (
    Stock_ID         INT            IDENTITY(1,1) PRIMARY KEY,
    Donation_ID      INT            NOT NULL,
    Description      NVARCHAR(500),
    Quantity_In_Stock INT           NOT NULL,
    CONSTRAINT FK_Stock_Donation FOREIGN KEY(Donation_ID) REFERENCES Donation(Donation_ID)
  );
GO

-- Client
IF OBJECT_ID('Client','U') IS NULL
  CREATE TABLE Client (
    Client_ID     INT            IDENTITY(1,1) PRIMARY KEY,
    First_Name    NVARCHAR(100)  NOT NULL,
    Last_Name     NVARCHAR(100)  NOT NULL,
    Email         NVARCHAR(255)  UNIQUE
  );
GO

-- Client_Order
IF OBJECT_ID('Client_Order','U') IS NULL
  CREATE TABLE Client_Order (
    Order_ID      INT            IDENTITY(1,1) PRIMARY KEY,
    Client_ID     INT            NOT NULL,
    Stock_ID        INT            NOT NULL,
    Quantity        INT            NOT NULL,
    Order_Date    DATETIME       NOT NULL,
    CONSTRAINT FK_Order_Client FOREIGN KEY(Client_ID) REFERENCES Client(Client_ID),
    CONSTRAINT FK_OrderDetail_Stock FOREIGN KEY(Stock_ID)  REFERENCES Stock(Stock_ID)
  );
GO