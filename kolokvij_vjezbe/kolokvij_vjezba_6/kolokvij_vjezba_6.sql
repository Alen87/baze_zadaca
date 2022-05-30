# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_6\kolokvij_vjezba_6.sql

# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_6;
create database kolokvij_vjezba_6;
use kolokvij_vjezba_6;


create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table prijatelj_ostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(39),
    prstena int not null,
    introventno bit,
    stilfrizura varchar(36) not null
);


create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int 
);


create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null 
);

create table decko(
    sifra int not null primary key auto_increment,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int
);


alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);
alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table brat add foreign key (prijatelj) references prijatelj(sifra);
alter table zena add foreign key (brat) references brat(sifra);
alter table decko add foreign key (zena) references zena(sifra);
alter table svekrva add foreign key (punac) references punac(sifra);

# 1. U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka. (7)

insert into ostavljena(sifra,prviputa,kratkamajica,drugiputa,maraka)
values(null,'2022-05-30','zelena',null,null),
      (null,'2022-03-30','žuta',null,null),
      (null,'2022-04-30','plava',null,null);
      
insert into prijatelj(sifra,haljina,prstena,introventno,stilfrizura)
values(null,null,4,null,'kratko'),
      (null,null,5,null,'dugačko'),
      (null,null,6,null,'srednje');
      
     
insert into prijatelj_ostavljena (sifra,prijatelj,ostavljena)
values(null,1,2),
      (null,2,3),
      (null,2,1);

insert into brat(sifra,nausnica,treciputa,narukvica,hlace,prijatelj)
values(null,3,'2022-05-30',5,null,null),
      (null,4,'2022-05-30',7,null,null),
      (null,6,'2022-05-30',8,null,null);
      
insert into zena(sifra,novcica,narukvica,dukserica,haljina,hlace,brat)
values(null,23.45,3,'zelena',null,null,1),
      (null,20.36,5,'crvena',null,null,1),
      (null,21.34,7,'plava',null,null,1);

#  2. U tablici svekrva postavite svim zapisima kolonu suknja na vrijednost Osijek. (4)

           
