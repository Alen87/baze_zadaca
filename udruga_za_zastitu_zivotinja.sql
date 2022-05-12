# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\udruga_za_zastitu_zivotinja.sql

drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;

create table osoba(
    sifra int not null primary key auto_increment,
    oib char(11) not null,
    ime_prezime varchar(30) not null,
    adresa varchar(50),
    broj_telefona varchar(30),
    sticenik int 
);

create table sticenik(
    sifra int not null primary key auto_increment,
    vrsta  varchar(30) not null,
    godina_starosti int not null,
    podrijetlo varchar(50),
    prostor int
);

create table prostor(
sifra int not null primary key auto_increment,
vrsta_prostora varchar(30) not null,
oznaka varchar(10) not null,
godina_izgradnje int,
velicina_m2 int
);

alter table osoba add foreign key (sticenik) references sticenik(sifra);
alter table sticenik add foreign key (prostor) references prostor(sifra);

insert into sticenik (vrsta, godina_starosti)
values ('Majmun', 10);

insert into prostor (vrsta_prostora,oznaka)
values ('Željezni kavez', 'M-513');

