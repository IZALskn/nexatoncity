-- Public registration only inserts a new row. These constraints arbitrate
-- simultaneous claims from different browsers, including mixed-case handles.
begin;
alter table public.citizens add column if not exists has_yard boolean default false;
create unique index if not exists citizens_one_house on public.citizens (house_id);
create unique index if not exists citizens_one_username
  on public.citizens (lower(regexp_replace(trim(username), '^@', '')));
commit;
