 # C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\salon_za_uljepsavanje.sql

drop database if exists salon_za_uljepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;

create table djelatnice(
    ime_prezime varchar(50),
    oib varchar(50),
    popis_korsnika varchar(50)
);


create table korisnici(
    ime_prezime varchar(50),
    telefonski_broj varchar(50),
    usluga varchar(50),
    naruceno_vrijeme varchar(50)
);







