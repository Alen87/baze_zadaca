# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\Trgovacki_centar\trgovacki_centar.sql

drop database if exists trgovacki_centar;
create database trgovacki_centar;
use trgovacki_centar;


create table trgovacki_centar(
    sifra int not null primary key auto_increment,
    naziv varchar(40),
    adresa varchar(40),
    vlasnik varchar(40),
    trgovina int
);

create table trgovina(
    sifra int not null primary key auto_increment,
    sef int,
    naziv varchar(40),
    br_djelatnika int,
    radno_vrijeme varchar(50)
);

create table osoba(
    sifra int not null primary key auto_increment,
    sef int,
    ime_prezime varchar(40),
    kontakt varchar(40),
    oib char(11)
);

create table trgovina_osoba(
    sifra int not null primary key auto_increment,
    trgovina int not null,
    osoba int not null
);

create table sef(
     sifra int not null primary key auto_increment,
     ime_prezime varchar(40),
     oib char(11),
     kontakt varchar(40)
);


