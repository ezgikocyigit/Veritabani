create database K�T�PHANE1
use k�t�phane1
create table kitaplar(
kitap_id int primary key not null,
kitap_adi varchar(30),
fiyat int,
puan int,
yazar_id int not null,
yayinevi_id int
)
create table kategori(
kategori_id int primary key not null,
kitap_id int not null,
konusu varchar(50),
t�r_no int,
k�t�phane_id int not null
)
create table t�rler(
t�r_no int primary key not null,
t�r_adi varchar(30) null
)
create table k�t�phane(
k�t�phane_id int primary key not null,
k�t�phane_adi varchar(35),
adresi varchar(55)
)
create table okuyucu_bilgileri(
okuyucu_id int primary key not null,
adi_soyadi varchar(30),
tc char(11),
kitap_id int
)
create table �d�nc_islemleri(
�d�nc_no int primary key not null,
kitap_id int not null,
alinan_tarih date not null,
verilen_tarih date null,
suresi varchar(10),
k�t�phane_id int
)
create table yazarlar(
yazar_id int primary key not null,
yazar_adi varchar(30),
)
create table yayinevleri(
yayinevi_id int primary key not null,
yayinevi_adi varchar(30),
iletisim char(11),
adres varchar(30),
iban varchar(16),
t�r_no int
)

alter table �d�nc_islemleri
add constraint fk1 foreign key (kitap_id) references kitaplar(kitap_id)
alter table kitaplar
add constraint fkyazar foreign key (yazar_id) references yazarlar(yazar_id)
alter table kitaplar
add constraint fkyayinevi foreign key (yayinevi_id) references yazarlar(yay�nevi_id)
alter table kategori
add constraint fk foreign key (kitap_id) references kitaplar(kitap_id)
alter table kategori
add constraint fkt�r foreign key (t�r_no) references t�rler(t�r_no)
alter table okuyucu_bilgileri
add constraint fkk foreign key (kitap_id) references kitaplar(kitap_id)
alter table yayinevleri
add constraint fkyayinevii foreign key (t�r_no) references t�rler(t�r_no)
alter table �d�nc_islemleri
add constraint fkk�t�phane foreign key (k�t�phane_id) references k�t�phane(k�t�phane_id)

