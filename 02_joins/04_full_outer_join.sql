/*
Konu        : FULL OUTER JOIN
Veritabanı  : Northwind (TR)
Açıklama    : Hem sol hem sağ tablodaki eşleşmeyen kayıtları getirir
Amaç        : Eksik verileri, kopuk ilişkileri ve veri tutarsızlıklarını tespit etmek
Not         : LEFT + RIGHT JOIN birleşimi gibi düşünülebilir
*/

/* --------------------------------------------------
1. Tüm müşteriler ve tüm satışlar
(Eşleşmeyenler dahil)
-------------------------------------------------- */
SELECT
    m.MusteriID,
    m.MusteriAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Musteriler m
FULL OUTER JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID;


/* --------------------------------------------------
2. Satışı olmayan müşteriler + müşterisi olmayan satışlar
-------------------------------------------------- */
SELECT
    m.MusteriID,
    m.MusteriAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Musteriler m
FULL OUTER JOIN dbo.Satislar s
    ON m.MusteriID = s.MusteriID
WHERE m.MusteriID IS NULL
   OR s.SatisID IS NULL;


/* --------------------------------------------------
3. Tüm ürünler + tüm satış detayları
-------------------------------------------------- */
SELECT
    u.UrunID,
    u.UrunAdi,
    sd.SatisID,
    sd.Miktar,
    sd.BirimFiyati
FROM dbo.Urunler u
FULL OUTER JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID;


/* --------------------------------------------------
4. Hiç satılmamış ürünler + ürünü silinmiş satış detayları
-------------------------------------------------- */
SELECT
    u.UrunID,
    u.UrunAdi,
    sd.SatisID
FROM dbo.Urunler u
FULL OUTER JOIN dbo.[Satis Detaylari] sd
    ON u.UrunID = sd.UrunID
WHERE u.UrunID IS NULL
   OR sd.UrunID IS NULL;


/* --------------------------------------------------
5. Personel ve satışlar (iki taraflı kontrol)
-------------------------------------------------- */
SELECT
    p.PersonelID,
    p.Adi + ' ' + p.Soyadi AS PersonelAdi,
    s.SatisID,
    s.SatisTarihi
FROM dbo.Personeller p
FULL OUTER JOIN dbo.Satislar s
    ON p.PersonelID = s.PersonelID;


/* --------------------------------------------------
6. FULL OUTER JOIN = LEFT JOIN + RIGHT JOIN
(Kavramsal örnek)
-------------------------------------------------- */
-- Bu sorgu tek başına çalıştırılmaz, kavram içindir.
-- FULL OUTER JOIN → her iki tarafın da NULL kalmasına izin verir
