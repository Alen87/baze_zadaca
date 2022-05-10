# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\djecji_vrtic.sql

drop database if exists djecji_vrtic;
create database djecji_vrtic;
use djecji_vrtic;

create table odgojna_skupina(
    sifra int not null primary key auto_increment,
    djeca int not null,
    odgajateljica int not null,
    cijena decimal(18,2) not null
);

create table djeca(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(50) not null,
    datum_rodenja datetime not null,
    adresa varchar(50) not null
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(50) not null,
    oib char(11),
    adresa varchar(50),
    strucna_sprema int
);

create table strucna_sprema(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum datetime,
    staziranje datetime
);


# definiranje  vanjskih kljuceva
alter table odgojna_skupina add foreign key (djeca) references djeca(sifra);

