/*
Konu        : INDEX vs NO INDEX
Amaç        : Index'in performansa etkisini görmek
*/

USE Northwind;
GO

-- Index varsa sil
IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_urun_birimfiyati'
)
DROP INDEX idx_urun_birimfiyati ON dbo.Urunler;
GO

-- INDEX YOKKEN
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;
GO

-- INDEX OLUŞTUR
CREATE NONCLUSTERED INDEX idx_urun_birimfiyati
ON dbo.Urunler (BirimFiyati);
GO

-- INDEX VARKEN
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
