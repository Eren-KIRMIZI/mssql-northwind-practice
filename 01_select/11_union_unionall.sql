/*
Konu        : SELECT - UNION / UNION ALL
Veritabanı  : Northwind (TR)
Açıklama    : Birden fazla SELECT sonucunu birleştirme
Amaç        : Farklı kaynaklardan gelen verileri tek liste haline getirmek
*/

/* --------------------------------------------------
1. UNION - Tekrarları kaldırır
-------------------------------------------------- */
SELECT Ulke
FROM dbo.Musteriler
UNION
SELECT Ulke
FROM dbo.Tedarikciler;


/* --------------------------------------------------
2. UNION ALL - Tekrarları kaldırmaz (daha hızlı)
-------------------------------------------------- */
SELECT Ulke
FROM dbo.Musteriler
UNION ALL
SELECT Ulke
FROM dbo.Tedarikciler;


/* --------------------------------------------------
3. UNION için kolon sayısı ve tip uyumu
-------------------------------------------------- */
SELECT MusteriAdi AS Ad, Ulke
FROM dbo.Musteriler
UNION
SELECT TedarikciAdi AS Ad, Ulke
FROM dbo.Tedarikciler;


/* --------------------------------------------------
4. ORDER BY sadece en sonda kullanılır
-------------------------------------------------- */
SELECT Ulke
FROM dbo.Musteriler
UNION
SELECT Ulke
FROM dbo.Tedarikciler
ORDER BY Ulke;


/* --------------------------------------------------
5. Filtreleme ile UNION
-------------------------------------------------- */
SELECT Ulke
FROM dbo.Musteriler
WHERE Ulke = 'Almanya'
UNION
SELECT Ulke
FROM dbo.Tedarikciler
WHERE Ulke = 'Almanya';


/* --------------------------------------------------
6. UNION + CASE WHEN
-------------------------------------------------- */
SELECT MusteriAdi AS Ad, 'Musteri' AS Kaynak
FROM dbo.Musteriler
UNION ALL
SELECT TedarikciAdi AS Ad, 'Tedarikci' AS Kaynak
FROM dbo.Tedarikciler;


/* --------------------------------------------------
7. Gerçek hayat senaryosu
Tüm kişi & firma listesi
-------------------------------------------------- */
SELECT MusteriAdi AS Isim, Sehir, Ulke
FROM dbo.Musteriler
UNION ALL
SELECT TedarikciAdi AS Isim, Sehir, Ulke
FROM dbo.Tedarikciler;
