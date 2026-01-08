/*
Konu        : SELECT - EXISTS / NOT EXISTS
Veritabanı  : Northwind (TR)
Açıklama    : Kayıt var mı yok mu kontrolü
Amaç        : Performanslı ve temiz sorgular yazmak
*/

/* --------------------------------------------------
1. EXISTS temel kullanım
Sipariş veren müşteriler
-------------------------------------------------- */
SELECT MusteriAdi
FROM dbo.Musteriler m
WHERE EXISTS (
    SELECT 1
    FROM dbo.Siparisler s
    WHERE s.MusteriID = m.MusteriID
);


/* --------------------------------------------------
2. NOT EXISTS
Hiç sipariş vermemiş müşteriler
-------------------------------------------------- */
SELECT MusteriAdi
FROM dbo.Musteriler m
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.Siparisler s
    WHERE s.MusteriID = m.MusteriID
);


/* --------------------------------------------------
3. EXISTS vs IN farkı
-------------------------------------------------- */
-- EXISTS (tercih edilir)
SELECT MusteriAdi
FROM dbo.Musteriler m
WHERE EXISTS (
    SELECT 1 FROM dbo.Siparisler s
    WHERE s.MusteriID = m.MusteriID
);

-- IN (büyük tablolarda yavaşlayabilir)
SELECT MusteriAdi
FROM dbo.Musteriler
WHERE MusteriID IN (
    SELECT MusteriID FROM dbo.Siparisler
);


/* --------------------------------------------------
4. EXISTS + JOIN senaryosu
-------------------------------------------------- */
SELECT m.MusteriAdi
FROM dbo.Musteriler m
WHERE EXISTS (
    SELECT 1
    FROM dbo.Siparisler s
    JOIN dbo.SiparisDetaylari sd ON s.SiparisID = sd.SiparisID
    WHERE s.MusteriID = m.MusteriID
      AND sd.Miktar > 50
);


/* --------------------------------------------------
5. NOT EXISTS + NULL güvenliği
-------------------------------------------------- */
SELECT u.UrunAdi
FROM dbo.Urunler u
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.SiparisDetaylari sd
    WHERE sd.UrunID = u.UrunID
);


/* --------------------------------------------------
6. Gerçek hayat senaryosu
Hiç satılmamış ürünler
-------------------------------------------------- */
SELECT UrunAdi
FROM dbo.Urunler u
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.SiparisDetaylari sd
    WHERE sd.UrunID = u.UrunID
);
