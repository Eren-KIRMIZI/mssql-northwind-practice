/*
Index       : idx_satisdetay_urun_satis
Tablo       : dbo.Satis Detaylari
Kolonlar    : UrunID, SatisID
Amaç        : Ürün bazlı satış sorgularını hızlandırmak
*/

USE Northwind;
GO

IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_satisdetay_urun_satis'
      AND object_id = OBJECT_ID('dbo.[Satis Detaylari]')
)
DROP INDEX idx_satisdetay_urun_satis ON dbo.[Satis Detaylari];
GO

CREATE NONCLUSTERED INDEX idx_satisdetay_urun_satis
ON dbo.[Satis Detaylari] (UrunID, SatisID);
GO

/*

SELECT
    UrunID,
    SUM(Miktar) AS ToplamSatis
FROM dbo.[Satis Detaylari]
GROUP BY UrunID;

/*
