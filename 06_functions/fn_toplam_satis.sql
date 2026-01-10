/*
Function    : fn_toplam_satis
Açıklama   : Girilen MusteriID için toplam satış tutarını döndürür
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.fn_toplam_satis', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_toplam_satis;
GO

CREATE FUNCTION dbo.fn_toplam_satis
(
    @MusteriID nchar(5)
)
RETURNS money
AS
BEGIN
    DECLARE @Toplam money;

    SELECT
        @Toplam = SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim))
    FROM dbo.Satislar s
    JOIN dbo.[Satis Detaylari] sd
        ON s.SatisID = sd.SatisID
    WHERE s.MusteriID = @MusteriID;

    RETURN ISNULL(@Toplam, 0);
END;
GO
