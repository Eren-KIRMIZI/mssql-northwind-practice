/*
Konu        : CTE + JOIN
Amaç        : Kompleks sorguları sadeleştirmek
*/

USE Northwind;
GO

WITH UrunKategori AS
(
    SELECT
        u.UrunID,
        u.UrunAdi,
        u.BirimFiyati,
        k.KategoriAdi
    FROM dbo.Urunler u
    INNER JOIN dbo.Kategoriler k
        ON u.KategoriID = k.KategoriID
)
SELECT
    KategoriAdi,
    COUNT(*) AS UrunSayisi,
    AVG(BirimFiyati) AS OrtalamaFiyat
FROM UrunKategori
GROUP BY KategoriAdi;
GO

-- Alt sorgu karmaşası yok,  Debug + bakım kolay
