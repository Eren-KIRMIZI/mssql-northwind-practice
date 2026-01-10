/*
Procedure   : sp_parametreli_rapor
Açıklama   : Ülke ve tarih aralığına göre satış raporu
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.sp_parametreli_rapor', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_parametreli_rapor;
GO

CREATE PROCEDURE dbo.sp_parametreli_rapor
    @Ulke nvarchar(15) = NULL,
    @BaslangicTarihi date = NULL,
    @BitisTarihi date = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        m.Ulke,
        s.SatisID,
        s.SatisTarihi,
        SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS ToplamTutar
    FROM dbo.Musteriler m
    JOIN dbo.Satislar s
        ON m.MusteriID = s.MusteriID
    JOIN dbo.[Satis Detaylari] sd
        ON s.SatisID = sd.SatisID
    WHERE (@Ulke IS NULL OR m.Ulke = @Ulke)
      AND (@BaslangicTarihi IS NULL OR s.SatisTarihi >= @BaslangicTarihi)
      AND (@BitisTarihi IS NULL OR s.SatisTarihi <= @BitisTarihi)
    GROUP BY
        m.Ulke,
        s.SatisID,
        s.SatisTarihi;
END;
GO
