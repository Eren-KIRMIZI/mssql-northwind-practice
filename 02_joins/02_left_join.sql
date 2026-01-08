/*
Konu        : LEFT JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Eşleşmese bile sol tablodaki kayıtları getirme
Amaç        : Eksik ilişkileri ve NULL durumlarını analiz edebilmek
*/

/* --------------------------------------------------
1. Tüm satışlar + varsa müşteri bilgisi
(Satış var ama müşteri silinmiş olabilir)
-------------------------------------------------- */
SELECT 
    s.SatisID,
    s.SatisTarihi,
    m.MusteriAdi
FROM dbo.Satislar s
LEFT JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID;


/* --------------------------------------------------
2. Satışı olmayan müşteriler
(EN ÇOK SORULAN SENARYO)
-------------------------------------------------- */
SELECT 
    m.MusteriID,
    m.MusteriAdi
FROM dbo.Musteriler m
LEFT JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
WHERE s.SatisID IS NULL;


/* --------------------------------------------------
3. Tüm ürünler + varsa satış detayları
(Satılmamış ürünler de gelir)
-------------------------------------------------- */
SELECT 
    u.UrunID,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyati
FROM dbo.Urunler u
LEFT JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID;


/* --------------------------------------------------
4. Hiç satılmamış ürünler
(LEFT JOIN + IS NULL paterni)
-------------------------------------------------- */
SELECT 
    u.UrunID,
    u.UrunAdi
FROM dbo.Urunler u
LEFT JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID
WHERE sd.UrunID IS NULL;


/* --------------------------------------------------
5. Tüm müşteriler + satış bilgisi (varsa)
(Müşteri bazlı genel görünüm)
-------------------------------------------------- */
SELECT
    m.MusteriID,
    m.MusteriAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Musteriler m
LEFT JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID;


/* --------------------------------------------------
6. Personel + yaptığı satışlar (yapmamış olsa bile)
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Personeller p
LEFT JOIN dbo.Satislar s
    ON p.PersonelID = s.PersonelID;
