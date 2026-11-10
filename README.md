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
- **Pc en smartphone gelijk houden**: geen aanmelden nodig. Tik onderaan het startscherm op **Koppel toestel** en scan de QR-code met het andere toestel. Beide toestellen tonen dan dezelfde lijst.
- Zet de app op je beginscherm (in de app staat een knop **Installeer**), dan werkt ze ook zonder internet:
  - **iPhone (Safari):** deel-knop → *Zet op beginscherm*
  - **Android (Chrome):** menu ⋮ → *Toevoegen aan startscherm* of *App installeren*

## Delen instellen (eenmalig)

De app gebruikt hetzelfde Supabase-project als de veiligheidsrondes en de staalnamen (zie [`config.js`](config.js)).
Open in Supabase *SQL Editor*, plak de inhoud van [`supabase/personeelsfeest.sql`](supabase/personeelsfeest.sql) en klik *Run*.
Meer is er niet nodig: geen aanmelden, geen mails, geen instellingen bij *Authentication*.

Elke lijst heeft een geheime sleutel (uuid) die in de koppellink zit. De tabel is afgeschermd; de app kan er enkel aan
via twee functies die de sleutel vragen. Wie de sleutel heeft, ziet en wijzigt die lijst — deel de QR-code dus enkel met collega's.

## Aanpassen

De inhoud staat bovenaan het script in `index.html`, in de lijsten `SECTIONS` (de taken) en `CREW` (de helpers en hun uren).
Na een aanpassing: verhoog het versienummer op **drie** plaatsen naar hetzelfde getal: `VERSION` in `index.html`, `v` in `version.json` en `CACHE` in `sw.js`. De app vergelijkt bij het openen haar eigen nummer met `version.json` en herlaadt zichzelf als er een nieuwere versie is. Onderaan het startscherm staat welke versie je hebt.

Lettertypes: Barlow en Barlow Condensed, SIL Open Font License (zie `fonts/OFL.txt`).
