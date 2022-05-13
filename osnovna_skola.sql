# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\osnovna_skola.sql

drop database if exists osnovna_skola;
create database osnovna_skola;
use osnovna_skola;


create table osnovna_skola(
 sifra int not null primary key auto_increment,
 naziv varchar(30),
 adresa varchar(30),
 kontakt_tel varchar(40),
 razred varchar(30),
 djecja_radionica int,
 broj_ucitelja int

 );



create table djecja_radionica(
 sifra int not null primary key auto_increment,
 tema varchar(30),
 uciteljica int,
 termin datetime not null
 );

create table  radionica_dijete(
    sifra int not null primary key auto_increment,
    dijete int not null,
    djecja_radionica int not null
);


create table dijete(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(50) not null,
    datum_rodenja datetime not null,
    oib char(11),
    razred varchar(3)
);



create table uciteljica(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(40) not null,
    oib char(11) not null,
    adresa varchar(50),
    kontakt varchar(30)

);


# definiranje vanjskih kljuceva

alter table osnovna_skola add foreign key (djecja_radionica) references djecja_radionica(sifra);
alter table radionica_dijete add foreign key (dijete) references dijete(sifra);
alter table radionica_dijete add foreign key (djecja_radionica) references djecja_radionica(sifra);
alter table djecja_radionica add foreign key (uciteljica) references uciteljica(sifra); 