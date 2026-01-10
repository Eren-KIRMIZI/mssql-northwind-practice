/*
View        : vw_urun_kategori
Veritabanı  : Northwind (TR)
Açıklama    : Ürünlerin kategori bilgileriyle birlikte listelenmesi
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.vw_urun_kategori', 'V') IS NOT NULL
    DROP VIEW dbo.vw_urun_kategori;
GO

CREATE VIEW dbo.vw_urun_kategori
AS
SELECT
    u.UrunID,
    u.UrunAdi,
    k.KategoriAdi,
    u.BirimdekiMiktar,
    u.BirimFiyati,
    u.HedefStokDuzeyi,
    u.YeniSatis,
    u.EnAzYenidenSatisMikatari,
    u.Sonlandi
FROM dbo.Urunler u
INNER JOIN dbo.Kategoriler k
    ON u.KategoriID = k.KategoriID;
GO
