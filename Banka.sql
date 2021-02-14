create table sube(
sube_adi varchar(30) not null primary key,
sube_sehir varchar(30),
varlıklar int
)
create table musteri(
id int not null primary key,
musteri_adi varchar(30),
musteri_mahalle varchar(50),
musteri_sehir varchar(30)
)
create table kredi(
kredi_numarasi bigint not null primary key,
tutar int,
sube_adi varchar(30)
)
create table borclu(
kimlik varchar(11) not null primary key,
kredi_numarasi bigint
)
create table mevduat(
hesap_numarasi bigint not null primary key,
sube_adi varchar(30),
bakiye int
)
create table mevduat_sahibi(
hesap_numarasi bigint not null primary key,
kimlik varchar(11)
)
insert into sube(sube_adi,sube_sehir,varlıklar)values('lefke','lefke',15000);
insert into sube(sube_adi,sube_sehir,varlıklar)values('gemikonağı','lefke',51000);
insert into musteri(id,musteri_adi,musteri_mahalle,musteri_sehir)values(1,'SezenSögüt','lefkosa','lefke');
insert into musteri(id,musteri_adi,musteri_mahalle,musteri_sehir)values(2,'MehmetAslan','lefkosa','lefke');
insert into kredi(kredi_numarasi,tutar,sube_adi)values(0000111100001111,17000,'lefke');
insert into kredi(kredi_numarasi,tutar,sube_adi)values(1111000011110000,14500,'lefke');
insert into borclu(kimlik,kredi_numarasi)values(18338514328,0000111100001111);
insert into borclu(kimlik,kredi_numarasi)values(18338514329,1111000011110000);
insert into mevduat(hesap_numarasi,sube_adi,bakiye)values(111111111111,'lefke',12000);
insert into mevduat(hesap_numarasi,sube_adi,bakiye)values(000000000000,'gemikonağı',13000);
insert into mevduat_sahibi(hesap_numarasi,kimlik)values(111111111111,18338514328);
insert into mevduat_sahibi(hesap_numarasi,kimlik)values(000000000000,18338514329);

--hangi müşterilerin hem lefke şubesinde borç kredisi hem de
--gemikonağı şubesinde bir mevduat hesabı vardır?(a)
select count(musteri_adi) from  kredi, musteri
inner join sube on musteri.musteri_sehir= sube.sube_sehir
inner join mevduat on sube.sube_adi= mevduat.sube_adi
where kredi.sube_adi = 'lefke 'or mevduat.sube_adi = 'gemikonağı' 

create view borc_kredisi
as
SELECT borclu.kimlik,borclu.kredi_numarasi,kredi.tutar,kredi.sube_adi
FROM borclu
full outer join kredi
ON borclu.kredi_numarasi=kredi.kredi_numarasi
create view mevduat_hesabi
as
select mevduat.hesap_numarasi,mevduat.sube_adi,mevduat.bakiye,mevduat_sahibi.kimlik
from mevduat
full outer join mevduat_sahibi
on mevduat.hesap_numarasi=mevduat_sahibi.hesap_numarasi
select borc_kredisi,mevduat_hesabi, borc_kredisi.kimlik from borc_kredisi
inner join mevduat_hesabi on borc_kredisi.kimlik=mevduat_hesabi.kimlik
where mevduat_hesabi.sube_adi='lefke' or borc_kredisi.sube_adi='gemikonağı'


--lefke şubesinde kaç müşterinin 10000 liradan fazla mevduat hesabı vardır?(b)
select count(bakiye>10000)from musteri 
inner join sube on musteri.musteri_sehir=sube.sube_sehir
inner join mevduat on mevduat.sube_adi=sube.sube_adi

--Hangi mevduat sahibi en yüksek hesap bakiyesine sahiptir?(c)
select * from mevduat
where bakiye =(select max(bakiye)  from  mevduat_sahibi inner join mevduat
on mevduat_sahibi.hesap_numarasi= mevduat.hesap_numarasi  )

--Bankanın her şubesi için toplam mevduat hesabı ile toplam borç kredisi sayılarını listele(d)
select sube.sube_adi , count(mevduat.hesap_numarasi) from sube
inner join mevduat on sube.sube_adi=mevduat.sube_adi
inner join mevduat_sahibi on mevduat.hesap_numarasi=mevduat_sahibi.hesap_numarasi
group by sube.sube_adi
--sayma işlemi yapan triger örneğimi dahil etmek istedim. 
-- create table toplammevduat_hesabi(
--  sayi int not null primary key
-- )
-- insert into toplammevduat_hesabi(sayi) values (2)
-- create or replace function toplamm()
-- returns trigger 
-- as
-- $$
-- begin
-- update toplammevduat_hesabi set sayi=sayi+1;
-- return new ;
-- end;
-- $$
-- language plpgsql;
-- create trigger tmtrigger	
-- after insert
-- on mevduat_sahibi
-- for each row
-- execute procedure toplamm();

-- select* from toplammevduat_hesabi

--Bankanın her şubesi için en yüksek mevduat sahipi ile en düşük borç kredi sahibini listele(e)
select sube.sube_adi,kimlik , max(mevduat.bakiye), min(kredi.tutar) from  sube
inner join mevduat on sube.sube_adi=mevduat.sube_adi
inner join mevduat_sahibi on mevduat.hesap_numarasi=mevduat_sahibi.hesap_numarasi
inner join kredi on kredi.sube_adi=mevduat.sube_adi
group by sube.sube_adi, mevduat_sahibi.kimlik
