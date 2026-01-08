/*
Konu        : SELF JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Bir tablonun kendi kendisiyle JOIN edilmesi
Amaç        : Hiyerarşik ilişkileri çözümleyebilmek
*/

/* --------------------------------------------------
1. Personel – Yönetici ilişkisi
(HER YERDE ÇIKAR)
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    y.Adi + ' ' + y.Soyadi AS YoneticiAdi
FROM dbo.Personeller p
LEFT JOIN dbo.Personeller y
    ON p.YoneticiID = y.PersonelID;


/* --------------------------------------------------
2. Yöneticisi olmayan personeller
(En üst seviye yöneticiler)
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi
FROM dbo.Personeller p
LEFT JOIN dbo.Personeller y
    ON p.YoneticiID = y.PersonelID
WHERE p.YoneticiID IS NULL;


/* --------------------------------------------------
3. Yönetici bazlı personel sayısı
-------------------------------------------------- */
SELECT
    y.PersonelID AS YoneticiID,
    y.Adi + ' ' + y.Soyadi AS YoneticiAdi,
    COUNT(p.PersonelID) AS BagliPersonelSayisi
FROM dbo.Personeller p
JOIN dbo.Personeller y
    ON p.YoneticiID = y.PersonelID
GROUP BY
    y.PersonelID,
    y.Adi,
    y.Soyadi;


/* --------------------------------------------------
4. Personel hiyerarşisi (detaylı görünüm)
-------------------------------------------------- */
SELECT
    y.Adi + ' ' + y.Soyadi AS Yonetici,
    p.Adi + ' ' + p.Soyadi AS Personel
FROM dbo.Personeller p
JOIN dbo.Personeller y
    ON p.YoneticiID = y.PersonelID
ORDER BY
    Yonetici;


/* --------------------------------------------------
5. SELF JOIN neden alias zorunlu?
-------------------------------------------------- */
-- Aynı tablo iki farklı rol oynar:
-- p → çalışan
-- y → yönetici
-- Alias olmadan SQL hangisinin hangisi olduğunu bilemez
