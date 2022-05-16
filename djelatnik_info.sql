# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\djelatnik_info.sql

drop database if exists djelatnik_info;
create database djelatnik_info;
use djelatnik_info;


create table djelatnik(
  sifra int not null primary key auto_increment,
  ime_prezime varchar(50) not null,
  oib char(11) not null,
  kontakt varchar(30) not null,
  email varchar(30),
  poslovni_email varchar(30),
  pocetak_rada datetime,
  loyality_kartica char(13) not null,
  cip_zaprimljen boolean,
  radna_odjeca_obuca int not null,
  mobitel int,
  edukacija int,
  sanitarna_iskaznica int not null,
  higijenski_minimum int,
  lijecnicki_pregled int not null,
  ugovor int not null,
  opasne_kiseline datetime,
  zavrseno_zanimanje varchar(50)
);

create table radna_odjeca_obuca(
    sifra int not null primary key auto_increment,
    prvo_zaprimanje datetime not null,
    pravo_na_slijedece_zaprimanje datetime not null,
    majica_kratka_vel_kom varchar(50),
    majica_duga_vel_kom varchar(50),
    duksa_vel_kom varchar(50),
    papuce_br char(2),
    hlace_bijele_m_vel char(2),
    hlace_bijele_z_vel char(2),
    hlace_zimske_vel char(2),
    prsluk_vel varchar(5)
);

create table mobitel(
    sifra int not null primary key auto_increment,
    naziv varchar(40) not null,
    broj varchar(50) not null,
    datum_zaprimanja datetime not null,
    pravo_na_slijedeci datetime,
    serijski_broj varchar(50),
    ugovor_potpisan boolean
);

create table edukacija(
    sifra int not null primary key auto_increment,   
    datum datetime not null,
    voditelj_edukacije varchar(30) not null,
    trajanje_edukacije varchar(20),
    potpis_djelatnika boolean
);

create table sanitarna_iskaznica(
    sifra int not null primary key auto_increment,  
    broj_iskaznice varchar(30),
    datum_obavljenog_pregleda datetime,
    vrijedi_do datetime,
    cijena decimal(18,2),
    placanje varchar(50)
);

create table higijenski_minimum(
    sifra int not null primary key auto_increment,  
    datum_polaganja datetime,
    vrijedi_do datetime,
    cijena decimal(18,2)  
);

create table lijecnicki_pregled(
    sifra int not null primary key auto_increment,  
    ustanova varchar(50) not null,
    doktor varchar(40) not null,
    datum datetime not null,
    vrijedi_do datetime not null,
    cijena decimal(18,2)
);


create table ugovor(
    sifra int not null primary key auto_increment,
    opis_radnog_mjesta varchar(50) not null,
    br_ugovora varchar(30) not null,
    nocni_rad varchar(50),
    datum_potpisivanja datetime,
    vrijedi_do datetime,
    za_stalno boolean,
    ovjerio varchar(40),
    prekid datetime
    
    );

    #definiranje vanjskih  kljuceva

    alter table djelatnik add foreign key (radna_odjeca_obuca) references radna_odjeca_obuca(sifra);
    alter table djelatnik add foreign key (mobitel) references mobitel(sifra);
    alter table djelatnik add foreign key (edukacija) references edukacija(sifra);
    alter table djelatnik add foreign key (sanitarna_iskaznica) references sanitarna_iskaznica(sifra);
    alter table djelatnik add foreign key (higijenski_minimum) references higijenski_minimum(sifra);
    alter table djelatnik add foreign key (lijecnicki_pregled) references lijecnicki_pregled(sifra);
    alter table djelatnik add foreign key (ugovor) references ugovor(sifra); 