# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\postolar.sql

drop database if exists postolar;
create database postolar;
use postolar;

create table obuca(
    materijal varchar(50),
    vrsta_obuce varchar(50),
    broj_komada varchar(50)
);

create table korisnik(
    ime_prezime varchar(50),
    datum_zaprimanja varchar(50),
    datum_popravka varchar(50)
    
);

create table popravak(
    popravak varchar(50),
    utroseni_materijal varchar(50),
    cijena_materijala varchar(50)
);

create table segrt(
    ime_prezime varchar(50),
    oib varchar(50),
    radni_odnos varchar(50),
    radna_odjeca varchar(50)
);