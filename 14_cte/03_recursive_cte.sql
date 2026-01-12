/*
Konu        : RECURSIVE CTE
Amaç        : Hiyerarşik veri yapısını öğretmek
Not         : Northwind TR'de doğal hiyerarşi yok,
              örnek amaçlı temp tablo kullanıldı
*/

USE Northwind;
GO

-- Örnek hiyerarşik tablo
DECLARE @PersonelHiyerarsi TABLE
(
    PersonelID INT,
    PersonelAdi NVARCHAR(50),
    UstPersonelID INT
);

INSERT INTO @PersonelHiyerarsi VALUES
(1, 'Genel Müdür', NULL),
(2, 'Satış Müdürü', 1),
(3, 'Muhasebe Müdürü', 1),
(4, 'Satış Uzmanı', 2),
(5, 'Muhasebe Uzmanı', 3);

-- Recursive CTE
WITH CTE_Personel AS
(
    -- Anchor
    SELECT
        PersonelID,
        PersonelAdi,
        UstPersonelID,
        0 AS Seviye
    FROM @PersonelHiyerarsi
    WHERE UstPersonelID IS NULL

    UNION ALL

    -- Recursive
    SELECT
        p.PersonelID,
        p.PersonelAdi,
        p.UstPersonelID,
        c.Seviye + 1
    FROM @PersonelHiyerarsi p
    INNER JOIN CTE_Personel c
        ON p.UstPersonelID = c.PersonelID
)
SELECT *
FROM CTE_Personel
ORDER BY Seviye, PersonelID;
GO
