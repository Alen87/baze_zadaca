# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\doktorska_ordinacija.sql

drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;
use doktorska_ordinacija;


create table doktor (
 ime_prezime varchar(50),
 oib varchar(50),
 zavrseno_zanimanje varchar(50)
);

create table pacijenti(
    ime_prezime varchar(50),
    br_kartona varchar(50),
    oib varchar(50),
    dopunsko varchar(50),
    bolest varchar(50)
);

create table medicinske_sestre(
    ime_prezime varchar(50),
    oib varchar(50),
    dezurstvo varchar(50)
);