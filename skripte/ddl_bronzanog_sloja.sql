/*
===============================================================================
DDL skripta: Kreiranje bronzanih tabela
============================================================================
Svrha skripte:
Ova skripta kreira tabele u 'bronzanoj' shemi, brišući postojeće tabele ako već postoje.
Pokrenite ovu skriptu da biste redefinisali DDL strukturu 'bronzanih' tabela
===============================================================================
*/

IF OBJECT_ID('bronzani_sloj.crm_kupci_info', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.crm_kupci_info;
GO

CREATE TABLE bronzani_sloj.crm_kupci_info (
    kup_id					 INT,
    kup_kljuc				 NVARCHAR(50),
    kup_ime					 NVARCHAR(50),
    kup_prezime				 NVARCHAR(50),
    kup_bracni_status        NVARCHAR(50),
    kup_pol                  NVARCHAR(50),
    kup_datum_nastajanja     DATE
);
GO

IF OBJECT_ID('bronzani_sloj.crm_proizvodi_info', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.crm_proizvodi_info;
GO

CREATE TABLE bronzani_sloj.crm_proizvodi_info (
    proiz_id           INT,
    proiz_kljuc        NVARCHAR(50),
    proiz_naziv        NVARCHAR(50),
    proiz_cena         INT,
    proiz_linija       NVARCHAR(50),
    proiz_start_datum  DATETIME,
    proiz_kraj_datum   DATETIME
);
GO

IF OBJECT_ID('bronzani_sloj.crm_prodaja_detalji', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.crm_prodaja_detalji;
GO

CREATE TABLE bronzani_sloj.crm_prodaja_detalji (
    proda_br_por        NVARCHAR(50),
    proda_proiz_kljuc   NVARCHAR(50),
    proda_kup_id	    INT,
    proda_datum_porudzb INT,
    proda_datum_otpreme INT,
    proda_datum_ispor   INT,
    proda_prodaja       INT,
    proda_kvantitet     INT,
    proda_cena          INT
);
GO

IF OBJECT_ID('bronzani_sloj.erp_lokacije_a101', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.erp_lokacije_a101;
GO

CREATE TABLE bronzani_sloj.erp_lokacije_a101 (
    zem_id    NVARCHAR(50),
    zemlja    NVARCHAR(50)
);
GO

IF OBJECT_ID('bronzani_sloj.erp_kupci_az12', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.erp_kupci_az12;
GO

CREATE TABLE bronzani_sloj.erp_kupci_az12 (
    kupac_id        NVARCHAR(50),
    datum_rodjenja  DATE,
    pol             NVARCHAR(50)
);
GO

IF OBJECT_ID('bronzani_sloj.erp_px_katalog_g1v2', 'U') IS NOT NULL
    DROP TABLE bronzani_sloj.erp_px_katalog_g1v2;
GO

CREATE TABLE bronzani_sloj.erp_px_katalog_g1v2 (
    id            NVARCHAR(50),
    kateg         NVARCHAR(50),
    podkateg      NVARCHAR(50),
    odrzavanje    NVARCHAR(50)
);
GO