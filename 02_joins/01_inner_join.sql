/*
Konu        : INNER JOIN
Veritabanı  : Northwind (TR)
Açıklama    : İlişkili tablolardan eşleşen kayıtları getirme
Amaç        : Gerçek hayatta en çok kullanılan JOIN türünü öğrenmek
*/

/* --------------------------------------------------
1. Satış + Müşteri bilgileri
-------------------------------------------------- */
SELECT 
    s.SatisID,
    m.MusteriAdi,
    s.SatisTarihi
FROM dbo.Satislar s
INNER JOIN dbo.Musteriler m
    ON s.MusteriID = m.MusteriID;


/* --------------------------------------------------
2. Satış + Personel bilgileri
-------------------------------------------------- */
SELECT 
    s.SatisID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    s.SatisTarihi
FROM dbo.Satislar s
INNER JOIN dbo.Personeller p
    ON s.PersonelID = p.PersonelID;


/* --------------------------------------------------
3. Satış Detayı + Ürün
-------------------------------------------------- */
SELECT 
    sd.SatisID,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyat
FROM dbo.SatisDetaylari sd
INNER JOIN dbo.Urunler u
    ON sd.UrunID = u.UrunID;


/* --------------------------------------------------
4. Ürün + Kategori
-------------------------------------------------- */
SELECT 
    u.UrunAdi,
    k.KategoriAdi
FROM dbo.Urunler u
INNER JOIN dbo.Kategoriler k
    ON u.KategoriID = k.KategoriID;


/* --------------------------------------------------
5. Ürün + Tedarikçi
-------------------------------------------------- */
SELECT 
    u.UrunAdi,
    t.TedarikciAdi
FROM dbo.Urunler u
INNER JOIN dbo.Tedarikciler t
    ON u.TedarikciID = t.TedarikciID;


/* --------------------------------------------------
6. Çoklu INNER JOIN (Satış raporu)
-------------------------------------------------- */
SELECT 
    s.SatisID,
    m.MusteriAdi,
    p.Adi + ' ' + p.Soyadi AS Personel,
    u.UrunAdi,
    sd.Miktar,
    sd.BirimFiyat,
    (sd.Miktar * sd.BirimFiyat) AS ToplamTutar
FROM dbo.Satislar s
INNER JOIN dbo.Musteriler m ON s.MusteriID = m.MusteriID
INNER JOIN dbo.Personeller p ON s.PersonelID = p.PersonelID
INNER JOIN dbo.SatisDetaylari sd ON s.SatisID = sd.SatisID
INNER JOIN dbo.Urunler u ON sd.UrunID = u.UrunID;
