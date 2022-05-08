# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\urar_silvija.sql

drop database if exists urar_silvija;
create database urar_silvija;
use urar_silvija;

create table satovi(
    vrsta_sata varchar(50),
    serijski_broj varchar(50),
    marka varchar(50),
    datum_popravka varchar(50)
);

create table korisnik(
    ime_prezime varchar(50),
    satovi varchar(50),
    oib varchar(50)
);

create table popravak(
    vrsta_popravka varchar(50),
    cijena_popravka varchar(50),
    utroseni_materijal varchar(50)
);

create table segrt(
    ime_prezime varchar(50),
    oib varchar(50),
    radni_odnos varchar(50),
    dnevnik_rada varchar(50)
);