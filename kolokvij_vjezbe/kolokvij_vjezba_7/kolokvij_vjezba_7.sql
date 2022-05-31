# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_7\kolokvij_vjezba_7.sql
# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_7;
create database kolokvij_vjezba_7;
use kolokvij_vjezba_7;


create table mladic(
    sifra int not null primary key auto_increment,
    prstena int,
    lipa decimal(14,5) not null,
    narukvica int not null,
    drugiputa datetime not null
);

create table zarucnik_mladic(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    mladic int not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(34),
    asocijalno bit not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    lipa decimal(14,6),
    introventno bit not null,
    kratkamajica varchar(38) not null,
    prstena int not null,
    zarucnik int 
); 

create table prijateljica(
    sifra int not null primary key auto_increment,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5), 
    ostavljen int
);

create table sestra(
    sifra int not null primary key auto_increment,
    bojakose varchar(34) not null,
    hlace varchar(36) not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int
);

create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introventno bit,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,9)
);

create table punica(
    sifra int not null primary key auto_increment,
    majica varchar(40),
    eura decimal(12,6) not null,
    prstena int,
    cura int not null
);


alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);
alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
alter table sestra add foreign key (prijateljica) references prijateljica(sifra);
alter table punica add foreign key (cura) references cura(sifra);


# 1. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3 retka. (7)

insert into prijateljica(sifra,haljina,gustoca,ogrlica,novcica,ostavljen)
values(null,null,23.56,null,null,null),
      (null,null,10.56,null,null,null),
      (null,null,20.56,null,null,null);
      
insert into ostavljen(sifra,lipa,introventno,kratkamajica,prstena,zarucnik)
values(null,null,1,'zelena',5,null),
      (null,null,1,'plava',4,null),
      (null,null,1,'crvena',2,null);

insert into zarucnik(sifra,vesta,asocijalno,modelnaocala,narukvica,novcica)
values(null,null,1,null,3,11.4),
      (null,null,1,null,4,10.4),
      (null,null,1,null,5,12.4);
      
insert into mladic(sifra,prstena,lipa,narukvica,drugiputa)
values(null,null,11.4,4,'2022-05-31'),
      (null,null,10.4,5,'2022-05-30'),
      (null,null,12.4,3,'2022-05-29');
      
insert into zarucnik_mladic(sifra,zarucnik,mladic)
values(null,2,2),
      (null,1,3),
      (null,1,1);

# 2. U tablici punica postavite svim zapisima kolonu eura na vrijednost 15,77. (4) 

insert into cura(sifra,lipa,introventno,modelnaocala,narukvica,treciputa,kuna)
values(null,78.34,null,null,null,null,null),
      (null,56.34,null,null,null,null,null),
      (null,45.34,null,null,null,null,null);


insert into punica(sifra,majica,eura,prstena,cura)
values(null,null,12.56,null,1),
      (null,null,10.56,null,2),
      (null,null,15.56,null,3);

update punica set eura = 15.77;     

# 3. U tablici sestra obrišite sve zapise čija je vrijednost kolone hlace manje od AB. (4)

insert into sestra(sifra,bojakose,hlace,lipa,stilfrizura,maraka,prijateljica)
values(null,'crvena','A',null,'kratko',20.54,null),
      (null,'plava','ABA',null,'kratko',21.54,null),
      (null,'crna','AB',null,'kratko',22.54,null);
     
delete from sestra where hlace < 'AB';     

# 4. Izlistajte kratkamajica iz tablice ostavljen uz uvjet da vrijednost kolone introvertno nepoznate. (6)  

select kratkamajica from ostavljen where introventno is null;

# 5. Prikažite narukvica iz tablice mladic, stilfrizura iz tablice sestra te 
# gustoca iz tablice prijateljica uz uvjet da su vrijednosti kolone 
# introvertno iz tablice ostavljen poznate te da su vrijednosti kolone 
# asocijalno iz tablice zarucnik poznate. Podatke posložite po gustoca iz 
# tablice prijateljica silazno. (10)

select a.narukvica ,f.stilfrizura ,e.gustoca 
from mladic a
inner join zarucnik_mladic b on b.mladic = a.sifra 
inner join zarucnik c on b.zarucnik = c.sifra 
inner join ostavljen d on d.zarucnik = c.sifra 
inner join prijateljica e on e.ostavljen = d.sifra 
inner join sestra f on f.prijateljica = e.sifra
where d.introventno is not null and c.asocijalno is not null 
order by e.gustoca desc ;

# 6. Prikažite kolone asocijalno i modelnaocala iz tablice zarucnik čiji se primarni ključ ne nalaze u tablici zarucnik_mladic. (5)

select a.asocijalno ,a.modelnaocala 
from zarucnik a
left join zarucnik_mladic b on b.zarucnik = a.sifra
where b.sifra is null;
    


          




