/*
Konu        : SELECT - WHERE Koşulları
Veritabanı  : Northwind (TR)
Açıklama    : WHERE ile veri filtreleme teknikleri
Amaç        : Karşılaştırma, mantıksal operatörler, doğru filtreleme
*/

/* --------------------------------------------------
1. Basit eşitlik (=) filtresi
-------------------------------------------------- */
SELECT 
    MusteriID,
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Germany';


/* --------------------------------------------------
2. Eşit değildir (<>)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke <> 'USA';


/* --------------------------------------------------
3. Sayısal karşılaştırmalar
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati > 50;


/* --------------------------------------------------
4. Büyük-eşit / Küçük-eşit
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    Stok
FROM dbo.Urunler
WHERE BirimFiyati >= 20
AND Stok <= 10;


/* --------------------------------------------------
5. AND kullanımı
(Tüm koşullar sağlanmalı)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Sehir,
    Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Germany'
AND Sehir = 'Berlin';


/* --------------------------------------------------
6. OR kullanımı
(En az bir koşul sağlanmalı)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Germany'
OR Ulke = 'France';


/* --------------------------------------------------
7. AND + OR birlikte kullanım (PARANTEZ ÇOK ÖNEMLİ)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Sehir,
    Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Germany'
AND (Sehir = 'Berlin' OR Sehir = 'Munich');


/* --------------------------------------------------
8. NOT kullanımı
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE NOT BirimFiyati > 100;


/* --------------------------------------------------
9. NULL kontrolü (DOĞRU KULLANIM)
-------------------------------------------------- */
SELECT 
    SatisID,
    TeslimTarihi
FROM dbo.Satislar
WHERE TeslimTarihi IS NULL;


/* --------------------------------------------------
10. NULL olmayan kayıtlar
-------------------------------------------------- */
SELECT 
    SatisID,
    TeslimTarihi
FROM dbo.Satislar
WHERE TeslimTarihi IS NOT NULL;


/* --------------------------------------------------
11. Tarih filtresi
-------------------------------------------------- */
SELECT 
    SatisID,
    MusteriID,
    SatisTarihi
FROM dbo.Satislar
WHERE SatisTarihi >= '1997-01-01';


/* --------------------------------------------------
12. String karşılaştırma (case insensitive - MSSQL)
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE MusteriAdi = 'alfreds futterkiste';


/* --------------------------------------------------
13. Çoklu filtreleme - gerçek hayattan örnek
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    Stok
FROM dbo.Urunler
WHERE BirimFiyati BETWEEN 20 AND 60
AND Stok > 0;
