/*
Konu        : SELECT - SUBQUERY (Alt Sorgular)
Veritabanı  : Northwind (TR)
Açıklama    : SELECT içinde SELECT kullanımı
Amaç        : Karmaşık sorguları parçalayarak yazabilmek
*/

/* --------------------------------------------------
1. WHERE içinde subquery
Ortalama nakliye ücretinden yüksek olan siparişler
-------------------------------------------------- */
SELECT *
FROM dbo.Siparisler
WHERE NakliyeUcreti > (
    SELECT AVG(NakliyeUcreti)
    FROM dbo.Siparisler
);


/* --------------------------------------------------
2. IN ile subquery
Sipariş vermiş müşteriler
-------------------------------------------------- */
SELECT MusteriAdi
FROM dbo.Musteriler
WHERE MusteriID IN (
    SELECT MusteriID
    FROM dbo.Siparisler
);


/* --------------------------------------------------
3. SELECT içinde subquery (scalar)
-------------------------------------------------- */
SELECT 
    SiparisID,
    NakliyeUcreti,
    (SELECT AVG(NakliyeUcreti) FROM dbo.Siparisler) AS OrtalamaNakliye
FROM dbo.Siparisler;


/* --------------------------------------------------
4. FROM içinde subquery (derived table)
-------------------------------------------------- */
SELECT *
FROM (
    SELECT 
        MusteriID,
        COUNT(*) AS SiparisSayisi
    FROM dbo.Siparisler
    GROUP BY MusteriID
) AS SiparisOzet
WHERE SiparisSayisi > 5;


/* --------------------------------------------------
5. En pahalı ürünü satan sipariş
-------------------------------------------------- */
SELECT DISTINCT s.SiparisID
FROM dbo.Siparisler s
JOIN dbo.SiparisDetaylari sd ON s.SiparisID = sd.SiparisID
WHERE sd.BirimFiyat = (
    SELECT MAX(BirimFiyat)
    FROM dbo.SiparisDetaylari
);


/* --------------------------------------------------
6. Subquery + JOIN karşılaştırması
-------------------------------------------------- */
-- Subquery
SELECT MusteriAdi
FROM dbo.Musteriler
WHERE MusteriID IN (
    SELECT MusteriID FROM dbo.Siparisler
);

-- JOIN
SELECT DISTINCT m.MusteriAdi
FROM dbo.Musteriler m
JOIN dbo.Siparisler s ON m.MusteriID = s.MusteriID;


/* --------------------------------------------------
7. Gerçek hayat senaryosu
Ortalama satışın üstünde satış yapan müşteriler
-------------------------------------------------- */
SELECT m.MusteriAdi
FROM dbo.Musteriler m
JOIN dbo.Siparisler s ON m.MusteriID = s.MusteriID
JOIN dbo.SiparisDetaylari sd ON s.SiparisID = sd.SiparisID
GROUP BY m.MusteriAdi
HAVING SUM(sd.BirimFiyat * sd.Miktar) > (
    SELECT AVG(TotalSatis)
    FROM (
        SELECT SUM(sd2.BirimFiyat * sd2.Miktar) AS TotalSatis
        FROM dbo.Siparisler s2
        JOIN dbo.SiparisDetaylari sd2 ON s2.SiparisID = sd2.SiparisID
        GROUP BY s2.MusteriID
    ) AS Satislar
);
