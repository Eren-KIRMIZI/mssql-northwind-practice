/*
Konu        : RIGHT JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Sağ tablodaki tüm kayıtları getirme
Amaç        : RIGHT JOIN mantığını öğrenmek ve LEFT JOIN ile eşdeğerliğini görmek
Not         : Pratikte çoğu zaman LEFT JOIN tercih edilir
*/

/* --------------------------------------------------
1. RIGHT JOIN - Tüm müşteriler + varsa satışları
-------------------------------------------------- */
SELECT
    m.MusteriID,
    m.MusteriAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Satislar s
RIGHT JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID;


/* --------------------------------------------------
2. RIGHT JOIN - Satışı olmayan müşteriler
-------------------------------------------------- */
SELECT
    m.MusteriID,
    m.MusteriAdi
FROM dbo.Satislar s
RIGHT JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID
WHERE s.SatisID IS NULL;


/* --------------------------------------------------
3. RIGHT JOIN - Satış detayları + tüm ürünler
-------------------------------------------------- */
SELECT
    u.UrunID,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyati
FROM dbo.[Satis Detaylari] sd
RIGHT JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID;


/* --------------------------------------------------
4. RIGHT JOIN - Hiç satılmamış ürünler
-------------------------------------------------- */
SELECT
    u.UrunID,
    u.UrunAdi
FROM dbo.[Satis Detaylari] sd
RIGHT JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID
WHERE sd.UrunID IS NULL;


/* --------------------------------------------------
5. RIGHT JOIN - Personel + yaptığı satışlar
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Satislar s
RIGHT JOIN dbo.Personeller p
    ON s.PersonelID = p.PersonelID;


/* --------------------------------------------------
6. RIGHT JOIN yerine LEFT JOIN (AYNI SONUÇ)
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Personeller p
LEFT JOIN dbo.Satislar s
    ON p.PersonelID = s.PersonelID;
