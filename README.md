# 🏗️ DWH — Magacin Podataka (Portfolio Projekat)

Dobrodošli u repozitorijum **DWH – Magacin Podataka**.  
Ovaj projekat predstavlja moj proces učenja i praktične primene koncepta izgradnje Data Warehouse sistema korišćenjem Microsoft SQL Server-a.

📌 Projekat je urađen na osnovu edukativnog materijala DataWithBaraa i **lokalizovan je** na srpski jezik, sa ciljem boljeg razumevanja procesa i demonstracije praktičnog znanja domaćim poslodavcima.

---

## 🎯 Cilj projekta

Izgradnja modernog skladišta podataka koje konsoliduje prodajne i CRM podatke, omogućava analitičke upite i kreira temelj za BI izveštavanje.

Ovaj projekat omogućava:
- razumevanje Data Warehouse arhitekture
- rad sa CSV izvorima podataka
- ETL procese u SQL-u
- modelovanje podataka (dimenzije i činjenice)
- kreiranje SQL analitičkih upita

---

## 🧠 Tehnologije i koncepti

U ovom projektu primenio sam:

- Microsoft SQL Server  
- SQL Management Studio (SSMS)
- **T-SQL** (Transact-SQL: Microsoft-ova implementacija SQL-a)
- Medallion arhitekturu (Bronze / Silver / Gold)
- Osnovne ETL principe
- Dimensional modeling (fakt i dimenzije)

> **Napomena:** T-SQL = SQL + Microsoft ekstenzije za rad sa bazama (procedura, kursora, transakcija itd.).  
> Ovde radim u **MS SQL Server-u**, pa samim tim koristim T-SQL.

**T-SQL** omogućava:
- Stored Procedure (automatizacija ETL logike)
- Transactions (sigurnost podataka — sve ili ništa)
- Cursors (obrada red-po-red, retko, samo kad je potrebno)

<details>
<summary><strong>🧩 Napredni SQL koncepti korišćeni u projektu</strong></summary>
<br>

Ovaj projekat uključuje korišćenje SQL funkcionalnosti tipičnih za realna Data Warehouse okruženja.

### ✅ Stored Procedure
Koriste se za automatizaciju ETL procesa i čuvanje poslovne logike.

Primer izvršavanja procedure:

> sql
>  | *EXEC etl_ucitaj_podatke_u_srebrni_sloj;* |


</details>

---
## 🧱 Arhitektura rešenja

Arhitektura prati **Medallion pristup**:

| Sloj | Opis |
|---|---|
| **Bronze** | Uvoz sirovih podataka iz izvora (CSV fajlovi: ERP i CRM) |
| **Silver** | Čišćenje i standardizacija podataka |
| **Gold** | Biznis spremni podaci za izveštavanje i analitiku |

*(Dijagram će biti dodat u narednoj verziji — verzija 1.1)*

---

## ✅ Obuhvat projekta

### Data Engineering

| Korak | Opis |
|---|---|
**Import podataka** | ERP i CRM CSV fajlovi  
**Čišćenje podataka** | Validacija, tipovi, standardizacija  
**Integracija** | Spajanje izvora u jedinstven model  
**Modelovanje** | Fakta + Dimenzije  
**Dokumentacija** | Naming konvencije, opisi tabela i kolona  

---

### Data Analytics (SQL)

U projektu razvijam SQL analitiku za:

- analizu kupaca  
- analizu proizvoda  
- trendove prodaje  

Cilj: prikaz realnih znanja potrebnih za rad u DW okruženju i priprema za profesionalne uloge.

---

## 📂 Struktura direktorijuma projekta

```text
DWH_MagacinPodataka/
│
├── set_podataka/                  # CSV izvori (lokalizovani fajlovi)
|   |
│   ├── izvor_crm/
│   └── izvor_erp/
│
├── skripte/                       # SQL skripte (ETL proces)
|   |    
|   ├── inicijalizacija_DWH_bazepodataka.sql  # kreiranje baze i šema                              
│   ├── bronzani_sloj/                        # [E] RAW podaci (Bronze Layer)
│   ├── srebrni_sloj/                         # [T] Očišćeni & standardizovani (Silver Layer)
│   └── zlatni_sloj/                          # [L] Business-ready podaci, agregacije (Gold Layer)
│   
│
├── dokumenti/                     # dodatna dokumentacija
├── testovi/                       # testiranja, validacije, QA
│
├── LICENSE
└── README.md
```

---

## 🧪 Dataset

Korišćeni dataset-ovi su edukativni (CRM + ERP).  
Nazivi kolona i fajlova su **lokalizovani**, npr:

- `kupci_info.csv`
- `prodaja_detalji.csv`
- `proizvodi_info.csv`

Ovo je urađeno kao vežba lokalizacije DWH procesa na srpski jezik.

---

## 📜 Licenca

Ovaj projekat je baziran na MIT licenci.  
Slobodan je za učenje, modifikovanje i dalju primenu uz korektnu atribuciju.

---

## 👤 O autoru

Zdravo! Ja sam **Darko Domonji**.  
Ovaj projekat je deo mog puta ka ulozi Data / BI / SQL inženjera.

✅ Primenjujem praktične tehnike učenja  
✅ Kombinujem kurs + dokumentaciju + realnu primenu  
✅ Fokus na MS SQL serveru (bitan za moj trenutno ciljani karijerni pravac)  

Cilj: **pokazati sposobnost učenja, razumevanja i primene u realnom okruženju.**

---

## 🧭 Plan nadogradnje

| Verzija | Funkcionalnost |
|---|---|
**v1.0** | SQL DWH postavljen, ETL osnove, dataset lokalizovan  
**v1.1** | Dodavanje dijagrama u draw.io (lokalizovan)  
**v1.2** | Dodatni poslovni KPI-ji i vizualizacija u Power BI  

---

## 🤝 Zahvalnost

Posebna zahvalnost kreatoru originalnog materijala DataWithBaraa za inspiraciju i otvorene resurse.

---

### 📝 Napomena za poslodavce / komisiju

Projekat je urađen **korak-po-korak**, bez automatizovanih šablona, sa ciljem:

- praktičnog razumevanja,
- lokalne primene,
- transparentnosti procesa učenja,
- pripreme za rad u realnom okruženju.


