/*
Konu        : SELECT - ORDER BY / TOP / DISTINCT
Veritabanı  : Northwind (TR)
Açıklama    : Veri sıralama, limit koyma ve tekrar eden kayıtları ayıklama
Amaç        : Raporlama ve performanslı veri çekme
*/

/* --------------------------------------------------
1. ORDER BY - varsayılan (ASC)
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
ORDER BY BirimFiyati;


/* --------------------------------------------------
2. ORDER BY - DESC (büyükten küçüğe)
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
ORDER BY BirimFiyati DESC;


/* --------------------------------------------------
3. Birden fazla kolona göre sıralama
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke,
    Sehir
FROM dbo.Musteriler
ORDER BY Ulke ASC, Sehir ASC;


/* --------------------------------------------------
4. ORDER BY - alias kullanımı
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati * 1.18 AS KdvliFiyat
FROM dbo.Urunler
ORDER BY KdvliFiyat DESC;


/* --------------------------------------------------
5. TOP - ilk N kayıt
-------------------------------------------------- */
SELECT TOP 5
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
ORDER BY BirimFiyati DESC;


/* --------------------------------------------------
6. TOP WITH TIES - aynı değerleri de dahil et
-------------------------------------------------- */
SELECT TOP 5 WITH TIES
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
ORDER BY BirimFiyati DESC;


/* --------------------------------------------------
7. DISTINCT - tekrar eden kayıtları temizleme
-------------------------------------------------- */
SELECT DISTINCT
    Ulke
FROM dbo.Musteriler;


/* --------------------------------------------------
8. DISTINCT birden fazla kolonla
-------------------------------------------------- */
SELECT DISTINCT
    Ulke,
    Sehir
FROM dbo.Musteriler;


/* --------------------------------------------------
9. ORDER BY + DISTINCT birlikte kullanım
-------------------------------------------------- */
SELECT DISTINCT
    Ulke
FROM dbo.Musteriler
ORDER BY Ulke;


/* --------------------------------------------------
10. Gerçek hayat senaryosu
En pahalı 10 ürün
-------------------------------------------------- */
SELECT TOP 10
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
ORDER BY BirimFiyati DESC;


/* --------------------------------------------------
11. Gerçek hayat senaryosu
En son 5 satış
-------------------------------------------------- */
SELECT TOP 5
    SatisID,
    MusteriID,
    SatisTarihi
FROM dbo.Satislar
ORDER BY SatisTarihi DESC;


/* --------------------------------------------------
12. Sık yapılan hata (NOT)
ORDER BY olmadan TOP kullanımı
-------------------------------------------------- */
-- SELECT TOP 5 * FROM dbo.Urunler;
-- Bu sorgu deterministik değildir
