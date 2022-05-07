# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table izlozba(
 br_izlozbe varchar(50),
 ime_muzeja varchar(50),
 ime_autora varchar(50),
 datum_otvaranja varchar(50)
);

create table djelo(
    tema varchar(50),
    identifikacija varchar(50),
    autor varchar(50)
);

create table kustos(
    ime_prezime varchar(50),
    oib varchar(50),
    datum_rodenja varchar(50)
);

create table sponzor(
    ime varchar(50),
    adresa varchar(50),
    uplata varchar(50)
);



