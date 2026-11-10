# Personeelsfeest checklist

Afvinklijst voor de dag van het personeelsfeest, om op de smartphone te gebruiken.

**App openen:** https://obscuritatis.github.io/personeelsfeest/

## Wat staat erin

- **Plattegrond**: zaal, inkomhal en frigo & uitgang, met legende; zoomen met twee vingers, + en − of dubbeltikken, en verschuiven door te vegen
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
- Zonder aanmelden worden de vinkjes en eigen items **op je eigen toestel** bewaard.
- **Pc en smartphone gelijk houden**: meld je onderaan het startscherm aan met je e-mailadres. Je vinkjes en eigen punten lopen dan gelijk op al je toestellen (elke gebruiker heeft zijn eigen lijst).
- Zet de app op je beginscherm (in de app staat een knop **Installeer**), dan werkt ze ook zonder internet:
  - **iPhone (Safari):** deel-knop → *Zet op beginscherm*
  - **Android (Chrome):** menu ⋮ → *Toevoegen aan startscherm* of *App installeren*

## Synchroniseren instellen (eenmalig)

De app gebruikt hetzelfde Supabase-project als de veiligheidsrondes en de staalnamen (zie [`config.js`](config.js)).

1. **Database**: open in Supabase *SQL Editor*, plak de inhoud van [`supabase/personeelsfeest.sql`](supabase/personeelsfeest.sql) en klik *Run*. Het script maakt enkel twee nieuwe tabellen aan en raakt de andere apps niet aan.
2. **Aanmeldlink**: voeg onder *Authentication > URL Configuration* een *Redirect URL* toe: `https://obscuritatis.github.io/personeelsfeest/`. Laat de bestaande staan.

## Aanpassen

De inhoud staat bovenaan het script in `index.html`, in de lijsten `SECTIONS` (de taken) en `CREW` (de helpers en hun uren).
Na een aanpassing: verhoog het versienummer op **drie** plaatsen naar hetzelfde getal: `VERSION` in `index.html`, `v` in `version.json` en `CACHE` in `sw.js`. De app vergelijkt bij het openen haar eigen nummer met `version.json` en herlaadt zichzelf als er een nieuwere versie is. Onderaan het startscherm staat welke versie je hebt.

Lettertypes: Barlow en Barlow Condensed, SIL Open Font License (zie `fonts/OFL.txt`).
