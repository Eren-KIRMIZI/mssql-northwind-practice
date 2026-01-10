/*
Konu        : GROUP BY + JOIN
Veritabanı  : Northwind (TR)
Amaç        : Gerçek hayatta kullanılan rapor sorguları yazmak
*/

/* --------------------------------------------------
1. Kategori bazlı ürün sayısı (JOIN ile)
-------------------------------------------------- */
SELECT
    k.KategoriAdi,
    COUNT(u.UrunID) AS UrunSayisi
FROM dbo.Kategoriler k
LEFT JOIN dbo.Urunler u
    ON k.KategoriID = u.KategoriID
GROUP BY
    k.KategoriAdi;


/* --------------------------------------------------
2. Müşteri bazlı toplam satış adedi
-------------------------------------------------- */
SELECT
    m.MusteriAdi,
    SUM(sd.Miktar) AS ToplamSatisAdedi
FROM dbo.Musteriler m
JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    m.MusteriAdi;


/* --------------------------------------------------
3. Personel bazlı toplam ciro
-------------------------------------------------- */
SELECT
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    SUM(sd.Miktar * sd.BirimFiyati * (1 - sd.Indirim)) AS ToplamCiro
FROM dbo.Personeller p
JOIN dbo.Satislar s
    ON p.PersonelID = s.PersonelID
JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY
    p.Adi,
    p.Soyadi;


/* --------------------------------------------------
4. En çok satan ürünler
-------------------------------------------------- */
SELECT
    u.UrunAdi,
    SUM(sd.Miktar) AS ToplamSatisAdedi
FROM dbo.Urunler u
JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID
GROUP BY
    u.UrunAdi
ORDER BY
    ToplamSatisAdedi DESC;
