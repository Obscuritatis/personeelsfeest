-- Personeelsfeest: vinkjes en eigen punten delen tussen toestellen, zonder aanmelden.
-- Elke lijst heeft een geheime sleutel (uuid). Wie de sleutel heeft, ziet en wijzigt die lijst.
-- Je deelt de sleutel door op een gekoppeld toestel de QR-code te tonen.
--
-- De tabel zelf is volledig afgeschermd: de app kan er enkel aan via de twee functies hieronder,
-- en die werken alleen met de juiste sleutel. Zonder sleutel is er niets te lezen of te wijzigen.
-- Raakt de veiligheidsrondes, de staalnamen en voedselverspilling niet aan.
--
-- Plak dit volledig in Supabase > SQL Editor en klik op Run. Opnieuw uitvoeren kan geen kwaad.

-- De vorige opzet (met aanmelden per e-mail) is niet meer nodig.
drop table if exists public.feest_vinkjes;
drop table if exists public.feest_eigen;

-- Eén tabel voor beide soorten regels:
--   soort 'vink'  = een afgevinkt punt (id = het punt)
--   soort 'eigen' = een zelf toegevoegd punt (id = eigen id, lijst = in welke lijst, tekst = wat er staat)
create table if not exists public.feest_data (
  sleutel uuid not null,
  soort text not null check (soort in ('vink', 'eigen')),
  id text not null check (char_length(id) between 1 and 64),
  lijst text not null default '' check (char_length(lijst) <= 64),
  tekst text not null default '' check (char_length(tekst) <= 200),
  at timestamptz not null default now(),
  gewijzigd timestamptz not null default now(),
  primary key (sleutel, soort, id)
);
create index if not exists feest_data_sleutel_idx on public.feest_data(sleutel);

-- Niemand komt rechtstreeks aan de tabel: enkel via de functies hieronder.
alter table public.feest_data enable row level security;
revoke all on public.feest_data from anon, authenticated;

-- Alles van één lijst ophalen.
create or replace function public.feest_lees(p_sleutel uuid)
returns table (soort text, id text, lijst text, tekst text, at timestamptz)
language sql
security definer
set search_path = public
as $$
  select d.soort, d.id, d.lijst, d.tekst, d.at
  from public.feest_data d
  where d.sleutel = p_sleutel;
$$;

-- Wijzigingen doorsturen: p_zet = regels om toe te voegen of bij te werken, p_weg = regels om te verwijderen.
-- Vorm: p_zet = [{"soort":"vink","id":"m-schaar","at":"2026-11-10T08:00:00Z"}, ...]
--       p_weg = [{"soort":"vink","id":"m-schaar"}, ...]
create or replace function public.feest_schrijf(p_sleutel uuid, p_zet jsonb default '[]'::jsonb, p_weg jsonb default '[]'::jsonb)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  aantal integer;
begin
  if p_sleutel is null then
    raise exception 'Geen sleutel opgegeven.';
  end if;
  if jsonb_typeof(p_zet) <> 'array' or jsonb_typeof(p_weg) <> 'array' then
    raise exception 'Verkeerde vorm.';
  end if;
  if jsonb_array_length(p_zet) > 500 or jsonb_array_length(p_weg) > 500 then
    raise exception 'Te veel regels in één keer.';
  end if;

  delete from public.feest_data d
  using jsonb_to_recordset(p_weg) as w(soort text, id text)
  where d.sleutel = p_sleutel and d.soort = w.soort and d.id = w.id;

  insert into public.feest_data (sleutel, soort, id, lijst, tekst, at, gewijzigd)
  select p_sleutel, z.soort, z.id, coalesce(z.lijst, ''), coalesce(z.tekst, ''), coalesce(z.at, now()), now()
  from jsonb_to_recordset(p_zet) as z(soort text, id text, lijst text, tekst text, at timestamptz)
  where z.soort in ('vink', 'eigen') and z.id is not null and char_length(z.id) between 1 and 64
  on conflict (sleutel, soort, id) do update
    set lijst = excluded.lijst, tekst = excluded.tekst, at = excluded.at, gewijzigd = now();

  -- Veiligheidsrem: een lijst blijft beperkt in omvang.
  select count(*) into aantal from public.feest_data where sleutel = p_sleutel;
  if aantal > 2000 then
    raise exception 'Deze lijst is te groot geworden.';
  end if;
end;
$$;

revoke all on function public.feest_lees(uuid) from public;
revoke all on function public.feest_schrijf(uuid, jsonb, jsonb) from public;
grant execute on function public.feest_lees(uuid) to anon, authenticated;
grant execute on function public.feest_schrijf(uuid, jsonb, jsonb) to anon, authenticated;
