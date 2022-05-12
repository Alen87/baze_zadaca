# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\taksi_sluzba.sql

drop database if exists taksi_sluzba;
create database taksi_sluzba;
use taksi_sluzba;

create table vozilo(
    sifra int not null primary key auto_increment,
    naziv_vozila varchar(30) not null,
    registracija varchar(30) not null,
    registracija_istice datetime,
    vozac int
);

create table vozac(
  sifra int not null primary key auto_increment,
  ime_prezime varchar(30) not null,
  oib char(11) not null,
  datum_lijecnicki datetime,
  mjesto_prebivalista varchar(30),
  putnik int
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    relacija varchar(50) not null,
    predeni_km varchar(50),
    voznja int
);

create table voznja(
    sifra int not null primary key auto_increment,
    nagradna_voznja boolean,
    popust varchar(50),
    trajanje int,
    cijena decimal(18,2) not null
);


alter table vozilo add foreign key (vozac) references vozac(sifra);
alter table vozac add foreign key (putnik) references putnik(sifra);
alter table putnik add foreign key (voznja) references voznja(sifra); 

insert into putnik (ime_prezime,relacija)
values ('Marko Horvat','Osijek - Petrijevci');

insert into vozac (ime_prezime,oib)
values ('Petar Perić','85947037589');

