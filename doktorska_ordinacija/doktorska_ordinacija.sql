# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\doktorska_ordinacija.sql

drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;
use doktorska_ordinacija;


create table doktor(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(20) not null,
    oib char(11) not null,
    pacijent int not null,
    medicinska_sestra int not null
);

create table pacijent(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(20) not null,
    br_kartona varchar(15) not null,
    oib char(11) not null,
    dopunsko datetime,
    bolest varchar(30)
);

create table medicinska_sestra(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(20) not null,
    oib char(11) not null,
    dezurstvo varchar(10)
);

# definiranje vanjskih  kljuceva
alter table doktor add foreign key (pacijent) references pacijent (sifra);
alter table doktor add foreign key (medicinska_sestra) references medicinska_sestra (sifra);

# unos podataka
insert into pacijent (ime_prezime,br_kartona,oib)
values ('Pero Perić','386 - AK','09384756983');

insert into medicinska_sestra(ime_prezime,oib)
values ('Mirjana Marić','98475684573');