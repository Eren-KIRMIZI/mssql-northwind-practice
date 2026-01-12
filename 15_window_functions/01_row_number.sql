/*
Konu        : ROW_NUMBER()
Amaç        : Sıralı numaralandırma
*/

USE Northwind;
GO

SELECT
    UrunID,
    UrunAdi,
    BirimFiyati,
    ROW_NUMBER() OVER (ORDER BY BirimFiyati DESC) AS SiraNo
FROM dbo.Urunler;
GO
