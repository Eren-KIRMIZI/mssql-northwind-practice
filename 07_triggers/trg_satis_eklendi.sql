/*
Trigger     : trg_satis_eklendi
Tablo       : dbo.Satislar
Açıklama    : Yeni satış eklendiğinde tetiklenir
*/

USE Northwind;
GO

IF OBJECT_ID('dbo.trg_satis_eklendi', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_satis_eklendi;
GO

CREATE TRIGGER dbo.trg_satis_eklendi
ON dbo.Satislar
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SatisID int;

    SELECT @SatisID = SatisID FROM inserted;

    PRINT 'Yeni satış eklendi. SatisID: ' + CAST(@SatisID AS varchar);
END;
GO


/*
INSERT INTO dbo.Satislar
(
    MusteriID,
    PersonelID,
    SatisTarihi
)
VALUES
(
    'ALFKI',
    1,
    GETDATE()
);
*/
