/*
Konu        : BASIC CTE
Amaç        : Sorgu okunabilirliğini artırmak
*/

USE Northwind;
GO

WITH PahaliUrunler AS
(
    SELECT
        UrunID,
        UrunAdi,
        BirimFiyati
    FROM dbo.Urunler
    WHERE BirimFiyati > 100
)
SELECT *
FROM PahaliUrunler
ORDER BY BirimFiyati DESC;
GO

/*
CTE geçici result set’tir.
Sadece hemen altındaki sorguda geçerlidir.
*/
