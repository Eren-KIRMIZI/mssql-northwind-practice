/*
Konu        : TEMP TABLE vs TABLE VARIABLE
Amaç        : Hangisi ne zaman kullanılır?  “Küçük veri için table variable, büyük veri ve join için temp table kullanırım.”
*/

USE Northwind;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--------------------------------------------------
-- TEMP TABLE
--------------------------------------------------
CREATE TABLE #TempUrunler
(
    UrunID INT,
    UrunAdi NVARCHAR(40),
    BirimFiyati MONEY
);

INSERT INTO #TempUrunler
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 50;

SELECT * FROM #TempUrunler;

DROP TABLE #TempUrunler;

--------------------------------------------------
-- TABLE VARIABLE
--------------------------------------------------
DECLARE @VarUrunler TABLE
(
    UrunID INT,
    UrunAdi NVARCHAR(40),
    BirimFiyati MONEY
);

INSERT INTO @VarUrunler
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 50;

SELECT * FROM @VarUrunler;
GO
