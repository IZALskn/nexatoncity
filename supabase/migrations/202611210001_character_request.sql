-- Store the request on the claim so the house and request are accepted together.
alter table public.citizens
  add column if not exists character_request text
  check (char_length(character_request) between 1 and 80 and btrim(character_request) <> '');
