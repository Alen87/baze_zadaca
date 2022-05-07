# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\taksi_sluzba.sql

drop database if exists taksi_sluzba;
create database taksi_sluzba;
use taksi_sluzba;

create table vozila(
    marka_vozila varchar(50),
    registracija varchar(50),
    gorivo_datum varchar(50),
    registracija_datum varchar(50),
    vozac varchar(50)
);

create table vozac(
 ime_prezime varchar(50),
 oib varchar(50),
 datum_lijecnicki varchar(50),
 mjesto_prebivalista varchar(50),
 putnici varchar(50)
);

create table putnici(
    ime_prezime varchar(50),
    relacija varchar(50),
    predeni_km varchar(50),
    voznja varchar(50)
);

create table voznja(
    nagradna_voznja varchar(50),
    popust varchar(50),
    trajanje varchar(50)
);
