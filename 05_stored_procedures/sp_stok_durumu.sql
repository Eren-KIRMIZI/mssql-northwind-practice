/*
Procedure   : sp_stok_durumu
Açıklama   : Kritik stok seviyesindeki ürünleri listeler
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.sp_stok_durumu', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_stok_durumu;
GO

CREATE PROCEDURE dbo.sp_stok_durumu
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        UrunID,
        UrunAdi,
        HedefStokDuzeyi,
        EnAzYenidenSatisMikatari,
        Sonlandi
    FROM dbo.Urunler
    WHERE HedefStokDuzeyi <= EnAzYenidenSatisMikatari
       OR Sonlandi = 1;
END;
GO
