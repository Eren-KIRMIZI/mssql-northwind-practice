/*
Procedure   : sp_musteri_satislari
Açıklama   : Girilen MusteriID'ye göre satış özeti getirir
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.sp_musteri_satislari', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_musteri_satislari;
GO

CREATE PROCEDURE dbo.sp_musteri_satislari
    @MusteriID nchar(5)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        m.MusteriID,
        m.SirketAdi,
        m.MusteriAdi,
        COUNT(DISTINCT s.SatisID) AS ToplamSatisSayisi,
        SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS ToplamCiro
    FROM dbo.Musteriler m
    LEFT JOIN dbo.Satislar s
        ON m.MusteriID = s.MusteriID
    LEFT JOIN dbo.[Satis Detaylari] sd
        ON s.SatisID = sd.SatisID
    WHERE m.MusteriID = @MusteriID
    GROUP BY
        m.MusteriID,
        m.SirketAdi,
        m.MusteriAdi;
END;
GO
