# C:\xampp\mysql\bin>mysql -uroot --default-character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\bela\bela.sql

drop database if exists bela;
create database bela;
use bela;

create table mjesanje(
    id int not null primary key auto_increment,
    vrsta varchar(40) not null,
    belot int not null,
    datumunosa datetime,
    stiglja int not null,
    bodovadrugiunos int,
    bodovaprviunos int,
    zvanjeprviunos int,
    bodovatreciunos int,
    zvanjetreciunos int,
    partija int not null
);

create table partija(
    id int not null primary key auto_increment,
    vrsta varchar(40) not null,
    dokolikoseigra int,
    lokacija int,
    unosi int
);

create table igrac(
    id int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    spol int not null,
    urlslika varchar(50)
);

create table partija_igrac(
    id int not null primary key auto_increment,
    partija int not null,
    igrac int not null
);

create table lokacija(
    id int not null primary key auto_increment,
    latitude int not null,
    longitude int not null,
    naziv varchar(40)
);


alter table partija_igrac add foreign key (partija)  references partija(id);
alter table partija_igrac add foreign key (igrac) references igrac(id);
alter table mjesanje add foreign key (partija) references partija(id);
alter table partija add foreign key (unosi) references igrac(id);
alter table partija add foreign key (lokacija) references lokacija(id);
