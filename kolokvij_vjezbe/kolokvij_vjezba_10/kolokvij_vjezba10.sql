# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_10\kolokvij_vjezba10.sql

# 0. Kreirajte tablice (16) i veze između tablica. (6)


drop database if exists kolokvij_vjezba_10;
create database kolokvij_vjezba_10;
use kolokvij_vjezba_10;


create table neprijatelj(
    sifra int not null primary key auto_increment,
    gustoca decimal(15,10) not null,
    dukserica varchar(32) not null,
    maraka decimal(15,7),
    silfrizura varchar(49) not null
);

create table punac_neprijatelj(
    sifra int not null primary key auto_increment,
    punac int not null,
    neprijatelj int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    lipa decimal(15,9),
    eura decimal(15,10) not null,
    stilfrizura varchar(37)
);

create table svekrva(
    sifra int not null primary key auto_increment,
    eura decimal(17,9),
    carape varchar(43),
    kuna decimal(13,9),
    majica varchar(30),
    introventno bit not null,
    punac int
);

create table mladic(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    lipa decimal(18,6),
    stilfrizura varchar(35) not null,
    prstena int,
    maraka decimal(12,6) not null,
    svekrva int
);

create table zena(
    sifra int not null primary key auto_increment,
    bojaociju varchar(49) not null,
    maraka decimal(13,9) not null,
    majica varchar(45),
    indiferentno bit,
    prviputa datetime,
    mladic int
);


create table zarucnica(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    prviputa datetime,
    suknja varchar(32) not null,
    eura decimal(16,10)
);

create table sestra(
    sifra int not null primary key auto_increment,
    suknja varchar(46) not null,
    bojaociju varchar(49),
    indiferentno  bit,
    dukserica varchar(32) not null,
    drugiput datetime,
    prviputa datetime not null,
    zarucnica int

);