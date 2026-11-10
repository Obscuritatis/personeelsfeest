-- Personeelsfeest: vinkjes en eigen punten per gebruiker, zodat pc en smartphone gelijk lopen.
-- Draait in hetzelfde Supabase-project als de veiligheidsrondes en de staalnamen, en raakt die gegevens niet aan.
-- Elke aangemelde gebruiker ziet en wijzigt enkel zijn eigen rijen (geen gedeelde lijst, geen toegangslijst nodig).
-- Plak dit volledig in Supabase > SQL Editor en klik op Run. Opnieuw uitvoeren kan geen kwaad.

-- Afgevinkte punten: één rij per gebruiker en punt. Een vinkje weghalen = de rij verwijderen.
create table if not exists public.feest_vinkjes (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  item_id text not null check (char_length(item_id) between 1 and 64),
  at timestamptz not null default now(),
  primary key (user_id, item_id)
);

-- Zelf toegevoegde punten.
create table if not exists public.feest_eigen (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  id text not null check (char_length(id) between 1 and 64),
  lijst text not null check (char_length(lijst) between 1 and 64),
  tekst text not null check (char_length(tekst) between 1 and 200),
  aangemaakt timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.feest_vinkjes enable row level security;
alter table public.feest_eigen enable row level security;

drop policy if exists "eigen vinkjes" on public.feest_vinkjes;
create policy "eigen vinkjes" on public.feest_vinkjes
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
drop policy if exists "eigen punten" on public.feest_eigen;
create policy "eigen punten" on public.feest_eigen
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

grant select, insert, update, delete on public.feest_vinkjes to authenticated;
grant select, insert, update, delete on public.feest_eigen to authenticated;

-- Live bijwerken: wijzigingen op het ene toestel verschijnen meteen op het andere.
do $$ begin
  if not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and tablename = 'feest_vinkjes') then
    alter publication supabase_realtime add table public.feest_vinkjes;
  end if;
  if not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and tablename = 'feest_eigen') then
    alter publication supabase_realtime add table public.feest_eigen;
  end if;
end $$;
