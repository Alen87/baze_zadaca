#C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_3\kolokvij_vjezba_3.sql

# 0. Kreirajte tablice (16) i veze između tablica. (6

drop database if exists kolokvij_vjezba_3;
create database kolokvij_vjezba_3;
use kolokvij_vjezba_3;

create table brat(
    sifra  int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

create table prijatelj_brat(
    sifra  int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table prijatelj(
    sifra  int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table ostavljena(
    sifra  int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa(
    sifra  int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table  punica(
    sifra  int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

create table cura(
    sifra  int not null primary key auto_increment,
    dekserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null  
);

create table svekar(
    sifra  int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);


alter table punica add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table svekar add foreign key (cura) references cura(sifra);


# 1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka. (7)

insert into brat(sifra,jmbag,ogrlica,ekstroventno)
values(null,null,18,1),
      (null,null,12,1),
      (null,null,23,1);

insert into prijatelj(sifra,kuna,haljina,lipa,dukserica,indiferentno)
values(null,null,null,null,null,1),
      (null,null,null,null,null,1),
      (null,null,null,null,null,1);

insert into prijatelj_brat(sifra,prijatelj,brat)
values(null,1,2),
      (null,2,1),
      (null,2,3);

insert into ostavljena(sifra,kuna,lipa,majica,modelnaocala,prijatelj)
values(null,null,null,null,'dioptrijske',1),
      (null,null,null,null,'sunčane',2),
      (null,null,null,null,'sunčane',3);

insert into snasa(sifra,introvertno,kuna,eura,treciputa,ostavljena)
values(null,null,12.59,7.50,null,1),
      (null,null,13.34,3.50,null,2),
      (null,null,11.59,2.50,null,3);


      

