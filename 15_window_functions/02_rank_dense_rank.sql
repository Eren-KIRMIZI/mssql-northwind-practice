/*
Konu        : RANK() vs DENSE_RANK()
Amaç        : Sıralamada farkları görmek
*/

USE Northwind;
GO

SELECT
    UrunID,
    UrunAdi,
    BirimFiyati,
    RANK() OVER (ORDER BY BirimFiyati DESC) AS RankNo,
    DENSE_RANK() OVER (ORDER BY BirimFiyati DESC) AS DenseRankNo
FROM dbo.Urunler;
GO
