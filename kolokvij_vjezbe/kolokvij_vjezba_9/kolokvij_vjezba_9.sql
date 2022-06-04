# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_9\kolokvij_vjezba_9.sql

# 0. Kreirajte tablice (16) i veze između tablica. (6)


drop database if exists kolokvij_vjezba_9;
create database kolokvij_vjezba_9;
use kolokvij_vjezba_9;

create table prijateljica(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    novcica decimal(16,7),
    kuna decimal(14,10) not null,
    drugiputa datetime,
    haljina varchar(45),
    kratkamajica varchar(49) 
);

create table punac_prijateljica(
    sifra int not null primary key auto_increment,
    punac int not null,
    prijateljica int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    modelnaocala varchar(30),
    kuna decimal(12,8),
    bojaociju varchar(33),
    suknja varchar(45)
);

create table cura(
    sifra int not null primary key auto_increment,
    vesta varchar(49) not null,
    ekstroventno bit,
    carape varchar(37),
    suknja varchar(37) not null,
    punac int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    novcica decimal(18,9) not null,
    ekstroventno bit,
    vesta varchar(32) not null,
    cura int
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    gustoca decimal(17,6),
    haljina varchar(40),
    kratkamajica varchar(48) not null,
    nausnica int not null,
    brat int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(34) not null,
    suknja varchar(32),
    eura decimal(18,7) not null,
    lipa decimal(15,7) not null,
    treciputa datetime not null,
    drugiputa datetime not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    prstena int not null,
    drugiputa datetime not null,
    haljina varchar(38) not null,
    ostavljena int 
);



alter table punac_prijateljica add foreign key (prijateljica) references prijateljica(sifra);
alter table punac_prijateljica add foreign key (punac) references punac(sifra);
alter table cura add foreign key (punac) references punac(sifra);
alter table brat add foreign key (cura) references cura(sifra);
alter table zarucnik add foreign key (brat) references brat(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

# 1. U tablice brat, cura i punac_prijateljica unesite po 3 retka. (7)

INSERT INTO prijateljica (treciputa, novcica, kuna, drugiputa, haljina, kratkamajica) 
VALUES(NULL, NULL, 12.4, NULL, NULL, NULL),
      (NULL, NULL, 12.5, NULL, NULL, NULL),
      (NULL, NULL, 12.65, NULL, NULL, NULL);

INSERT INTO punac (narukvica, modelnaocala, kuna, bojaociju, suknja) 
VALUES(5, NULL, NULL, NULL, NULL),
      (4, NULL, NULL, NULL, NULL),
      (5, NULL, NULL, NULL, NULL);

     
INSERT INTO punac_prijateljica (punac, prijateljica)
VALUES(1, 2),
      (2, 1),
      (2, 3);

INSERT INTO cura (vesta, ekstroventno, carape, suknja, punac)
VALUES('zelena', NULL, NULL, 'plava', 1),
      ('plava', NULL, NULL, 'crvena', 2),
      ('crvena', NULL, NULL, 'plava', 3);
     
INSERT INTO brat (novcica, ekstroventno, vesta, cura)
VALUES(12.4, NULL, 'zelena', NULL),
      (12.6, NULL, 'zelena', NULL),
      (12.7, NULL, 'zelena', NULL);
     
     
# 2. U tablici snasa postavite svim zapisima kolonu drugiputa na vrijednost 24. travnja 2020. (4)

update snasa set drugiputa ='2022-04-24';

# 3. U tablici zarucnik obrišite sve zapise čija je vrijednost kolone haljina jednako AB. (4)

delete from zarucnik where haljina = 'AB';

# 4. Izlistajte carape iz tablice cura uz uvjet da vrijednost kolone ekstroventno nepoznate. (6)

select carape from cura where ekstroventno is null;

# 5. Prikažite kuna iz tablice prijateljica, nausnica iz tablice zarucnik te 
# ekstroventno iz tablice brat uz uvjet da su vrijednosti kolone 
# ekstroventno iz tablice cura poznate te da su vrijednosti kolone 
# modelnaocala iz tablice punac sadrže niz znakova ba. Podatke 
# posložite po ekstroventno iz tablice brat silazno. (10)

select a.kuna ,f.nausnica ,e.ekstroventno 
from prijateljica a 
inner join punac_prijateljica b on a.sifra = b.prijateljica 
inner join punac c on b.punac = c.sifra 
inner join cura d on c.sifra = d.punac 
inner join brat e on d.sifra = e.cura 
inner join zarucnik f on e.sifra = f.brat 
where d.ekstroventno is not null and c.modelnaocala like '%ba%'
order by e.ekstroventno desc;

# 6. Prikažite kolone modelnaocala i kuna iz tablice punac čiji se primarni ključ ne nalaze u tablici punac_prijateljica. (5)

select a.modelnaocala ,a.kuna 
from punac a
left join punac_prijateljica b on a.sifra = b.punac 
where b.sifra is null;


