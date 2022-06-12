# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\FOP_zadaca\Primjer1.sql

drop database if exists Primjer1;
create database Primjer1;
use Primjer1;


create table muskarac(
    id int not null primary key auto_increment,
    maraka decimal(17,7) not null,
    hlace varchar(45) not null,
    prstena int not null,
    nausnica int,
    neprijateljica int not null
);

create table neprijateljica(
    id int not null primary key auto_increment,
    indiferentno tinyint not null,
    modelnaocala varchar(39) not null,
    maraka decimal(12,10) not null,
    kratkamajica varchar(32) not null,
    oglica int
);


create table sestra(
    id int not null primary key auto_increment,
    introventno tinyint not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int not null
);

create table punac(
    id int not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int
);

create table zarucnica(
    id int not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int not null
);


alter table muskarac add foreign key (neprijateljica) references neprijateljica(id);