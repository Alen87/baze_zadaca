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


insert into cura(sifra,haljina,drugiputa,suknja,narukvica,introventno,majica,decko)
values(null,'zelena','2022-05-27',null,null,null,'plava',null),
      (null,'plava','2022-05-26',null,null,null,'crvena',null), 
      (null,'crvena','2022-05-25',null,null,null,'zelena',null);

insert into  zarucnica(sifra,narukvica,bojakose,novcica,lipa,indiferentno)
values(null,null,'plava',null,12.50,1),
      (null,null,'crna',null,12.50,1),
      (null,null,'zelena',null,12.50,1);

insert into decko(sifra,introventno,vesta,asocijalno)
values(null,null,null,1),
      (null,null,null,1),
      (null,null,null,1);

insert into decko_zarucnica(sifra,decko,zarucnica)
values(null,1,3),
      (null,2,1),
      (null,2,2);


# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020. (4)
insert into prijatelj(sifra,modelnaocala,treciputa,ekstroventno,prviputa,svekar)
values(null,null,'2022-05-17',1,null,null),
      (null,null,'2022-05-15',1,null,null),
      (null,null,'2022-05-13',1,null,null);
      
     
update prijatelj set treciputa='2020-04-30';      


# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14. (4)
insert into brat(sifra,suknja,ogrlica,asocijalno,neprijatelj)
values(null,null,12,1,1),
      (null,null,15,1,2),
      (null,null,14,1,3);

delete from brat where ogrlica <>14; 

# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone drugiputa nepoznate. (6)

select suknja from cura 
where drugiputa is null;

# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
#haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
#drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz 
#tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
#tablice neprijatelj silazno. (10

select a.novcica,f.neprijatelj ,e.haljina 
from zarucnica a
inner join decko_zarucnica b on b.zarucnica = a. sifra 
inner join decko c on b.decko = c.sifra 
inner join cura d on d.decko = c.sifra
inner join neprijatelj e on e.cura = d.sifra
inner join brat f on f.neprijatelj = e.sifra 
where d.drugiputa is not null and c.vesta like '%ba%'
order by e.haljina desc; 


#6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni ključ ne nalaze u tablici decko_zarucnica. (5

select a.vesta ,a.asocijalno 
from decko a
left join decko_zarucnica b on b.decko = a.sifra
where b.sifra is null;




      
     
      