/*
Konu        : EXECUTION PLAN
Amaç        : Sorguların nasıl çalıştığını görmek
*/

USE Northwind;
GO

-- Execution Plan'ı aç (SSMS)
SET STATISTICS PROFILE ON;
GO

SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;
GO

SET STATISTICS PROFILE OFF;
GO
