# Personeelsfeest checklist

Afvinklijst voor de dag van het personeelsfeest, om op de smartphone te gebruiken.

**App openen:** https://obscuritatis.github.io/personeelsfeest/

## Wat staat erin

- **Mee te nemen**: materiaal en wie wat meebrengt
- **Drank**: de bestelde drank met aantallen, om af te vinken bij levering
- **Opbouw**: per zone (deel 1, 2, 3, inkomhal, frigo)
- **Helpers**: wie is er wanneer, met een lijn voor "nu"
- **Afsluiten**: frigo, lege flesjes, drankformulier, deur op slot, sleutel in het kastje
- **Vooraf geregeld?**: laatste controle van de takenlijst
- **Contact**: alle contactpersonen met belknop (bovenaan, ook via de gele knop in de balk)

## Gebruik

- **Startscherm**: je totale voortgang en een kaart per lijst, met wat er nog volgt. Tik op een kaart om de lijst te openen.
- **Tabbalk onderaan**: Start, Mee, Drank, Opbouw en Afsluiten. Het getal toont hoeveel er nog open staat.
- **Gele telefoonknop** rechtsboven: altijd de contactlijst met belknoppen.
- Tik op een regel om hem af te vinken. Tik nog eens om het vinkje weg te halen.
- Tik op de titel van een lijst om ze in of uit te klappen. Een lijst die je helemaal afvinkt, klapt vanzelf dicht. De app onthoudt welke lijsten dicht staan.
- Onderaan elke lijst kun je zelf iets **toevoegen**. Een eigen item verwijder je met **×** (tik twee keer om te bevestigen).
- De vinkjes en eigen items worden **op je eigen toestel** bewaard. Iedereen houdt zijn eigen lijst bij.
- Zet de app op je beginscherm (in de app staat een knop **Installeer**), dan werkt ze ook zonder internet:
  - **iPhone (Safari):** deel-knop → *Zet op beginscherm*
  - **Android (Chrome):** menu ⋮ → *Toevoegen aan startscherm* of *App installeren*

## Aanpassen

De inhoud staat bovenaan het script in `index.html`, in de lijsten `SECTIONS` (de taken) en `CREW` (de helpers en hun uren).
Na een aanpassing: verhoog in `sw.js` het nummer in `CACHE` (bijv. van `v15` naar `v16`), zodat toestellen de nieuwe versie ophalen.

Lettertypes: Barlow en Barlow Condensed, SIL Open Font License (zie `fonts/OFL.txt`).
