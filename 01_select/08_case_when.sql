/*
Konu        : SELECT - CASE WHEN
Veritabanı  : Northwind (TR)
Açıklama    : Koşullu mantık, sınıflandırma, durum belirleme
Amaç        : SQL içinde IF-ELSE mantığını profesyonelce kullanmak
*/

/* --------------------------------------------------
1. Basit CASE WHEN
-------------------------------------------------- */
SELECT 
    SiparisID,
    NakliyeUcreti,
    CASE 
        WHEN NakliyeUcreti > 100 THEN 'Yüksek'
        ELSE 'Normal'
    END AS NakliyeDurumu
FROM dbo.Siparisler;


/* --------------------------------------------------
2. Çoklu koşul CASE WHEN
-------------------------------------------------- */
SELECT 
    SiparisID,
    NakliyeUcreti,
    CASE 
        WHEN NakliyeUcreti > 150 THEN 'Çok Yüksek'
        WHEN NakliyeUcreti BETWEEN 50 AND 150 THEN 'Orta'
        ELSE 'Düşük'
    END AS UcretSeviyesi
FROM dbo.Siparisler;


/* --------------------------------------------------
3. CASE + Tarih
-------------------------------------------------- */
SELECT 
    SiparisID,
    SiparisTarihi,
    CASE 
        WHEN YEAR(SiparisTarihi) < 1997 THEN 'Eski'
        ELSE 'Yeni'
    END AS SiparisDurumu
FROM dbo.Siparisler;


/* --------------------------------------------------
4. CASE + NULL kontrolü
-------------------------------------------------- */
SELECT 
    SiparisID,
    SevkTarihi,
    CASE 
        WHEN SevkTarihi IS NULL THEN 'Sevk Edilmedi'
        ELSE 'Sevk Edildi'
    END AS SevkDurumu
FROM dbo.Siparisler;


/* --------------------------------------------------
5. CASE + GROUP BY senaryosu
-------------------------------------------------- */
SELECT 
    CASE 
        WHEN NakliyeUcreti > 100 THEN 'Yüksek Nakliye'
        ELSE 'Normal Nakliye'
    END AS Grup,
    COUNT(*) AS SiparisSayisi
FROM dbo.Siparisler
GROUP BY 
    CASE 
        WHEN NakliyeUcreti > 100 THEN 'Yüksek Nakliye'
        ELSE 'Normal Nakliye'
    END;


/* --------------------------------------------------
6. Gerçek hayat senaryosu
Müşteri satış performansı
-------------------------------------------------- */
SELECT 
    m.MusteriAdi,
    SUM(sd.BirimFiyat * sd.Miktar) AS ToplamSatis,
    CASE 
        WHEN SUM(sd.BirimFiyat * sd.Miktar) > 50000 THEN 'Altın'
        WHEN SUM(sd.BirimFiyat * sd.Miktar) BETWEEN 20000 AND 50000 THEN 'Gümüş'
        ELSE 'Bronz'
    END AS MusteriSegmenti
FROM dbo.Musteriler m
JOIN dbo.Siparisler s ON m.MusteriID = s.MusteriID
JOIN dbo.SiparisDetaylari sd ON s.SiparisID = sd.SiparisID
GROUP BY m.MusteriAdi;
