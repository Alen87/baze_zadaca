 # C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\domaca_zadaca.sql

drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;

create table djelatnica(
    oib varchar(50),
    ime_prezime varchar(50),
    godina_rodenja varchar(50)
);

create table korisnici(
    ime_prezime varchar(50),
    broj_telefona varchar(50),
    broj_korisnika varchar(50),
    popust varchar(50)
);

create table usluga(
    vrsta_sisanja varchar(50),
    bojanje varchar(50),
    frizura varchar(50)
);