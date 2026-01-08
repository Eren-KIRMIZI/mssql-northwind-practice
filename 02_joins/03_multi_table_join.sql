/*
Konu        : MULTI TABLE JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Birden fazla tabloyu ilişkilendirerek satış raporları üretme
Amaç        : Gerçek hayatta kullanılan kompleks JOIN sorgularını doğru kurmak
*/

/* ==================================================
1. Satış + Müşteri + Personel
================================================== */
SELECT
    s.SatisID,
    s.SatisTarihi,
    m.MusteriAdi,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi
FROM dbo.Satislar s
JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
JOIN dbo.Personeller p
    ON s.PersonelID = p.PersonelID;


/* ==================================================
2. Satış + Satış Detayı + Ürün
================================================== */
SELECT
    s.SatisID,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyati,
    (sd.Miktar * sd.BirimFiyati) AS ToplamTutar
FROM dbo.Satislar s
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID;


/* ==================================================
3. TAM SATIŞ RAPORU
(Satış + Müşteri + Personel + Ürün + Satış Detayı)
================================================== */
SELECT
    s.SatisID,
    s.SatisTarihi,
    m.MusteriAdi,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyati,
    sd.İndirim,
    (sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS NetTutar
FROM dbo.Satislar s
JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
JOIN dbo.Personeller p
    ON s.PersonelID = p.PersonelID
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID;


/* ==================================================
4. Personel bazlı satış performansı
================================================== */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS ToplamCiro
FROM dbo.Personeller p
JOIN dbo.Satislar s
    ON p.PersonelID = s.PersonelID
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    p.PersonelID,
    p.Adi,
    p.Soyadi;


/* ==================================================
5. Müşteri bazlı toplam satış
================================================== */
SELECT
    m.MusteriID,
    m.MusteriAdi,
    SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.İndirim)) AS MusteriCirosu
FROM dbo.Musteriler m
JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    m.MusteriID,
    m.MusteriAdi;


/* ==================================================
6. En çok satan ürünler
================================================== */
SELECT
    u.UrunID,
    u.UrunAdi,
    SUM(sd.Miktar) AS ToplamSatisAdedi
FROM dbo.Urunler u
JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID
GROUP BY
    u.UrunID,
    u.UrunAdi
ORDER BY
    ToplamSatisAdedi DESC;
