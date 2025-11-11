# 🏗️ DWH — Magacin Podataka  
### **Portfolio Projekat / SQL Server Data Warehouse**

Dobrodošli u repozitorijum **DWH – Magacin Podataka**, praktičan projekat u kojem izgrađujem kompletan Data Warehouse sistem korišćenjem **Microsoft SQL Server-a** i Medallion arhitekture (**Bronze → Silver → Gold**).

Ovaj projekat predstavlja:

✅ demonstraciju realnog Data Engineering procesa  
✅ implementaciju ETL logike u **T-SQL**  
✅ rad sa CSV izvorima (CRM + ERP)  
✅ modelovanje podataka (dimenzije i činjenice)  
✅ pripremu podataka za BI izveštavanje  

Projekat je **lokalizovan na srpski jezik** i namenjen domaćim IT poslodavcima koji žele da vide praktično znanje, disciplinovan pristup i sposobnost vođenja DWH procesa od nule.
 
---

# 🚀 Kako pokrenuti projekat

Ovaj projekat može da se izvrši odmah nakon kloniranja repozitorijuma.

## ▪️ Uputstvo za pokretanje i testiranje projekta

### *1.  Kliknite „Code → Download ZIP”.*
### *2.  Otpakujte ZIP u folder:*
  - `C:\DWH_MagacinPodataka\`
Struktura mora izgledati ovako:
  - `C:\DWH_MagacinPodataka\
          skripte\
          set_podataka\
              release\
                  kupci_info.csv
                  prodaja_detalji.csv
                  proizvodi_info.csv
                  KUPCI_AZ12.csv
                  LOKACIJE_A101.csv
                  PX_KATALOG_G1V2.csv`

### *3.  Otvorite Microsoft SQL Server Management Studio.*

### *4.  Pokrenite skripte ovim redom:*
✅ ▪️  00_inicijalizacija_baze.sql

✅ ▪️  01_ucitaj_proceduru_bronzanog_sloja.sql

✅ ▪️  02_izvrsi_proceduru_bronzanog_sloja.sql

### *5.  Predviđeni Rezultati:*
- Dataset (CSV): `set_podataka/release/`  
- Fajlovi:  
  - `KUPCI_AZ12.csv`, `LOKACIJE_A101.csv`, `PX_KATALOG_G1V2.csv` (ERP)  
  - `proizvodi_info.csv`, `prodaja_detalji.csv`, `kupci_info.csv` (CRM)

**Nazivi i mapiranje (Bronzanog sloja)**  
| CSV fajl | Bronze tabela |
|---|---|
| `KUPCI_AZ12.csv` | `bronzani_sloj.erp_kupci_aZ12` |
| `LOKACIJE_A101.csv` | `bronzani_sloj.erp_lokacije_a101` |
| `PX_KATALOG_G1V2.csv` | `bronzani_sloj.erp_px_katalog_g1v2` |
| `proizvodi_info.csv` | `bronzani_sloj.crm_proizvodi_info` |
| `prodaja_detalji.csv` | `bronzani_sloj.crm_prodaja_detalji` |
| `kupci_info.csv` | `bronzani_sloj.crm_kupci_info` |

### *6.  Znači, kodove izvršavamo ovim redosledom:*
  
1. Pokrenite SQL skriptu za inicijalizaciju:
   - `skripte/inicijalizacija_DWH_bazepodataka.sql`  
   (kreira bazu `DWH_MagacinPodataka` i šeme: `bronzani_sloj`, `srebrni_sloj`, `zlatni_sloj`)
2. Uvezite Bronze sloj (automatski ETL u stored procedure):
 - `01_ucitaj_proceduru_bronzanog_sloja.sql`  
   (učitava proceduru GRUPNOG UVOZA (BULK INERT-a) u SSMS memoriju u 3 sheme: `bronzani_sloj`, `srebrni_sloj`, `zlatni_sloj`)

   ```sql
   USE DWH_MagacinPodataka;
   EXEC bronzani_sloj.ucitaj_bronzani_sloj;
3. Proverite sadržaj npr:
 - ```sql
   SELECT * FROM bronzani_sloj.crm_kupci_info;

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


