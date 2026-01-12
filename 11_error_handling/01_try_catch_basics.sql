/*
Konu        : ERROR HANDLING - TRY / CATCH
Veritabanı  : Northwind (TR)
Amaç        : SQL Server'da hata yakalama temelleri
*/

USE Northwind;
GO

BEGIN TRY

    -- Bilerek hata
    DECLARE @x INT = 1 / 0;

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER()   AS HataNumarasi,
        ERROR_MESSAGE()  AS HataMesaji,
        ERROR_SEVERITY() AS Seviye,
        ERROR_STATE()    AS Durum,
        ERROR_LINE()     AS Satir;

END CATCH;
GO
