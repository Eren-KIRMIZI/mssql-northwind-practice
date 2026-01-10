/*
Procedure   : sp_aylik_satis_raporu
Açıklama   : Girilen yıl için aylık satış raporu üretir
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.sp_aylik_satis_raporu', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_aylik_satis_raporu;
GO

CREATE PROCEDURE dbo.sp_aylik_satis_raporu
    @Yil int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        MONTH(s.SatisTarihi) AS Ay,
        COUNT(DISTINCT s.SatisID) AS SatisSayisi,
        SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS ToplamCiro
    FROM dbo.Satislar s
    JOIN dbo.[Satis Detaylari] sd
        ON s.SatisID = sd.SatisID
    WHERE YEAR(s.SatisTarihi) = @Yil
    GROUP BY
        MONTH(s.SatisTarihi)
    ORDER BY
        Ay;
END;
GO
