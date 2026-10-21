# Personeelsfeest checklist

Afvinklijst voor de dag van het personeelsfeest, om op de smartphone te gebruiken.

**App openen:** https://obscuritatis.github.io/personeelsfeest/

## Wat staat erin

- **Mee te nemen**: materiaal en wie wat meebrengt
- **Opbouw**: per zone (deel 1, 2, 3, inkomhal, frigo)
- **Helpers**: wie is er wanneer, met een lijn voor "nu"
- **Afsluiten**: frigo, lege flesjes, drankformulier, deur op slot, sleutel in het kastje
- **Vooraf geregeld?**: laatste controle van de takenlijst
- **Contact**: brouwer

## Gebruik

- Tik op een regel om hem af te vinken. Tik nog eens om het vinkje weg te halen.
- Onderaan elke lijst kun je zelf iets **toevoegen**. Een eigen item verwijder je met **×** (tik twee keer om te bevestigen).
- De vinkjes en eigen items worden **op je eigen toestel** bewaard. Iedereen houdt zijn eigen lijst bij.
- Zet de app op je beginscherm (in de app staat een knop **Installeer**), dan werkt ze ook zonder internet:
  - **iPhone (Safari):** deel-knop → *Zet op beginscherm*
  - **Android (Chrome):** menu ⋮ → *Toevoegen aan startscherm* of *App installeren*

## Aanpassen

De inhoud staat bovenaan het script in `index.html`, in de lijsten `SECTIONS` (de taken) en `CREW` (de helpers en hun uren).
Na een aanpassing: verhoog in `sw.js` het nummer in `CACHE` (bijv. van `v9` naar `v10`), zodat toestellen de nieuwe versie ophalen.

Lettertypes: Barlow en Barlow Condensed, SIL Open Font License (zie `fonts/OFL.txt`).
