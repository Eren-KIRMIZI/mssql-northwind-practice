/*
Function    : fn_tarih_farki
Açıklama   : İki tarih arasındaki gün farkını döndürür
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.fn_tarih_farki', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_tarih_farki;
GO

CREATE FUNCTION dbo.fn_tarih_farki
(
    @BaslangicTarihi date,
    @BitisTarihi date
)
RETURNS int
AS
BEGIN
    RETURN DATEDIFF(DAY, @BaslangicTarihi, @BitisTarihi);
END;
GO
