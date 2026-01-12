/*
Dosya       : 01_insert_examples.sql
Konu        : DML - INSERT
Veritabanı  : Northwind (TR)
Amaç        : Tekli, çoklu ve ilişkili veri ekleme örnekleri
*/

USE Northwind;
GO

/* ==================================================
1. MUSTERI EKLEME
================================================== */
INSERT INTO dbo.Musteriler
(
    MusteriID,
    SirketAdi,
    MusteriAdi,
    Adres,
    Sehir,
    Ulke,
    Telefon
)
VALUES
(
    'TEST1',
    'Test Sirketi A.S.',
    'Ali Veli',
    'Deneme Sokak No:1',
    'Istanbul',
    'Turkiye',
    '0212 000 00 00'
);
GO


/* ==================================================
2. BOLGE (REGION) EKLEME
================================================== */
INSERT INTO dbo.Bolge
(
    BolgeID,
    BolgeTanimi
)
VALUES
(
    99,
    'Test Bolgesi'
);
GO


/* ==================================================
3. BOLGELER (TERRITORY) EKLEME
================================================== */
INSERT INTO dbo.Bolgeler
(
    TerritoryID,
    TerritoryTanimi,
    BolgeID
)
VALUES
(
    'TEST-TR',
    'Test Territory',
    99
);
GO


/* ==================================================
4. KATEGORI EKLEME
================================================== */
INSERT INTO dbo.Kategoriler
(
    KategoriAdi,
    Tanimi
)
VALUES
('Test Kategori 1', 'Deneme Açıklama'),
('Test Kategori 2', 'Deneme Açıklama');
GO


/* ==================================================
5. URUN EKLEME
================================================== */
INSERT INTO dbo.Urunler
(
    UrunAdi,
    TedarikciID,
    KategoriID,
    BirimdekiMiktar,
    BirimFiyati,
    HedefStokDuzeyi,
    EnAzYenidenSatisMikatari,
    Sonlandi
)
VALUES
(
    'Test Urunu',
    NULL,
    1,
    '10 Kutu',
    150.00,
    50,
    10,
    0
);
GO


/* ==================================================
6. SATIS (ORDER) EKLEME
================================================== */
INSERT INTO dbo.Satislar
(
    MusteriID,
    PersonelID,
    SatisTarihi,
    SevkAdresi,
    SevkSehri,
    SevkUlkesi
)
VALUES
(
    'TEST1',
    1,
    GETDATE(),
    'Deneme Adresi',
    'Istanbul',
    'Turkiye'
);
GO


/* ==================================================
7. SATIS DETAYI EKLEME
================================================== */
INSERT INTO dbo.[Satis Detaylari]
(
    SatisID,
    UrunID,
    BirimFiyati,
    Miktar,
    İndirim
)
VALUES
(
    (SELECT MAX(SatisID) FROM dbo.Satislar),
    1,
    150.00,
    2,
    0
);
GO
