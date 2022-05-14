# C:\xampp\mysql\bin>mysql -uroot --default-character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\hijerarhija\hijerarhija.sql

drop database if exists hijerarhija;
create database hijerarhija;
use hijerarhija;

create table zaposlenik(
    sifra int not null primary key auto_increment,
    ime varchar(40),
    prezime varchar(40),
    placa decimal(18,2),
    nadredeni int
);


alter table zaposlenik add foreign key (nadredeni) references zaposlenik(sifra);