create database KÜTÜPHANE1
use kütüphane1
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
tür_no int,
kütüphane_id int not null
)
create table türler(
tür_no int primary key not null,
tür_adi varchar(30) null
)
create table kütüphane(
kütüphane_id int primary key not null,
kütüphane_adi varchar(35),
adresi varchar(55)
)
create table okuyucu_bilgileri(
okuyucu_id int primary key not null,
adi_soyadi varchar(30),
tc char(11),
kitap_id int
)
create table ödünc_islemleri(
ödünc_no int primary key not null,
kitap_id int not null,
alinan_tarih date not null,
verilen_tarih date null,
suresi varchar(10),
kütüphane_id int
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
tür_no int
)

alter table ödünc_islemleri
add constraint fk1 foreign key (kitap_id) references kitaplar(kitap_id)
alter table kitaplar
add constraint fkyazar foreign key (yazar_id) references yazarlar(yazar_id)
alter table kitaplar
add constraint fkyayinevi foreign key (yayinevi_id) references yazarlar(yayýnevi_id)
alter table kategori
add constraint fk foreign key (kitap_id) references kitaplar(kitap_id)
alter table kategori
add constraint fktür foreign key (tür_no) references türler(tür_no)
alter table okuyucu_bilgileri
add constraint fkk foreign key (kitap_id) references kitaplar(kitap_id)
alter table yayinevleri
add constraint fkyayinevii foreign key (tür_no) references türler(tür_no)
alter table ödünc_islemleri
add constraint fkkütüphane foreign key (kütüphane_id) references kütüphane(kütüphane_id)

