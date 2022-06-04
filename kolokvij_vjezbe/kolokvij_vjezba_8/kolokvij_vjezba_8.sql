 # C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_8\kolokvij_vjezba_8.sql
 # 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_8;
create database kolokvij_vjezba_8;
use kolokvij_vjezba_8;


create table decko(
   sifra int not null primary key auto_increment,
   kuna decimal(12,10),
   lipa decimal(17,10),
   bojakose varchar(44),
   treciputa datetime not null,
   ogrlica int not null,
   ekstroventno bit not null 
);

create table muskarac_decko(
    sifra int not null primary key auto_increment,
    muskarac int not null,
    decko int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    haljina varchar(47),
    drugiputa datetime not null,
    treciputa datetime 
);

create table becar(
    sifra int not null primary key auto_increment,
    eura decimal(15,10) not null,
    treciputa datetime,
    prviputa datetime,
    muskarac int not null
);

create table neprijatelj(
   sifra int not null primary key auto_increment,
   kratkamajica varchar(44),
   introventno bit,
   indiferentno bit,
   ogrlica int not null,
   becar int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    introventno bit,
    novcica decimal(14,7) not null,
    treciputa datetime,
    neprijatelj int
);

create table cura(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno bit,
    ogrlica int not null,
    gustoca decimal(12,6),
    drugiputa datetime,
    vesta varchar(33),
    prijateljica int
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    vesta varchar(50),
    nausnica int not null,
    introventno bit not null
);


alter table muskarac_decko add foreign key (decko) references decko(sifra); 
alter table muskarac_decko add foreign key (muskarac) references muskarac(sifra);
alter table becar add foreign key (muskarac) references muskarac(sifra);
alter table neprijatelj add foreign key (becar) references becar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table cura add foreign key (prijateljica) references prijateljica(sifra);   

# 1. U tablice neprijatelj, becar i muskarac_decko unesite po 3 retka. 

INSERT INTO kolokvij_vjezba_8.decko
(kuna, lipa, bojakose, treciputa, ogrlica, ekstroventno)
values (NULL, NULL, NULL, '2022-06-03', 6, 0),
       (NULL, NULL, NULL, '2022-06-03', 7, 0),
       (NULL, NULL, NULL, '2022-06-03', 8, 0);
      
INSERT INTO kolokvij_vjezba_8.muskarac
(haljina, drugiputa, treciputa)
values (NULL, '2022-06-04', NULL),
       (NULL, '2022-06-02', NULL),
       (NULL, '2022-06-01', NULL);
      
INSERT INTO kolokvij_vjezba_8.muskarac_decko
(muskarac, decko)
VALUES(1, 2),
      (2, 1),
      (2, 3);
     
INSERT INTO kolokvij_vjezba_8.becar
(eura, treciputa, prviputa, muskarac)
VALUES(3.4, NULL, NULL, 1),
      (3.3, NULL, NULL, 2),
      (3.2, NULL, NULL, 3);
     
      
 INSERT INTO kolokvij_vjezba_8.neprijatelj
(kratkamajica, introventno, indiferentno, ogrlica, becar)
VALUES(NULL, NULL, NULL, 2, 1),
      (NULL, NULL, NULL, 9, 2),
      (NULL, NULL, NULL, 8, 3);

# 2. U tablici cura postavite svim zapisima kolonu indiferentno na vrijednost false. (4)

update cura set indiferentno = false;

# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone novcica različito od 12,75. (4)

INSERT INTO brat (introventno, novcica, treciputa, neprijatelj)
VALUES(NULL, 12.45, NULL, NULL),
      (NULL, 23.45, NULL, NULL),
      (NULL, 12.75, NULL, NULL);


delete from brat where novcica <> 12.75;

# 4. Izlistajte prviputa iz tablice becar uz uvjet da vrijednost kolone treciputa nepoznate. (6)

select prviputa from becar where treciputa is null;

# 5. Prikažite bojakose iz tablice decko, neprijatelj iz tablice brat te 
# introvertno iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
# treciputa iz tablice becar poznate te da su vrijednosti kolone 
# drugiputa iz tablice muskarac poznate. Podatke posložite po 
# introvertno iz tablice neprijatelj silazno. (10)

select  a.bojakose,f.neprijatelj,e.introventno  
from decko a
inner join muskarac_decko b on a.sifra = b.decko 
inner join muskarac c on b.muskarac = c.sifra 
inner join becar d on c.sifra = d.muskarac 
inner join neprijatelj e on d.sifra = e.becar 
inner join brat f on e.sifra = f.neprijatelj 
where d.treciputa is not null and c.drugiputa is not null 
order by e.introventno desc;

# 6. Prikažite kolone drugiputa i treciputa iz tablice muskarac čiji se primarni ključ ne nalaze u tablici muskarac_decko. (5)

select a.drugiputa,a.treciputa 
from muskarac a 
left join muskarac_decko b on a.sifra = b.muskarac
where b.sifra is null;





