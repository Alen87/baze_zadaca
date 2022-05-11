# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\muzej\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table izlozba(
 sifra int not null primary key auto_increment, 
 naziv_muzeja varchar(20) not null,
 tema_izlozbe varchar(30) not null,
 datum_otvaranja datetime not null,
 sponzor int,
 djelo int 
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    autor varchar(30) not null,
    djelo_nastalo varchar(30)
);

create table kustos(
    sifra int not null primary key auto_increment,
    izlozba int,
    ime_prezime varchar(30) not null,
    oib char(11) not null,
    datum_rodenja datetime
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    adresa varchar(50),
    uplata decimal(18,3) not null
);

# definiranje vanjskih  kljuceva
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table izlozba add foreign key (djelo) references djelo(sifra);

alter table kustos add foreign key (izlozba) references izlozba(sifra);

# unos podataka
insert into izlozba (naziv_muzeja,tema_izlozbe,datum_otvaranja)
values ('Mimara','Ispod površine','2022-04-25');

insert into kustos (ime_prezime,oib)
values ('Marko Lopac','45637829074');

