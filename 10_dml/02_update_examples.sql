/*
Dosya       : 02_update_examples.sql
Konu        : DML - UPDATE
Veritabanı  : Northwind (TR)
Amaç        : Tekli, çoklu, koşullu ve JOIN ile UPDATE işlemleri
*/

USE Northwind;
GO

/* ==================================================
1. TEK KAYIT GÜNCELLEME
================================================== */
UPDATE dbo.Musteriler
SET
    Sehir = 'Ankara',
    Telefon = '0312 111 11 11'
WHERE MusteriID = 'TEST1';
GO


/* ==================================================
2. BİRDEN FAZLA KOLON GÜNCELLEME
================================================== */
UPDATE dbo.Urunler
SET
    BirimFiyati = BirimFiyati + 25,
    EnAzYenidenSatisMikatari = 15
WHERE UrunAdi = 'Test Urunu';
GO


/* ==================================================
3. ŞARTA BAĞLI GÜNCELLEME
(Stok seviyesi düşük ürünler)
================================================== */
UPDATE dbo.Urunler
SET
    Sonlandi = 1
WHERE EnAzYenidenSatisMikatari < 5;
GO


/* ==================================================
4. TOPLU GÜNCELLEME
(Belirli kategoride fiyat artırma)
================================================== */
UPDATE dbo.Urunler
SET
    BirimFiyati = BirimFiyati * 1.10
WHERE KategoriID = 1;
GO


/* ==================================================
5. JOIN KULLANARAK UPDATE
(Müşterisi TEST1 olan satışların sevk şehrini güncelle)
================================================== */
UPDATE s
SET
    s.SevkSehri = 'Izmir'
FROM dbo.Satislar s
INNER JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
WHERE m.MusteriID = 'TEST1';
GO


/* ==================================================
6. SATIŞ DETAYINDA İNDİRİM GÜNCELLEME
================================================== */
UPDATE sd
SET
    sd.İndirim = 0.10
FROM dbo.[Satis Detaylari] sd
WHERE sd.Miktar >= 5;
GO


/* ==================================================
7. GÜNCELLEME SONRASI KONTROL (SELECT)
================================================== */
SELECT
    UrunID,
    UrunAdi,
    BirimFiyati,
    EnAzYenidenSatisMikatari,
    Sonlandi
FROM dbo.Urunler;
GO
