USE DWH_MagacinPodataka;
GO
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF OBJECT_ID(N'bronzani_sloj.ucitaj_bronzani_sloj', N'P') IS NOT NULL
    DROP PROCEDURE bronzani_sloj.ucitaj_bronzani_sloj;
GO

CREATE PROCEDURE bronzani_sloj.ucitaj_bronzani_sloj
    @BasePath NVARCHAR(4000) = N'C:\Users\DARKO\Downloads\set_podataka_release'   -- podrazumevano; Marko æe prepisati
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql  NVARCHAR(MAX),
            @path NVARCHAR(4000);

    /* --- CRM --- */
    TRUNCATE TABLE bronzani_sloj.crm_kupci_info;
    SET @path = @BasePath + N'\kupci_info.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.crm_kupci_info FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);

    TRUNCATE TABLE bronzani_sloj.crm_proizvodi_info;
    SET @path = @BasePath + N'\proizvodi_info.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.crm_proizvodi_info FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);

    TRUNCATE TABLE bronzani_sloj.crm_prodaja_detalji;
    SET @path = @BasePath + N'\prodaja_detalji.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.crm_prodaja_detalji FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);

    /* --- ERP --- */
    TRUNCATE TABLE bronzani_sloj.erp_lokacije_a101;
    SET @path = @BasePath + N'\LOKACIJE_A101.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.erp_lokacije_a101 FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);

    TRUNCATE TABLE bronzani_sloj.erp_kupci_az12;
    SET @path = @BasePath + N'\KUPCI_AZ12.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.erp_kupci_az12 FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);

    TRUNCATE TABLE bronzani_sloj.erp_px_katalog_g1v2;
    SET @path = @BasePath + N'\PX_KATALOG_G1V2.csv';
    SET @sql  = N'BULK INSERT bronzani_sloj.erp_px_katalog_g1v2 FROM ''' + @path + N'''
                WITH (FIRSTROW=2, FIELDTERMINATOR='','', ROWTERMINATOR=''0x0a'', TABLOCK);';
    EXEC (@sql);
END
GO
