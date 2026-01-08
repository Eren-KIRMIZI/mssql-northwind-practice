/*
Konu        : SELECT - Date / Time (Tarih) Fonksiyonları
Veritabanı  : Northwind (TR)
Açıklama    : Tarih alma, parçalama, karşılaştırma, fark hesaplama
Amaç        : Raporlama ve zaman bazlı sorgular yazabilmek
*/

/* --------------------------------------------------
1. GETDATE - Şu anki tarih & saat
-------------------------------------------------- */
SELECT GETDATE() AS SimdikiTarihSaat;


/* --------------------------------------------------
2. CAST / CONVERT - Tarih formatlama
-------------------------------------------------- */
SELECT 
    CAST(GETDATE() AS DATE) AS SadeceTarih,
    CAST(GETDATE() AS TIME) AS SadeceSaat;

SELECT 
    CONVERT(VARCHAR, GETDATE(), 104) AS Tarih_TR,   -- dd.mm.yyyy
    CONVERT(VARCHAR, GETDATE(), 120) AS Tarih_ISO; -- yyyy-mm-dd hh:mm:ss


/* --------------------------------------------------
3. YEAR / MONTH / DAY
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    YEAR(SiparisTarihi)  AS Yil,
    MONTH(SiparisTarihi) AS Ay,
    DAY(SiparisTarihi)   AS Gun
FROM dbo.Siparisler;


/* --------------------------------------------------
4. DATEPART - Detaylı tarih bilgisi
-------------------------------------------------- */
SELECT 
    SiparisID,
    DATEPART(YEAR, SiparisTarihi)  AS Yil,
    DATEPART(WEEK, SiparisTarihi)  AS HaftaNo,
    DATEPART(WEEKDAY, SiparisTarihi) AS HaftaninGunu
FROM dbo.Siparisler;


/* --------------------------------------------------
5. DATENAME - Metinsel tarih bilgisi
-------------------------------------------------- */
SELECT 
    SiparisID,
    DATENAME(MONTH, SiparisTarihi) AS AyAdi,
    DATENAME(WEEKDAY, SiparisTarihi) AS GunAdi
FROM dbo.Siparisler;


/* --------------------------------------------------
6. DATEDIFF - İki tarih arası fark
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    SevkTarihi,
    DATEDIFF(DAY, SiparisTarihi, SevkTarihi) AS KacGunSurdu
FROM dbo.Siparisler
WHERE SevkTarihi IS NOT NULL;


/* --------------------------------------------------
7. DATEADD - Tarihe ekleme / çıkarma
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    DATEADD(DAY, 7, SiparisTarihi)  AS BirHaftaSonra,
    DATEADD(MONTH, 1, SiparisTarihi) AS BirAySonra
FROM dbo.Siparisler;


/* --------------------------------------------------
8. Bugüne göre filtreleme
-------------------------------------------------- */
SELECT *
FROM dbo.Siparisler
WHERE SiparisTarihi >= CAST(GETDATE() AS DATE);


/* --------------------------------------------------
9. Belirli yıl / ay siparişleri
-------------------------------------------------- */
SELECT *
FROM dbo.Siparisler
WHERE YEAR(SiparisTarihi) = 1997
  AND MONTH(SiparisTarihi) = 7;


/* --------------------------------------------------
10. Son 30 gün içindeki siparişler
-------------------------------------------------- */
SELECT *
FROM dbo.Siparisler
WHERE SiparisTarihi >= DATEADD(DAY, -30, GETDATE());


/* --------------------------------------------------
11. NULL tarih kontrolü
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    ISNULL(SevkTarihi, GETDATE()) AS GercekSevkTarihi
FROM dbo.Siparisler;


/* --------------------------------------------------
12. Gerçek hayat senaryosu
Sipariş gecikti mi?
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    SevkTarihi,
    CASE 
        WHEN DATEDIFF(DAY, SiparisTarihi, SevkTarihi) > 7 THEN 'Gecikti'
        ELSE 'Zamanında'
    END AS Durum
FROM dbo.Siparisler
WHERE SevkTarihi IS NOT NULL;
