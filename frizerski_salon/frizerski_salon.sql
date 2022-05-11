 # C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\frizerski_salon.sql

drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;

create table djelatnica(
    sifra int not null primary key auto_increment,
    oib char(11) not null,
    ime_prezime varchar(20) not null,
    godina_rodenja datetime,
    korisnik int 
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(20) not null,
    broj_telefona varchar(20),
    narucen datetime not null,
    popust varchar(50),
    usluga int 
);

create table usluga( 
    sifra int not null primary key auto_increment,
    sisanje varchar(30),
    bojanje varchar(30),
    frizura varchar(30),
    cijena decimal(18,2)
);


# definiranje vanjskih kljuceva

alter table djelatnica add foreign key (korisnik) references korisnik (sifra);
alter table korisnik  add foreign key (usluga) references usluga (sifra);


# unos podataka

insert into djelatnica (oib,ime_prezime)
values ('34567890123','Marija Klarić');

insert into korisnik (ime_prezime,narucen)
values ('Mia Marić','2022-05-11 18:40:00');