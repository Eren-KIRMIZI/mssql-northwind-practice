/*
Trigger     : trg_stok_kontrol
Tablo       : dbo.Satis Detaylari
Açıklama    : Satış yapıldığında ürün stok miktarını azaltır
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.trg_stok_kontrol', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_stok_kontrol;
GO

CREATE TRIGGER dbo.trg_stok_kontrol
ON dbo.[Satis Detaylari]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE u
    SET u.EnAzYenidenSatisMikatari = 
        u.EnAzYenidenSatisMikatari - i.Miktar
    FROM dbo.Urunler u
    JOIN inserted i
        ON u.UrunID = i.UrunID;
END;
GO

/*

SELECT
    UrunID,
    UrunAdi,
    EnAzYenidenSatisMiktari
FROM dbo.Urunler
WHERE UrunID = 1;

-- 10

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
    11078,   -- Var olan bir SatisID
    1,       -- UrunID
    3,       -- Satılan miktar
    50,
    0
);

SELECT
    UrunID,
    UrunAdi,
    EnAzYenidenSatisMikatari
FROM dbo.Urunler
WHERE UrunID = 1;

-- 7

*/
