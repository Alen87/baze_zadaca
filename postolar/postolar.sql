# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\postolar\postolar.sql

drop database if exists postolar;
create database postolar;
use postolar;

create table obuca(
    sifra int not null primary key auto_increment,
    materijal varchar(30) not null,
    vrsta_obuce varchar(30) not null,
    velicina int,
    popravak int
);

create table korisnik(
    sifra int not null primary key auto_increment,  
    ime_prezime varchar(30) not null,
    datum_zaprimanja datetime not null,
    datum_popravka datetime,
    obuca int
    
);

create table popravak(
    sifra int not null primary key auto_increment,
    opis varchar(30) not null,
    utroseni_materijal varchar(50) not null,
    cijena_materijala decimal(18,2) not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    radni_odnos varchar(30),
    radna_odjeca varchar(10),
    popravak int
);

# definiranje  vanjskih  kljuceva
alter table obuca add foreign key (popravak) references popravak(sifra);
alter table korisnik add foreign key (obuca) references obuca(sifra);
alter table segrt add foreign key (popravak) references popravak(sifra);

# unos podataka

insert into korisnik (ime_prezime,datum_zaprimanja)
values ('Marko Matanić','2022-05-05');

insert into popravak (opis,utroseni_materijal,cijena_materijala)
values ('lijepljenje','potplat',80.00);