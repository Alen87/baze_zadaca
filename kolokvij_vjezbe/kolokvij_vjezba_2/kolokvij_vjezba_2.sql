# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_2\kolokvij_vjezba_2.sql
# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2;
use  kolokvij_vjezba_2;


create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime,
    suknja varchar(38),
    narukvica int,
    introventno bit,
    majica varchar(40) not null,
    decko int
);

create table decko(
    sifra int not null primary key auto_increment,
    introventno bit,
    vesta varchar(34),
    asocijalno bit not null
); 

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table zarucnica (
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);


create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int
);



alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka. (7)

insert into neprijatelj(sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values(null,null,'zelena',null,'okrugle',12.50,null,null),
      (null,null,'plava',null,'crne',15.50,null,null),
      (null,null,'crvena',null,'prozirne',16.50,null,null);
