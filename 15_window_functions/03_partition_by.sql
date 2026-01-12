/*
Konu        : PARTITION BY
Amaç        : Grup içinde sıralama  Her kategori kendi içinde 1’den başlar.
*/

USE Northwind;
GO

SELECT
    k.KategoriAdi,
    u.UrunAdi,
    u.BirimFiyati,
    ROW_NUMBER() OVER (
        PARTITION BY k.KategoriAdi
        ORDER BY u.BirimFiyati DESC
    ) AS KategoriIciSira
FROM dbo.Urunler u
INNER JOIN dbo.Kategoriler k
    ON u.KategoriID = k.KategoriID;
GO
