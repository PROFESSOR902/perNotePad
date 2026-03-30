alter policy "Allow anyone to read"
on "public"."notepads"
to public
using (true);

alter policy "Allow public insert"
on "public"."notepads"
to public
with check (true);

alter policy "Allow public update"
on "public"."notepads"
to public
using (true) 
with check (true);

