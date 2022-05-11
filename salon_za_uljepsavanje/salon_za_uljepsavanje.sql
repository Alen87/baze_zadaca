 # C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\salon_za_uljepsavanje.sql

drop database if exists salon_za_uljepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    adresa varchar(30),
    broj_telefona varchar(20) not null,
    korisnik int not null
);


create table korisnik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    telefonski_broj varchar(20),
    vrijeme_usluge datetime not null,
    usluga int 
);

create table usluga(
    sifra int not null primary key auto_increment,
    solarij varchar(10) ,
    trepavice varchar(30),
    frizura varchar(30)
);

# definiranje  vanjskih  kljuceva
alter table djelatnica add foreign key (korisnik) references korisnik (sifra);
alter table korisnik add foreign key (usluga) references usluga (sifra);

# unos podataka

insert into korisnik (ime_prezime,vrijeme_usluge)
values ('Ana Horvat','2022-05-09 15:00:00');

insert into djelatnica (ime_prezime,oib,broj_telefona,korisnik)
values ('Marija Marić', '63782959409', '091/654-31-33', 1);







