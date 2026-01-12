/*
Konu        : TEMP TABLE (#)
Amaç        : Geçici veri saklama ve performans
*/

USE Northwind;
GO

-- Temp table oluştur
CREATE TABLE #PahaliUrunler
(
    UrunID INT,
    UrunAdi NVARCHAR(40),
    BirimFiyati MONEY
);

-- Veri ekle
INSERT INTO #PahaliUrunler
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 100;

-- Kullan
SELECT * FROM #PahaliUrunler;

-- Güncelle
UPDATE #PahaliUrunler
SET BirimFiyati = BirimFiyati * 1.10;

SELECT * FROM #PahaliUrunler;

-- Sil
DROP TABLE #PahaliUrunler;
GO
