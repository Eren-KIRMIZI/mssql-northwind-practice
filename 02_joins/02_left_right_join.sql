/*
Konu        : LEFT JOIN / RIGHT JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Eşleşmeyen kayıtları da getirme
Amaç        : Eksik ilişkileri analiz edebilmek
*/

/* --------------------------------------------------
1. LEFT JOIN - Tüm satışlar + varsa müşteri
-------------------------------------------------- */
SELECT 
    s.SatisID,
    m.MusteriAdi,
    s.SatisTarihi
FROM dbo.Satislar s
LEFT JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID;


/* --------------------------------------------------
2. LEFT JOIN - Satışı olmayan müşteriler
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
3. LEFT JOIN - Ürün + Satış Detayı
-------------------------------------------------- */
SELECT 
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyat
FROM dbo.Urunler u
LEFT JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID;


/* --------------------------------------------------
4. LEFT JOIN - Hiç satılmamış ürünler
-------------------------------------------------- */
SELECT 
    u.UrunID,
    u.UrunAdi
FROM dbo.Urunler u
LEFT JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID
WHERE sd.UrunID IS NULL;


/* --------------------------------------------------
5. RIGHT JOIN - Satış detayı + ürün
-------------------------------------------------- */
SELECT 
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyat
FROM dbo.[Satis Detaylari] sd
RIGHT JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID;


/* --------------------------------------------------
6. RIGHT JOIN yerine LEFT JOIN tercihi
(Aynı sonucu verir)
-------------------------------------------------- */
SELECT 
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyat
FROM dbo.Urunler u
LEFT JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID;
