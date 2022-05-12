# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\urar_silvija.sql

drop database if exists urar_silvija;
create database urar_silvija;
use urar_silvija;

create table urar(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    adresa varchar(50),
    sat int
);

create table sat(
    sifra int not null primary key auto_increment,
    vrsta_sata varchar(30) not null,
    serijski_broj varchar(20) not null,
    marka varchar(30) not null,
    datum_popravka datetime,
    popravak int
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    sat int
);

create table popravak(
    sifra int not null primary key auto_increment,
    vrsta_popravka varchar(50) not null,
    cijena_popravka decimal(18,2) not null,
    utroseni_materijal varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    radni_odnos varchar(50),
    popravci int
);