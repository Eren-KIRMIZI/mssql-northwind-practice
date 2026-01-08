/*
Konu        : SELECT - String (Metin) Fonksiyonları
Veritabanı  : Northwind (TR)
Açıklama    : Metin büyük/küçük harf, uzunluk, parçalama, temizleme
Amaç        : String veri üzerinde profesyonel işlem yapmak
*/

/* --------------------------------------------------
1. UPPER - Metni büyük harfe çevirme
-------------------------------------------------- */
SELECT 
    UPPER(MusteriAdi) AS MusteriBuyuk
FROM dbo.Musteriler;


/* --------------------------------------------------
2. LOWER - Metni küçük harfe çevirme
-------------------------------------------------- */
SELECT 
    LOWER(MusteriAdi) AS MusteriKucuk
FROM dbo.Musteriler;


/* --------------------------------------------------
3. LEN - Metin uzunluğu
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    LEN(MusteriAdi) AS KarakterSayisi
FROM dbo.Musteriler;


/* --------------------------------------------------
4. LEFT - Soldan karakter alma
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    LEFT(MusteriAdi, 5) AS Ilk5Karakter
FROM dbo.Musteriler;


/* --------------------------------------------------
5. RIGHT - Sağdan karakter alma
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    RIGHT(MusteriAdi, 4) AS Son4Karakter
FROM dbo.Musteriler;


/* --------------------------------------------------
6. SUBSTRING - Belirli aralık alma
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    SUBSTRING(MusteriAdi, 2, 5) AS Parca
FROM dbo.Musteriler;


/* --------------------------------------------------
7. LTRIM / RTRIM - Boşluk temizleme
-------------------------------------------------- */
SELECT 
    LTRIM(RTRIM(MusteriAdi)) AS TemizMusteriAdi
FROM dbo.Musteriler;


/* --------------------------------------------------
8. TRIM (SQL Server 2017+)
-------------------------------------------------- */
SELECT 
    TRIM(MusteriAdi) AS TemizMusteriAdi
FROM dbo.Musteriler;


/* --------------------------------------------------
9. REPLACE - Metin değiştirme
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    REPLACE(MusteriAdi, 'Ltd.', 'Limited') AS GuncelAd
FROM dbo.Musteriler;


/* --------------------------------------------------
10. CHARINDEX - Metin içinde arama
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    CHARINDEX(' ', MusteriAdi) AS BoslukPozisyonu
FROM dbo.Musteriler;


/* --------------------------------------------------
11. CONCAT - Güvenli birleştirme
-------------------------------------------------- */
SELECT 
    CONCAT(MusteriAdi, ' - ', Sehir, ' / ', Ulke) AS MusteriBilgi
FROM dbo.Musteriler;


/* --------------------------------------------------
12. Gerçek hayat senaryosu
Müşteri adının ilk kelimesini alma
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    LEFT(MusteriAdi, CHARINDEX(' ', MusteriAdi + ' ') - 1) AS IlkKelime
FROM dbo.Musteriler;


/* --------------------------------------------------
13. LIKE ile birlikte string fonksiyonları
-------------------------------------------------- */
SELECT 
    MusteriAdi
FROM dbo.Musteriler
WHERE UPPER(MusteriAdi) LIKE '%MARKET%';
