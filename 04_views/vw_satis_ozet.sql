/*
View        : vw_satis_ozet
Veritabanı  : Northwind (TR)
Açıklama    : Satışların müşteri, personel ve toplam tutar bazlı özeti
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.vw_satis_ozet', 'V') IS NOT NULL
    DROP VIEW dbo.vw_satis_ozet;
GO

CREATE VIEW dbo.vw_satis_ozet
AS
SELECT
    s.SatisID,
    s.SatisTarihi,
    m.MusteriAdi,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS ToplamTutar
FROM dbo.Satislar s
INNER JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
INNER JOIN dbo.Personeller p
    ON s.PersonelID = p.PersonelID
INNER JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    s.SatisID,
    s.SatisTarihi,
    m.MusteriAdi,
    p.Adi,
    p.Soyadi;
GO
