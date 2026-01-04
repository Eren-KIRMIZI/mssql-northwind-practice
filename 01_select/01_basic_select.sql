/*
Konu        : SELECT - Temel Sorgular
Veritabanı  : Northwind (TR)
Açıklama    : MSSQL'de temel SELECT kullanımı
Amaç        : Tablo okuma, kolon seçimi, alias kullanımı
*/

/* --------------------------------------------------
1. Tüm kolonları getirme (GENEL KULLANIM - önerilmez)
-------------------------------------------------- */
SELECT *
FROM dbo.Musteriler;


/* --------------------------------------------------
2. Belirli kolonları getirme (ÖNERİLEN)
-------------------------------------------------- */
SELECT 
    MusteriID,
    MusteriAdi,
    Sehir,
    Ulke
FROM dbo.Musteriler;


/* --------------------------------------------------
3. Alias (Takma isim) kullanımı
-------------------------------------------------- */
SELECT 
    MusteriAdi AS Musteri,
    Sehir AS SehirAdi,
    Ulke AS UlkeAdi
FROM dbo.Musteriler;


/* --------------------------------------------------
4. Sayısal kolonlarla SELECT
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    HedefStokDuzeyi
FROM dbo.Urunler;


/* --------------------------------------------------
5. Hesaplanmış kolon (expression)
-------------------------------------------------- */
SELECT 
    UrunAdi,
    BirimFiyati,
    BirimFiyati * 1.18 AS KdvliFiyat
FROM dbo.Urunler;


/* --------------------------------------------------
6. Sabit değer döndürme
-------------------------------------------------- */
SELECT 
    MusteriAdi,
    'Aktif Musteri' AS Durum
FROM dbo.Musteriler;


/* --------------------------------------------------
7. Aynı anda birden fazla tabloya SELECT
(Not: JOIN yok, sadece örnek)
-------------------------------------------------- */
SELECT * FROM dbo.Musteriler;
SELECT * FROM dbo.Urunler;
SELECT * FROM dbo.Satislar;


/* --------------------------------------------------
8. SELECT ile tarih bilgisi
-------------------------------------------------- */
SELECT 
    SatisID,
    MusteriID,
    SatisTarihi
FROM dbo.Satislar;


/* --------------------------------------------------
9. GETDATE() kullanımı
-------------------------------------------------- */
SELECT 
    GETDATE() AS BugununTarihi;


/* --------------------------------------------------
10. DISTINCT olmadan tekrar eden veriler
-------------------------------------------------- */
SELECT Ulke
FROM dbo.Musteriler;
