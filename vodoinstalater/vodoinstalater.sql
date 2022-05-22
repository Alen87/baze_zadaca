# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\vodoinstalater\vodoinstalater.sql

drop database if exists vodoinstalater;
create database vodoinstalater;
use vodoinstalater;


create table vodoinstalater(
    sifra  int not null primary key auto_increment,
    ime varchar(30) not null,
    prezime varchar(30) not null,
    oib char(11) not null,
    godina_staza int,
    segrt int
);


create table kvar(
    sifra int not null primary key auto_increment,
    opis_kvara varchar(50) not null,
    datum datetime not null,
    utroseni_materijal varchar(100),
    cijena_materijala decimal(18,2)
);

create table vodoinstalater_kvar(
    sifra int not null primary key auto_increment,
    vodoinstalater int not null,
    kvar int not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(30) not null,
    prezime varchar(30) not null,
    oib char(11) not null
);


alter table vodoinstalater add foreign key (segrt) references segrt(sifra);
alter table vodoinstalater_kvar add foreign key (vodoinstalater) references vodoinstalater(sifra);
alter table vodoinstalater_kvar add foreign key (kvar)references kvar(sifra);