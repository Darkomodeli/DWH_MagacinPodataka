/*
=================================================================
Kreiranje baze podataka i shema
=================================================================
Svrha skripte:
Ova skripta kreira novu bazu podataka pod nazivom 'DWH_MagacinPodataka' nakon što proveri da li već postoji. 
Ako baza podataka postoji, ona se briše i ponovo kreira. 
Pored toga, skripta postavlja tri sheme unutar baze podataka: 
'bronzana', 'srebrna' i 'zlatna'.

UPOZORENJE:
Pokretanje ove skripte će izbrisati celu bazu podataka 'DWH_MagacinPodataka' ako postoji. 
Svi podaci u bazi podataka će biti trajno izbrisani. 
Budite oprezni i proverite imate li odgovarajuće sigurnosne kopije prie pokretanja ovog skripta.
*/


USE master;
GO

-- Izbrišite i ponovo kreirajte bazu podataka 'DWH_MagacinPodataka'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DWH_MagacinPodataka')
BEGIN
    ALTER DATABASE DWH_MagacinPodataka SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DWH_MagacinPodataka;
END;
GO

-- Kreiranje Baze podataka DWH_MagacinPodataka
CREATE DATABASE DWH_MagacinPodataka;
GO

USE DWH_MagacinPodataka;
GO

-- Kreiranje Shema
CREATE SCHEMA bronzani_sloj;
GO

CREATE SCHEMA srebrni_sloj;
GO

CREATE SCHEMA zlatni_sloj;
GO
