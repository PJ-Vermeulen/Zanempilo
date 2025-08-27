USE ZanempiloDB;
GO

-- Donation types
INSERT INTO Donation_Type (Description) VALUES
  ('Food'),
  ('Medical Supplies'),
  ('Clothing'),
  ('Hygiene Products');
GO

-- Donors
INSERT INTO Donor (First_Name, Last_Name, Email) VALUES
  ('Thabo',   'Mokoena',       'thabo.mokoena@example.com'),
  ('Naledi',  'Khumalo',       'naledi.khumalo@example.com'),
  ('Pieter',  'van der Merwe', 'pieter.vdmerwe@example.com'),
  ('Aisha',   'Patel',         'aisha.patel@example.com');
GO

-- Donations
INSERT INTO Donation (Donor_ID, DonationType_ID, Donation_Date, Description, Quantity) VALUES
  (1, 1, '2025-08-20', 'Canned Food Packs',        100),
  (2, 2, '2025-08-21', 'Surgical Masks',           200),
  (3, 3, '2025-08-22', 'Warm Blankets',             50),
  (4, 4, '2025-08-23', 'Bars of Soap',             150),
  (1, 1, '2025-08-24', 'Bottled Water Cases',       75),
  (2, 2, '2025-08-25', 'Disposable Gloves (pairs)', 120);
GO

-- Stock (one row per donation batch)
INSERT INTO Stock (Donation_ID, Description, Quantity_In_Stock) VALUES
  (1, 'Canned Food Packs',           100),
  (2, 'Surgical Masks',              200),
  (3, 'Warm Blankets',                50),
  (4, 'Bars of Soap',                150),
  (5, 'Bottled Water Cases',          75),
  (6, 'Disposable Gloves (pairs)',   120);
GO

-- Clients
INSERT INTO Client (First_Name, Last_Name, Email) VALUES
  ('Sipho',   'Dlamini',   'sipho.dlamini@example.com'),
  ('Lindiwe', 'Zulu',      'lindiwe.zulu@example.com'),
  ('Johan',   'Smit',      'johan.smit@example.com'),
  ('Fatima',  'Mohamed',   'fatima.mohamed@example.com');
GO

-- Client orders
INSERT INTO Client_Order (Client_ID, Order_Date) VALUES
  (1, '2025-08-26'),
  (2, '2025-08-27'),
  (3, '2025-08-28'),
  (4, '2025-08-29'),
  (1, '2025-08-30');
GO

-- Order details
INSERT INTO Order_Detail (Order_ID, Stock_ID, Quantity) VALUES
  (1, 1,  20),  
  (1, 5,  10),  
  (2, 2,  15),  
  (2, 6,  25),  
  (3, 3,   2),  
  (4, 4,  30),  
  (5, 1,  10),  
  (5, 6,  20);
GO
