/*
View        : vw_musteri_satis
Veritabanı  : Northwind (TR)
Açıklama    : Müşteri bazlı toplam satış sayısı ve toplam ciro
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.vw_musteri_satis', 'V') IS NOT NULL
    DROP VIEW dbo.vw_musteri_satis;
GO

CREATE VIEW dbo.vw_musteri_satis
AS
SELECT
    m.MusteriID,
    m.SirketAdi,
    m.MusteriAdi,
    COUNT(DISTINCT s.SatisID) AS ToplamSatisSayisi,
    SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.Indirim)) AS ToplamCiro
FROM dbo.Musteriler m
LEFT JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
LEFT JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    m.MusteriID,
    m.SirketAdi,
    m.MusteriAdi;
GO
