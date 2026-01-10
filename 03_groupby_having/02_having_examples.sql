/*
Konu        : HAVING
Veritabanı  : Northwind (TR)
Amaç        : GROUP BY sonrası filtreleme yapmak
*/

/* --------------------------------------------------
1. Birden fazla ürünü olan kategoriler
-------------------------------------------------- */
SELECT
    KategoriID,
    COUNT(*) AS UrunSayisi
FROM dbo.Urunler
GROUP BY
    KategoriID
HAVING
    COUNT(*) > 1;


/* --------------------------------------------------
2. Ortalama fiyatı 50’den büyük kategoriler
-------------------------------------------------- */
SELECT
    KategoriID,
    AVG(BirimFiyati) AS OrtalamaFiyat
FROM dbo.Urunler
GROUP BY
    KategoriID
HAVING
    AVG(BirimFiyati) > 50;


/* --------------------------------------------------
3. Toplam stok miktarı 100’den fazla olan kategoriler
-------------------------------------------------- */
SELECT
    KategoriID,
    SUM(StokMiktari) AS ToplamStok
FROM dbo.Urunler
GROUP BY
    KategoriID
HAVING
    SUM(StokMiktari) > 100;


/* --------------------------------------------------
4. HAVING vs WHERE farkı
-------------------------------------------------- */
-- WHERE → satırları filtreler
-- HAVING → grupları filtreler
