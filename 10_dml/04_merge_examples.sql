/*
Dosya       : 04_merge_examples.sql
Konu        : DML - MERGE
Veritabanı  : Northwind (TR)
Amaç        : INSERT / UPDATE / DELETE işlemlerini tek sorguda yapmak
*/

USE Northwind;
GO


/* ==================================================
HAZIRLIK: GEÇİCİ KAYNAK TABLO
(Genelde Excel / API / Staging Table)
================================================== */
IF OBJECT_ID('tempdb..#UrunKaynak') IS NOT NULL
    DROP TABLE #UrunKaynak;

CREATE TABLE #UrunKaynak
(
    UrunID INT,
    UrunAdi NVARCHAR(40),
    BirimFiyati MONEY,
    Sonlandi BIT
);

INSERT INTO #UrunKaynak
VALUES
(1, 'Chai', 120, 0),       -- UPDATE olacak
(999, 'Test Urunu X', 50, 0); -- INSERT olacak
GO


/* ==================================================
1. MERGE - INSERT + UPDATE
================================================== */
MERGE dbo.Urunler AS TARGET
USING #UrunKaynak AS SOURCE
    ON TARGET.UrunID = SOURCE.UrunID

WHEN MATCHED THEN
    UPDATE SET
        TARGET.UrunAdi     = SOURCE.UrunAdi,
        TARGET.BirimFiyati = SOURCE.BirimFiyati,
        TARGET.Sonlandi    = SOURCE.Sonlandi

WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        UrunAdi,
        BirimFiyati,
        Sonlandi
    )
    VALUES
    (
        SOURCE.UrunAdi,
        SOURCE.BirimFiyati,
        SOURCE.Sonlandi
    );
GO


/* ==================================================
2. MERGE + DELETE
(Kaynakta olmayan ürünleri pasif yap)
================================================== */
MERGE dbo.Urunler AS TARGET
USING #UrunKaynak AS SOURCE
    ON TARGET.UrunID = SOURCE.UrunID

WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET
        TARGET.Sonlandi = 1;
GO


/* ==================================================
3. MERGE + OUTPUT
(Yapılan işlemleri loglamak)
================================================== */
MERGE dbo.Urunler AS TARGET
USING #UrunKaynak AS SOURCE
    ON TARGET.UrunID = SOURCE.UrunID

WHEN MATCHED THEN
    UPDATE SET
        TARGET.BirimFiyati = SOURCE.BirimFiyati

WHEN NOT MATCHED BY TARGET THEN
    INSERT (UrunAdi, BirimFiyati, Sonlandi)
    VALUES (SOURCE.UrunAdi, SOURCE.BirimFiyati, SOURCE.Sonlandi)

OUTPUT
    $action AS IslemTipi,
    inserted.UrunID,
    inserted.UrunAdi,
    inserted.BirimFiyati;
GO
