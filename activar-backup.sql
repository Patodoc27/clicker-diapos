-- Clicker diapos · activar el backup en la nube (UNA sola vez)
-- Pasos: supabase.com → tu proyecto → "SQL Editor" → "New query" → pegar todo esto → "Run"
insert into storage.buckets (id, name, public)
values ('diapos', 'diapos', true)
on conflict (id) do nothing;

drop policy if exists "diapos_lectura"   on storage.objects;
drop policy if exists "diapos_escritura" on storage.objects;
drop policy if exists "diapos_update"    on storage.objects;
drop policy if exists "diapos_borrado"   on storage.objects;

create policy "diapos_lectura"   on storage.objects for select to anon using (bucket_id = 'diapos');
create policy "diapos_escritura" on storage.objects for insert to anon with check (bucket_id = 'diapos');
create policy "diapos_update"    on storage.objects for update to anon using (bucket_id = 'diapos');
create policy "diapos_borrado"   on storage.objects for delete to anon using (bucket_id = 'diapos');
