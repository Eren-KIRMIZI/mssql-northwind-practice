/*
Index       : idx_urun_adi
Tablo       : dbo.Urunler
Kolon       : UrunAdi
Amaç        : Ürün adına göre aramaları hızlandırmak
*/

USE Northwind;
GO

IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_urun_adi'
      AND object_id = OBJECT_ID('dbo.Urunler')
)
DROP INDEX idx_urun_adi ON dbo.Urunler;
GO

CREATE NONCLUSTERED INDEX idx_urun_adi
ON dbo.Urunler (UrunAdi);
GO

/*

SELECT *
FROM dbo.Urunler
WHERE UrunAdi LIKE '%Chai%';

*/
