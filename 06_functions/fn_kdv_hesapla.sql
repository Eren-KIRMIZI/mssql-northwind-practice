/*
Function    : fn_kdv_hesapla
Açıklama   : Girilen tutara göre KDV'li fiyatı hesaplar
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.fn_kdv_hesapla', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_kdv_hesapla;
GO

CREATE FUNCTION dbo.fn_kdv_hesapla
(
    @Tutar money,
    @KDVOrani float
)
RETURNS money
AS
BEGIN
    RETURN @Tutar + (@Tutar * @KDVOrani);
END;
GO
