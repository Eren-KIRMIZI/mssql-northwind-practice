/*
Konu        : TABLE VARIABLE (@)
Amaç        : Küçük veri setleri için geçici tablo
*/

USE Northwind;
GO

DECLARE @PahaliUrunler TABLE
(
    UrunID INT,
    UrunAdi NVARCHAR(40),
    BirimFiyati MONEY
);

INSERT INTO @PahaliUrunler
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;

SELECT * FROM @PahaliUrunler;
GO
