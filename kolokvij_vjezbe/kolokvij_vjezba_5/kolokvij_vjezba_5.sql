# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_5\kolokvij_vjezba_5.sql
# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_5;
create database kolokvij_vjezba_5;
use kolokvij_vjezba_5;


create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47) not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null 
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int
);



alter table svekar_cura add foreign key (cura) references cura(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table punac add foreign key (svekar) references svekar(sifra);
alter table punica add foreign key (punac) references punac(sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

# 1. U tablice punica, punac i svekar_cura unesite po 3 retka. (7)

insert into cura(sifra,carape,maraka,asocijalno,vesta)
values(null,'bijele',23.45,null,'vunena'),
      (null,'crvene',12.45,null,'vunena'),
      (null,'crne',45.45,null,'vunena');
      
     
 insert into svekar(sifra,bojakose,majica,carape,haljina,narukvica,eura)
 values(null,null,null,'crne',null,null,34.12),
       (null,null,null,'bijele',null,null,34.67),
       (null,null,null,'crvene',null,null,32.12);
     
insert into svekar_cura (sifra,svekar,cura)
values(null,1,2),
      (null,2,3),
      (null,2,1);

insert into punac(sifra,dukserica,prviputa,majica,svekar)
values(null,null,'2022-05-30',null,2),
      (null,null,'2022-03-30',null,1),
      (null,null,'2022-04-30',null,3);

insert into punica(sifra,hlace,nausnica,ogrlica,vesta,modelnaocala,treciputa,punac)
values(null,'crne',4,null,'žuta','sunčane','2022-05-30',1),
      (null,'crne',5,null,'crna','sunčane','2022-05-30',2),
      (null,'crne',6,null,'žuta','sunčane','2022-05-30',3);

#  2. U tablici mladic postavite svim zapisima kolonu haljina na vrijednost Osijek. (4)

insert into mladic(sifra,kratkamajica,haljina,asocijalno,zarucnik)
values(null,'bijela','zelena',null,null),
      (null,'žuta','crvena',null,null),
      (null,'crna','bijela',null,null);
      
  update mladic set haljina = 'Osijek';   
             
# 3. U tablici ostavljena obrišite sve zapise čija je vrijednost kolone ogrlica jednako 17. (4)

insert into ostavljena(sifra,majica,ogrlica,carape,stilfrizura,punica)
values(null,null,4,null,null,1),
      (null,null,2,null,null,2),
      (null,null,17,null,null,3);


delete from ostavljena where ogrlica = 17;
     
# 4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone prviputa nepoznate. (6)

select majica from punac 
where prviputa is null;

# 5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te 
# nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz 
# tablice punac poznate te da su vrijednosti kolone majica iz tablice 
# svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice 
# punica silazno. (10)

select a.asocijalno ,f.stilfrizura ,e.nausnica 
from cura a
inner join svekar_cura b on b.cura = a.sifra 
inner join svekar c on b.svekar = c.sifra 
inner join punac d on d.svekar = c.sifra 
inner join punica e on e.punac = d.sifra 
inner join ostavljena f on f.punica = e.sifra
where d.prviputa is not null and c.majica like '%ba%'
order by e.nausnica desc;


# 6. Prikažite kolone majica i carape iz tablice svekar čiji se primarni ključ ne nalaze u tablici svekar_cura. (5)

select a.majica ,a.carape 
from svekar a
left join svekar_cura b on b.svekar = a.sifra 
where b.sifra is null;



