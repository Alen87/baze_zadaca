# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\srednja_skola\srednja_skola.sql

drop database if exists srednja_skola;
create database srednja_skola;
use srednja_skola;


create table srednja_skola(
    sifra int not null primary key auto_increment,
    naziv varchar(40) not null,
    kontakt varchar(30) not null,
    adresa varchar(30),
    razred int not null
);

create table razred(
    sifra int not null primary key auto_increment,
    naziv varchar(10) not null,
    br_ucenika int,
    oprema varchar(50),
    ucenik int not null
);


create table ucenik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(50) not null,
    oib char(11) not null,
    datum_rodenja datetime,
    kontakt_roditelja varchar(30)
);


create table razred_profesor(
    sifra int not null primary key auto_increment,
    profesor int not null,
    razred int not null
);


create table  profesor(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(40) not null,
    predmet varchar(50) not null,
    oib char(11) not null,
    kontakt varchar(30),
    adresa varchar(50)
);   