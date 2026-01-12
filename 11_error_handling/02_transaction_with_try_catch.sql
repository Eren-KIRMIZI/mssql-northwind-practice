/*
Konu        : TRANSACTION + TRY / CATCH
Amaç        : Hata olursa tüm işlemleri geri almak
*/

USE Northwind;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Geçerli işlem
    UPDATE dbo.Urunler
    SET HedefStokDuzeyi = HedefStokDuzeyi - 2
    WHERE UrunID = 1;

    -- Bilerek hata
    DECLARE @y INT = 1 / 0;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    ROLLBACK TRANSACTION;

    PRINT 'Hata oluştu, transaction geri alındı';

    SELECT
        ERROR_NUMBER()  AS HataNo,
        ERROR_MESSAGE() AS HataMesaji;

END CATCH;
GO
