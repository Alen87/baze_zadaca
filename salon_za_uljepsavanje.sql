 # C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\salon_za_uljepsavanje.sql

drop database if exists salon_za_ulijepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;

create table djelatnice(
    oib varchar(50),
    ime_prezime varchar(50),
    datum_rodenja varchar(50),
    popis korisnika varchar(50)
);

create table korisnici(
    ime_prezime varchar(50),
    telefonski_broj varchar(50),
    


);







