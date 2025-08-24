USE Zanempilo;
GO

-- 1. Summary of donations per donor
IF OBJECT_ID('sp_GetDonationsByDonor','P') IS NOT NULL
  DROP PROCEDURE sp_GetDonationsByDonor;
GO
CREATE PROCEDURE sp_GetDonationsByDonor
  @DonorID INT = NULL
AS
BEGIN
  SELECT 
    d.Donor_ID,
    d.First_Name + ' ' + d.Last_Name AS DonorName,
    dt.Description       AS DonationType,
    SUM(do.Quantity)     AS TotalQuantity
  FROM Donation do
  JOIN Donor d           ON do.Donor_ID = d.Donor_ID
  JOIN Donation_Type dt  ON do.DonationType_ID = dt.DonationType_ID
  WHERE @DonorID IS NULL OR d.Donor_ID = @DonorID
  GROUP BY d.Donor_ID, d.First_Name, d.Last_Name, dt.Description;
END;
GO

-- 2. Place a new order (inserts header & details)
IF OBJECT_ID('sp_PlaceOrder','P') IS NOT NULL
  DROP PROCEDURE sp_PlaceOrder;
GO
CREATE PROCEDURE sp_PlaceOrder
  @ClientID INT,
  @OrderDate DATETIME,
  @StockID INT,
  @Qty INT
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @OrderID INT;
  INSERT INTO Client_Order (Client_ID, Order_Date)
    VALUES (@ClientID, @OrderDate);
  SET @OrderID = SCOPE_IDENTITY();

  INSERT INTO Order_Detail (Order_ID, Stock_ID, Quantity)
    VALUES (@OrderID, @StockID, @Qty);
END;
GO
