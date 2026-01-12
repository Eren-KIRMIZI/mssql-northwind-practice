/*
Dosya       : 03_delete_examples.sql
Konu        : DML - DELETE
Veritabanı  : Northwind (TR)
Amaç        : Tekli, koşullu ve ilişkili DELETE işlemleri
Uyarı       : FOREIGN KEY kısıtları dikkate alınmıştır
*/

USE Northwind;
GO


/* ==================================================
1. TEK KAYIT SİLME
(TEST amaçlı müşteri)
================================================== */
DELETE FROM dbo.Musteriler
WHERE MusteriID = 'TEST_SIL';
GO


/* ==================================================
2. KOŞULLU DELETE
(Hiç satışı olmayan müşteriler)
================================================== */
DELETE m
FROM dbo.Musteriler m
LEFT JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
WHERE s.SatisID IS NULL
  AND m.MusteriID LIKE 'TEST%';
GO


/* ==================================================
3. SATIŞ DETAYI SİLME
(Belirli satışa ait detaylar)
================================================== */
DELETE FROM dbo.[Satis Detaylari]
WHERE SatisID = 12079;
GO


/* ==================================================
4. SATIŞ SİLME
(ÖNCE detay, SONRA satış)
================================================== */
DELETE FROM dbo.[Satis Detaylari]
WHERE SatisID = 12079;

DELETE FROM dbo.Satislar
WHERE SatisID = 12079;
GO


/* ==================================================
5. KATEGORİ SİLME (KULLANILMIYORSA)
================================================== */
DELETE k
FROM dbo.Kategoriler k
LEFT JOIN dbo.Urunler u
    ON k.KategoriID = u.KategoriID
WHERE u.UrunID IS NULL
  AND k.KategoriAdi LIKE 'Test%';
GO


/* ==================================================
6. DELETE ÖNCESİ KONTROL (ÖNERİLEN)
================================================== */
-- DELETE çalıştırmadan önce MUTLAKA:
-- SELECT * FROM dbo.[Satis Detaylari] WHERE SatisID = 12079;
-- SELECT * FROM dbo.Satislar WHERE SatisID = 12079;
GO
