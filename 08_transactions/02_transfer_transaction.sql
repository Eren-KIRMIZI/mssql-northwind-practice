/*
Konu        : TRANSACTION - Transfer (Urunler)
Veritabanı  : Northwind (TR)
Amaç        : Birden fazla UPDATE işlemini atomik yapmak
*/

USE Northwind;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Ürün 1: hedef stok düşür
    UPDATE dbo.Urunler
    SET HedefStokDuzeyi = HedefStokDuzeyi - 10
    WHERE UrunID = 1;

    -- Ürün 2: hedef stok artır
    UPDATE dbo.Urunler
    SET HedefStokDuzeyi = HedefStokDuzeyi + 10
    WHERE UrunID = 2;

    COMMIT TRANSACTION;
    PRINT 'Transfer işlemi başarıyla tamamlandı';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluştu, işlemler geri alındı';
    PRINT ERROR_MESSAGE();
END CATCH;
GO


/*
SELECT
    UrunID,
    UrunAdi,
    HedefStokDuzeyi
FROM dbo.Urunler
WHERE UrunID IN (1, 2);

-- 29   27

SELECT
    UrunID,
    UrunAdi,
    HedefStokDuzeyi
FROM dbo.Urunler
WHERE UrunID IN (1, 2);

-- 19  37

*/
