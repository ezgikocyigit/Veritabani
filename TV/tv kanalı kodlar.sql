create table advertisements
(
id integer primary key not null,
	genre varchar(30),
	ad_number integer
)
create table deaf
(
id integer primary key not null,
	age integer,
	subtitle text,
	password integer
)
create table publish
(
 time integer primary key not null,
	hour varchar(10)
)
create table sponsor
(
id integer primary key not null,
kind varchar(50),
	year_of_foundation integer
)
create table supporter
(
date varchar(10) primary key not null,
amaunt varchar(10)
)
create table tb_channel
(
id integer primary key not null,
	name varchar(30),
	start_year integer,
	head_office varchar(30)
)
create table tb_productor
(
id integer primary key not null,
	company_name varchar(30),
	company_country varchar(50),
	show_id integer
)
create table tb_reyting 
(
id integer primary key not null,
	user_id integer,
	vote integer,
	show_id integer
)
create table tb_show
(
id integer primary key not null,
channel_id integer,
	genre varchar(50),
	name varchar(30),
	basic_info varchar(100),
	participants_name varchar(20)
)
create table tb_user
(
id integer primary key not null,
	username varchar(30),
	age integer,
	password varchar(30)
)
insert into advertisements (id,genre,ad_number)values(109,'telefon',9)
insert into deaf (id,age,subtitle,password) values(13,23,'ingilizce',12332)
insert into publish (hour,time)values('9 pm',1)
insert into sponsor(id,kind,year_of_foundation)values(15,'bireysel',1956)
insert into supporter(date,amaunt)values('10 Aralık','117000')
insert into tb_channel(id,name,start_year,head_office)values(111,'TRT2',1605,'istanbul')
insert into tb_productor(id,company_name,company_country,show_id)
values(7234,'focus yapım','fransa',1010)
insert into tb_reyting(id,user_id,vote,show_id)values(5,5,1,23)
insert into tb_show(id,channel_id,genre,name,basic_info,participants_name)
values(232,44,'eglence','deneme show1','unlulerin birlesmesi','ünlüler')
insert into tb_user(id,username,age,password)values(1,'deneme kullanici',30,'12ab54') 