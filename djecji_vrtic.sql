# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\djecji_vrtic.sql

drop database if exists djecji_vrtic;
create database djecji_vrtic;
use djecji_vrtic;

create table odgojna_skupina(
    oznaka_skupine varchar(50),
    broj_djece varchar(50),
    dob_djece varchar(50)
);

create table djeca(
    ime_prezime varchar(50),
    datum_rodenja varchar(50),
    adresa varchar(50)
);

create table odgajateljica(
    ime_prezime varchar(50),
    oib varchar(50),
    adresa varchar(50),
    strucna_sprema varchar(50)
);

create table strucna_sprema(
    naziv varchar(50),
    datum varchar(50),
    staziranje varchar(50)
);




