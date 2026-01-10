/*
Konu        : GROUP BY - Temel Kullanım
Veritabanı  : Northwind (TR)
Amaç        : Toplama, sayma, ortalama alma gibi özet işlemler
*/

/* --------------------------------------------------
1. Ürün sayısı
-------------------------------------------------- */
SELECT
    COUNT(*) AS ToplamUrunSayisi
FROM dbo.Urunler;


/* --------------------------------------------------
2. Kategori bazlı ürün sayısı
-------------------------------------------------- */
SELECT
    KategoriID,
    COUNT(*) AS UrunSayisi
FROM dbo.Urunler
GROUP BY
    KategoriID;


/* --------------------------------------------------
3. Kategori bazlı ortalama ürün fiyatı
-------------------------------------------------- */
SELECT
    KategoriID,
    AVG(BirimFiyati) AS OrtalamaFiyat
FROM dbo.Urunler
GROUP BY
    KategoriID;


/* --------------------------------------------------
4. En pahalı ve en ucuz ürün fiyatları
-------------------------------------------------- */
SELECT
    MAX(BirimFiyati) AS EnYuksekFiyat,
    MIN(BirimFiyati) AS EnDusukFiyat
FROM dbo.Urunler;


/* --------------------------------------------------
5. Stokta olan / olmayan ürün sayısı
-------------------------------------------------- */
SELECT
    StoktaMi,
    COUNT(*) AS UrunSayisi
FROM dbo.Urunler
GROUP BY
    StoktaMi;
