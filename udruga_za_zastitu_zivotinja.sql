# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\udruga_za_zastitu_zivotinja.sql

drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;

create table osobe(
    oib varchar(50),
    ime_prezime varchar(50),
    popis_sticenika varchar(50)
);

create table sticenici(
    vrsta_sticenika varchar(50),
    godina_starosti varchar(50),
    podrijetlo varchar(50),
    br_prostora varchar(50)
);

create table prostor(
vrsta_prostora varchar(50),
godina_izgradnje varchar(50),
velicina_prostora varchar(50)
);