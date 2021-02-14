-- create table film
-- ( 
-- film_id integer primary key not null,
-- film_adi varchar(30),
-- film_süresi integer,
-- film_konusu varchar(30)
-- )

-- create table aktor
-- (
-- aktor_id integer primary key not null,
-- 	aktor_adi varchar(30),
-- 	aktor_soyadi varchar(30)
-- )

-- create table yonetmen
-- (
-- 	yonetmen_id integer primary key not null,
-- 	yonetmen_adi varchar (30),
-- 	yonetmen_soyadi varchar (30)

-- )

-- create table senarist
-- (
-- 	senarist_id integer primary key not null,
-- 	senarist_adi varchar(30),
-- 	senarist_soyadi varchar(30)
-- )
insert into aktor(aktor_id,aktor_adi,aktor_soyadi)values (1,'zilan','turan')
insert into film(film_id,film_adi,film_süresi,film_konusu)values (11,'replike',2,'rap')
insert into senarist(senarist_id,senarist_adi,senarist_soyadi)values (111,'ezgi','koçyiğit')
insert into yonetmen(yonetmen_id,yonetmen_adi,yonetmen_soyadi)values (1111,'Emre','Bilgiç')
insert into aktor(aktor_id,aktor_adi,aktor_soyadi)values (10,'mehmet','arslan')
insert into film(film_id,film_adi,film_süresi,film_konusu)values (12,'anneler',1,'duygusal')
insert into senarist(senarist_id,senarist_adi,senarist_soyadi)values (13,'semih','yangın')
insert into yonetmen(yonetmen_id,yonetmen_adi,yonetmen_soyadi)values (1122,'kübra','velet')

select yonetmen_id,yonetmen_adi,yonetmen_soyadi from yonetmen
yonetmen tablosundan idsini adını ve soyadını çağıran sorgu

select*from yonetmen
yönetmen tablosunun tamamını getiren sorgu

select*from yonetmen where yonetmen_id=1122 and yonetmen_soyadi='velet' or yonetmen_adi='Emre'
Yönetmen tablosundan idsi 1122 ve soyadi velet olan veya adı Emre olan sütunları getiren sorgu

select senarist_adi from senarist 
senarist tablosundan sadece senarist adını getiren sorgu

select*from senarist where senarist_id>14 
senarist tablosundan idsinin değeri 14'den büyük olan değeri getiren sorgu

select*from film where film_adi like '%p%' 
film tablosunda film adi p harfi içeren sorgu

select*from film where film_Adi not like 'r%'
film tablosunda film adi r ile başlamayanları gösteren sorgu

select count(*)from aktor 
aktorlerin sayısını gösteren sorgu

select sum(film_süresi) from film 
tüm filmlerin sürelerini toplayan sorgu

select avg(film_süresi) from film
film tablosundaki sürelerin ortalamasını alan sorgu

select min(film_süresi), max(film_süresi) from film
film sürelerinin minumum ve maksimum değerinin kaç olduğunu gösteren sorgu

select max(film_süresi)-min(film_süresi) from film
film sürelerinin maksimum ile minumum arasındaki farkı gösteren sorgu

select*from film where film_süresi=(select max(film_süresi)from film)
film tablosundan film süresi maksimum olan kolonları,sütunları,değerleri getiren sorgu

select min(film_süresi) from film
film tablosunda film süresi en küçük olan değer

update film set film_süresi=1 where film_konusu='trajedi'
film idsi 11 olan satırın film süresini 3 olarak güncelleyen sorgu

Delete from film where film_süresi=1
film tablosundaki süresi 1 olan satırı silen komut

select*from aktor left join film on aktor.aktor_id=film.film_id;
aktor tablosunda verilen tüm sütunlar ve film tablosunda eşleşen satırlar
aktör tablosuna göre listelenmiştir

ALTER TABLE film ADD reklam_süresi integer
film tablosuna adı reklam süresi değeri integer olan sütun eklenmiştir

ALTER TABLE film DROP COLUMN reklam_süresi;
film tablosundan reklam_süresi adındaki sütunu silen sorgulama



CREATE TABLE program (
program_no integer PRIMARY KEY,
name text,
sunum numeric );

CREATE TABLE katilimci
katilimci_id integer PRIMARY KEY,
katilimci_addres text );

CREATE TABLE katilimci_bilgileri
program_no integer REFERENCES program(program_no) ON DELETE RESTRICT,
katilimci_id integer REFERENCES katilimci(katilimci_id) ON DELETE CASCADE;
yaş integer,
PRIMARY KEY (program_no,katilimci_id)
);

create table totalfilm 
(
sayi integer 
)
select * from film 
insert into totalfilm (sayi) values (3)
select count(*) from film
select * from totalfilm


Create or replace function deneme()
returns trigger
as
$$
begin 
update totalfilm  set sayi=sayi+1;
return new;
end;
$$
language plpgsql;

create trigger denemetrig
after insert 
on film
for each row
execute procedure deneme();

select*from totalfilm



