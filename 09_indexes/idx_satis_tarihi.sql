/*
Index       : idx_satis_tarihi
Tablo       : dbo.Satislar
Kolon       : SatisTarihi
Amaç        : Tarihe göre filtrelenen sorguları hızlandırmak
*/

USE Northwind;
GO

IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_satis_tarihi'
      AND object_id = OBJECT_ID('dbo.Satislar')
)
DROP INDEX idx_satis_tarihi ON dbo.Satislar;
GO

CREATE NONCLUSTERED INDEX idx_satis_tarihi
ON dbo.Satislar (SatisTarihi);
GO

/*

SELECT *
FROM dbo.Satislar
WHERE SatisTarihi >= '1997-01-01';

*/
