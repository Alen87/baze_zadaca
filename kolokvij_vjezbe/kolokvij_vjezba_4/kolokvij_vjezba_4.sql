# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\kolokvij_vjezbe\kolokvij_vjezba_4\kolokvij_vjezba_4.sql
# 0. Kreirajte tablice (16) i veze između tablica. (6)

drop database if exists kolokvij_vjezba_4;
create database kolokvij_vjezba_4;
use kolokvij_vjezba_4;

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null

);

create table mladic(
     sifra int not null primary key auto_increment,
     kuna decimal(15,9),
     lipa decimal(18,5),
     nausnica int,
     stilfrizura varchar(49),
     vesta varchar(34) 
);

create table zena(
     sifra int not null primary key auto_increment,
     suknja varchar(39) not null,
     lipa decimal(18,7),
     prstena int not null
);

create table snasa(
     sifra int not null primary key auto_increment,
     introvertno bit,
     treciputa datetime,
     haljina varchar(44) not null,
     zena int not null
);

create table becar(
     sifra int not null primary key auto_increment,
     novcica decimal(14,8),
     kratkamajica varchar(48) not null,
     bojaociju varchar(36) not null,
     snasa int not null
);

create table prijatelj(
     sifra int not null primary key auto_increment,
     eura decimal(16,9),
     prstena int not null,
     gustoca decimal(16,5),
     jmbag char(11) not null,
     suknja varchar(47) not null,
     becar int not null
);

create table ostavljen(
     sifra int not null primary key auto_increment,
     modelnaocala varchar(43),
     introventno bit,
     kuna decimal(14,10)
);


create table punac(
     sifra int not null primary key auto_increment,
     treciputa datetime,
     majica varchar(46),
     jmbag char(11) not null,
     novcica decimal(18,7) not null,
     maraka decimal(12,6) not null,
     ostavljen int not null

);


alter table zena_mladic add foreign key (mladic) references mladic(sifra);
alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table snasa add foreign key (zena) references zena(sifra);
alter table becar add foreign key (snasa) references snasa(sifra);
alter table prijatelj add foreign key (becar) references becar(sifra);
alter table punac add foreign key (ostavljen) references ostavljen(sifra);


# 1. U tablice becar, snasa i zena_mladic unesite po 3 retka. (7)

insert into mladic(sifra,kuna,lipa,nausnica,stilfrizura,vesta)
values(null,null,null,null,null,'zelena'),
      (null,null,null,null,null,'plava'),
      (null,null,null,null,null,'crvena');
      
insert into zena(sifra,suknja,lipa,prstena)
values (null,'karirana',null,5),
       (null,'crvena',null,4),
       (null,'karirana',null,2);

insert into zena_mladic (sifra,zena,mladic)
values(null,2,3),
      (null,1,2), 
      (null,2,1);

insert into snasa(sifra,introvertno,treciputa,haljina,zena)
values(null,null,null,'ljubičasta',1),
      (null,null,null,'zelena',2),
      (null,null,null,'crvena',3);
      
insert into becar(sifra,novcica,kratkamajica,bojaociju,snasa)
values(null,null,'zelena','plava',1),
      (null,null,'crvena','zelene',2),
      (null,null,'plava','plava',3);


#  2. U tablici punac postavite svim zapisima kolonu majica na vrijednost Osijek. (4)  

insert into ostavljen(sifra,modelnaocala,introventno,kuna)
values(null,null,null,null),
      (null,null,null,null),
      (null,null,null,null);

insert into punac(sifra,treciputa,majica,jmbag,novcica,maraka,ostavljen)
values(null,null,null,'12345678909',34.56,78.98,1),
      (null,null,null,'87689587697',34.45,78.32,2),
      (null,null,null,'84763746936',34.67,78.34,3);

update punac set majica = 'Osijek';

# 3. U tablici prijatelj obrišite sve zapise čija je vrijednost kolone prstena veće od 17. (4)

insert into prijatelj(sifra,eura,prstena,gustoca,jmbag,suknja,becar)
values(null,null,4,null,'85764893094','zelena',1),
      (null,null,4,null,'86947839205','plava',2),
      (null,null,26,null,'09876543232','crvena',3);
      
     
delete from prijatelj where prstena > 17;     

# 4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone treciputa nepoznate. (6)

select haljina from snasa 
where treciputa is null;

# 5. Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
#kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
#treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
#tablice zena različite od 29. Podatke posložite po kratkamajica iz 
#tablice becar silazno. (10)

select a.nausnica ,f.jmbag ,e.kratkamajica 
from mladic a
inner join zena_mladic b on b.mladic = a.sifra 
inner join zena c on b.zena = c.sifra 
inner join snasa d on d.zena = c.sifra 
inner join becar e on e.snasa = d.sifra 
inner join prijatelj f on f.becar = e.sifra
where d.treciputa is not null and c.lipa <> 29
order by e.kratkamajica desc; 


# 6. Prikažite kolone lipa i prstena iz tablice zena čiji se primarni ključ ne nalaze u tablici zena_mladic. (5)

select a.lipa ,a.prstena 
from zena a
left join zena_mladic b on b.zena = a.sifra 
where b.sifra is null;



               
      

