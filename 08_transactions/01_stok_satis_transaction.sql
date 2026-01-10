/*
Konu        : TRANSACTION - Stok + Satış
Veritabanı  : Northwind (TR)
Amaç        : Satış ve stok işlemlerini tek atomik işlem olarak yapmak
*/

USE Northwind;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- 1. Satış ekle
    INSERT INTO dbo.Satislar
    (
        MusteriID,
        PersonelID,
        SatisTarihi
    )
    VALUES
    (
        'ALFKI',
        1,
        GETDATE()
    );

    DECLARE @YeniSatisID INT;
    SET @YeniSatisID = SCOPE_IDENTITY();

    -- 2. Satış detayı ekle
    INSERT INTO dbo.[Satis Detaylari]
    (
        SatisID,
        UrunID,
        Miktar,
        BirimFiyati,
        İndirim
    )
    VALUES
    (
        @YeniSatisID,
        1,
        5,
        50,
        0
    );

    COMMIT TRANSACTION;
    PRINT 'Satış ve stok işlemi başarıyla tamamlandı';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluştu! Tüm işlemler geri alındı';
END CATCH;
GO
