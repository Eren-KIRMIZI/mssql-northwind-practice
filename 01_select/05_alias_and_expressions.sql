/*
Konu        : SELECT - Alias ve Expressions
Veritabanı  : Northwind (TR)
Açıklama    : Kolon ve tablo alias kullanımı, hesaplanmış alanlar
Amaç        : Okunabilir, raporlanabilir ve profesyonel SELECT yazmak
*/

/* --------------------------------------------------
1. Kolon alias (AS kullanımı)
-------------------------------------------------- */
SELECT 
    MusteriAdi AS Musteri,
    Sehir AS SehirAdi,
    Ulke AS UlkeAdi
FROM dbo.Musteriler;


/* --------------------------------------------------
2. AS yazmadan alias kullanımı
-------------------------------------------------- */
SELECT 
    MusteriAdi Musteri,
    Sehir SehirAdi
FROM dbo.Musteriler;


/* --------------------------------------------------
3. Tablo alias (JOIN öncesi temel)
-------------------------------------------------- */
SELECT 
    m.MusteriAdi,
    m.Ulke
FROM dbo.Musteriler m;


/* --------------------------------------------------
4. Matematiksel expression
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    BirimFiyati * 1.18 AS KdvliFiyat
FROM dbo.Urunler;


/* --------------------------------------------------
5. Birden fazla expression
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    Stok,
    BirimFiyati * Stok AS StokDegeri
FROM dbo.Urunler;


/* --------------------------------------------------
6. Expression + ROUND
-------------------------------------------------- */
SELECT 
    UrunAdi,
    ROUND(BirimFiyati * 1.18, 2) AS KdvliFiyat
FROM dbo.Urunler;


/* --------------------------------------------------
7. String birleştirme (CONCAT)
-------------------------------------------------- */
SELECT 
    CONCAT(MusteriAdi, ' - ', Sehir) AS MusteriBilgisi
FROM dbo.Musteriler;


/* --------------------------------------------------
8. NULL olabilecek alanlarda ISNULL
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    ISNULL(Bolge, 'Bölge Bilgisi Yok') AS Bolge
FROM dbo.Musteriler;


/* --------------------------------------------------
9. COALESCE kullanımı (ilk dolu değeri alır)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    COALESCE(Bolge, Sehir, Ulke) AS Lokasyon
FROM dbo.Musteriler;


/* --------------------------------------------------
10. Alias ile ORDER BY
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati * 1.18 AS KdvliFiyat
FROM dbo.Urunler
ORDER BY KdvliFiyat DESC;


/* --------------------------------------------------
11. Gerçek hayat senaryosu
Stok değeri en yüksek ürünler
-------------------------------------------------- */
SELECT TOP 10
    UrunAdi,
    BirimFiyati,
    Stok,
    BirimFiyati * Stok AS ToplamDeger
FROM dbo.Urunler
ORDER BY ToplamDeger DESC;


/* --------------------------------------------------
12. Alias kullanırken dikkat edilmesi gerekenler
-------------------------------------------------- */
-- WHERE içinde alias kullanılamaz
-- Aşağıdaki sorgu HATALIDIR
-- SELECT UrunAdi, BirimFiyati * 1.18 AS KdvliFiyat
-- FROM dbo.Urunler
-- WHERE KdvliFiyat > 50;
