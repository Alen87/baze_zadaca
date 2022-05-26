# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezba_1\kolokvij_vjezba_1.sql
# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;


create  table sestra(
    sifra int not null primary key auto_increment,
    introventno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46),
    narukvica int not null 
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31),
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);


 create table svekar(
     sifra int not null primary key auto_increment,
     bojaociju varchar(40)  not null,
     prstena int,
     dukserica varchar(41),
     lipa decimal(13,8),
     eura decimal(12,7),
     majica varchar(35)
 );

 create table punac(
     sifra int not null primary key auto_increment,
     ogrlica int not null,
     gustoca int,
     hlace varchar(41) not null

 );

 create table cura(
     sifra int not null primary key auto_increment,
     novcica decimal(16,5) not null,
     gustoca decimal(18,6) not null,
     lipa decimal(13,10),
     ogrlica int not null,
     bojakose varchar(38),
     suknja varchar(36),
     punac int
     
 );


 alter table mladic add foreign key (muskarac) references muskarac(sifra);
 alter table muskarac add foreign key (zena) references zena(sifra);
 alter table zena add foreign key (sestra) references sestra(sifra);
 alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
 alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
 alter table cura add foreign key (punac) references punac(sifra);

 # 1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka. (7)

 insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka)
 values (null,'zelene','plave','okrugle',25.45657845),
        (null,'plave','plave','male',253.4),
        (null,'crvene','plave','četvrtaste',245.67);


insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina)
 values (null,'2022-05-24','kratke','plava','66745783897','plava','zelena'),
        (null,'2022-04-21','duge','zelena','89657489384','zelena','plava'),
        (null,'2022-03-24','kratke','siva','09478392057','plava','crvena');

insert into sestra(sifra,introventno,haljina,maraka,hlace,narukvica)
values(null,null,'zelena',null,'kratke',6),
      (null,null,'plava',null,'duge',5),
      (null,null,'crvena',null,'kratke',4);        

insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica)
values(null,'zelena',null,null,null,null,null),
      (null,'plava',null,null,null,null,null),
      (null,'crvena',null,null,null,null,null); 



insert into sestra_svekar(sifra,sestra,svekar)
values (null,1,3),
       (null,2,3),
       (null,3,1);


# 2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77. (4)

update cura set gustoca=15.77;

#3. U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78. (4)
   
select * from mladic;
insert into mladic(sifra,suknja,kuna,drugiputa,asocijalno,ekstroventno,dukserica,muskarac)
values (null,'kratka',15.34,null,null,1,'zelena',null),
       (null,'zelena',25.45,null,null,1,'zelena',null),
       (null,'plava',12.54,null,null,1,'zelena',null);

delete from mladic where kuna>15.78;

#4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana. (6)

select kratkamajica from zena 
where hlace like '%ana%';

#5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te 
#hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz 
#tablice zena počinju slovom a te da su vrijednosti kolone haljina iz 
#tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz 
#tablice muskarac silazno. (10)

select a.dukserica,f.asocijalno,e.hlace 
from svekar a
inner join sestra_svekar b on b.svekar = a.sifra 
inner join sestra c on c.sifra = b.sestra 
inner join zena d on d.sestra = c.sifra 
inner join muskarac e on e.zena =d.sifra 
inner join mladic f on f.muskarac = e.sifra 
where d.hlace like 'a%' and c.haljina like '%ba%'
order by e.hlace desc;