# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\samostan\samostan.sql

drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    adresa varchar(30),
    velicina_odore varchar(5),
    posao int,
    nadredeni_svecenik int
);

create table posao(
    sifra int not null primary key auto_increment,
    mise varchar(30),
    ispovijedi varchar(30),
    svecenje_kuca varchar(30),
    svecenik int
);

create table nadredeni_svecenik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    mjesto_rodenja varchar(50),
    velicina_odore varchar(50)
);

# definiranje vanjskih kljuceva
alter table svecenik add foreign key (posao) references posao (sifra);
alter table svecenik add foreign key (nadredeni_svecenik) references nadredeni_svecenik (sifra);
alter table posao add foreign key (svecenik) references svecenik (sifra);

# unos podataka
insert into nadredeni_svecenik (ime_prezime,oib)
values ('Marko Horvat','28594786094');

insert into svecenik (ime_prezime,oib)
values ('Ivan Ivić','75894893762');