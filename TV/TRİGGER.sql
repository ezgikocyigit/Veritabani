insert into totaluser (sayi) values (3)
select count(*) from tb_user
select * from totaluser
select * from tb_user order by id

Create or replace function deneme()
returns trigger
as
$$
begin 
update totaluser  set sayi=sayi+1;
return new;
end;
$$
language plpgsql;

create trigger denemetrig
after insert 
on tb_user
for each row
execute procedure deneme();
select * from totaluser











