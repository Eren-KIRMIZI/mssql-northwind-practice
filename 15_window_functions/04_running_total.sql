/*
Konu        : RUNNING TOTAL (Kümülatif Toplam)
Amaç        : Zaman içinde biriken değer
*/

USE Northwind;
GO

SELECT
    s.SatisTarihi,
    SUM(sd.Miktar * sd.BirimFiyati) AS GunlukCiro,
    SUM(SUM(sd.Miktar * sd.BirimFiyati)) 
        OVER (ORDER BY s.SatisTarihi) AS KumulatifCiro
FROM dbo.Satislar s
INNER JOIN dbo.[Satis Detaylari] sd
    ON s.SatisID = sd.SatisID
GROUP BY s.SatisTarihi
ORDER BY s.SatisTarihi;
GO
