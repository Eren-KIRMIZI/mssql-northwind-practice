/*
Konu        : STATISTICS IO / TIME
Amaç        : Sorgunun disk ve CPU maliyetini ölçmek
*/

USE Northwind;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
