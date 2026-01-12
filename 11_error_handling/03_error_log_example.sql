/*
Konu        : ERROR LOG
Amaç        : Oluşan hataları tabloya kaydetmek
*/

USE Northwind;
GO

-- LOG Tablosu oluştur
IF OBJECT_ID('dbo.HataLoglari', 'U') IS NOT NULL
    DROP TABLE dbo.HataLoglari;
GO

CREATE TABLE dbo.HataLoglari
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    HataNumarasi INT,
    HataMesaji NVARCHAR(4000),
    HataTarihi DATETIME DEFAULT GETDATE()
);
GO

/* ==============================
   HATA YAKALA VE LOG'A YAZ
   ============================== */

BEGIN TRY

    -- 🔥 Bilerek runtime hata (TRY/CATCH yakalar)
    DECLARE @sayi INT;
    SET @sayi = 10 / 0;

END TRY
BEGIN CATCH

    INSERT INTO dbo.HataLoglari
    (
        HataNumarasi,
        HataMesaji
    )
    VALUES
    (
        ERROR_NUMBER(),
        ERROR_MESSAGE()
    );

    PRINT 'Hata yakalandı ve loglandı';

END CATCH;
GO

-- Logları kontrol et
SELECT * FROM dbo.HataLoglari;
GO
