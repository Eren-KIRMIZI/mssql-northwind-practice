-- LoG Tablosu

CREATE TABLE dbo.SilmeLoglari
(
    LogID int IDENTITY PRIMARY KEY,
    TabloAdi varchar(50),
    SilinenID int,
    SilmeTarihi datetime DEFAULT GETDATE()
);
GO


-- Trigger

/*
Trigger     : trg_delete_log
Tablo       : dbo.Urunler
Açıklama    : Silinen ürünleri loglar
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.trg_delete_log', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_delete_log;
GO

CREATE TRIGGER dbo.trg_delete_log
ON dbo.Urunler
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.SilmeLoglari (TabloAdi, SilinenID)
    SELECT
        'Urunler',
        d.UrunID
    FROM deleted d;
END;
GO
