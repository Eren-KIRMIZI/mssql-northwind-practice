/*
Konu        : ROLLBACK Senaryoları
Veritabanı  : Northwind (TR)
Amaç        : Hata oluştuğunda yapılan tüm işlemlerin geri alınması
*/

USE Northwind;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Geçerli güncelleme
    UPDATE dbo.Urunler
    SET HedefStokDuzeyi = HedefStokDuzeyi - 5
    WHERE UrunID = 1;

    -- BİLEREK HATA (olmayan tablo)
    INSERT INTO dbo.HayaliTablo (Test)
    VALUES (1);

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;

    PRINT 'Hata yakalandı! Transaction geri alındı.';
    PRINT ERROR_MESSAGE();
END CATCH;
GO
