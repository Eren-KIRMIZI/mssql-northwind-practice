/*
Konu        : SELECT - LIKE / BETWEEN / IN
Veritabanı  : Northwind (TR)
Açıklama    : Metin arama, aralık sorguları ve çoklu değer filtreleme
Amaç        : Gerçek hayatta sık kullanılan filtreleme teknikleri
*/

/* --------------------------------------------------
1. LIKE - % ile başlayan kayıtlar
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE MusteriAdi LIKE 'A%';


/* --------------------------------------------------
2. LIKE - % ile biten kayıtlar
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE MusteriAdi LIKE '%Market';


/* --------------------------------------------------
3. LIKE - içinde geçen ifadeler
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE MusteriAdi LIKE '%food%';


/* --------------------------------------------------
4. LIKE - tek karakter (_) kullanımı
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE MusteriAdi LIKE '_a%';


/* --------------------------------------------------
5. LIKE - birden fazla koşul
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Sehir
FROM dbo.Musteriler
WHERE MusteriAdi LIKE 'B%'
OR MusteriAdi LIKE 'C%';


/* --------------------------------------------------
6. BETWEEN - sayısal aralık (DAHİL)
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati
FROM dbo.Urunler
WHERE BirimFiyati BETWEEN 20 AND 50;


/* --------------------------------------------------
7. BETWEEN - tarih aralığı
-------------------------------------------------- */
SELECT 
    SatisID,
    SatisTarihi
FROM dbo.Satislar
WHERE SatisTarihi BETWEEN '1997-01-01' AND '1997-12-31';


/* --------------------------------------------------
8. IN - çoklu değer filtreleme
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke IN ('Germany', 'France', 'UK');


/* --------------------------------------------------
9. NOT IN kullanımı
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke NOT IN ('USA', 'Canada');


/* --------------------------------------------------
10. IN yerine OR (ÖNERİLMEZ)
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Germany'
OR Ulke = 'France'
OR Ulke = 'UK';


/* --------------------------------------------------
11. LIKE + BETWEEN birlikte kullanım
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    Stok
FROM dbo.Urunler
WHERE UrunAdi LIKE '%Cheese%'
AND BirimFiyati BETWEEN 10 AND 40;


/* --------------------------------------------------
12. Gerçek hayat senaryosu
Stokta olan ve belirli ülkelerde satılan ürünler
-------------------------------------------------- */
SELECT DISTINCT
    u.UrunAdi,
    u.BirimFiyati
FROM dbo.Urunler u
JOIN dbo.Satis_Detaylari sd
    ON u.UrunID = sd.UrunID
JOIN dbo.Satislar s
    ON sd.SatisID = s.SatisID
JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
WHERE m.Ulke IN ('Germany', 'France')
AND u.Stok > 0;
