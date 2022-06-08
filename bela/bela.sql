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

INSERT INTO igrac (ime, prezime, spol, urlslika)
values ('Stjepan','Biljuš',0,null),
       ('Jasna','Aničić',1,null),
       ('Daria','Borić',1,null),
       ('Ivan','Gavrić',0,null),
       ('Josip','Domijan',0,null),
       ('Igor','Brstilo',0,null),
       ('Ivan','Vaci',0,null),
       ('Zoran','Varga',0,null),
      ('Ivana','Rupnik',1,null);

INSERT INTO lokacija (naziv,latitude,longitude)
values ('Bakar',45.307, 14.534),
('Beli Manastir',45.773, 18.611),
('Belišće',45.684, 18.402),
('Benkovac',44.030, 15.610),
('Biograd na Moru',43.937, 15.444),
('Bjelovar',45.910, 16.840),
('Buje',45.408, 13.659),
('Buzet',45.408, 13.965),
('Cres',44.961, 14.408),
('Crikvenica',45.172, 14.693),
('Čabar',45.594, 14.647),
('Čakovec',46.390, 16.420),
('Čazma',45.749, 16.613),
('Daruvar',45.593, 17.224),
('Delnice',45.400, 14.800),
('Donja Stubica',45.980, 15.973),
('Donji Miholjac',45.762, 18.165),
('Drniš',43.860, 16.156),
('Dubrovnik',42.651, 18.114),
('Duga Resa',45.445, 15.503),
('Dugo Selo',45.806, 16.238),
('Đakovo',45.310, 18.410),
('Đurđevac',46.040, 17.071),
('Garešnica',45.574, 16.941),
('Glina',45.338, 16.091),
('Gospić',44.540, 15.370),
('Grubišno Polje',45.702, 17.172),
('Hrvatska Kostajnica',45.228, 16.540),
('Hvar',43.154, 16.653),
('Ilok',45.222, 19.375),
('Imotski',43.450, 17.220),
('Ivanec',46.229, 16.127),
('Ivanić-Grad',45.707, 16.396),
('Jastrebarsko',45.672, 15.651),
('Karlovac',45.483, 15.550),
('Kastav',45.372, 14.350),
('Kaštela',43.550, 16.383),
('Klanjec',46.051, 15.744),
('Knin',44.040, 16.200),
('Komiža',43.044, 16.092),
('Koprivnica', 46.160, 16.830),
('Korčula',42.930, 16.889),
('Kraljevica', 45.275, 14.572),
('Krapina',46.160, 15.870),
('Križevci',46.020, 16.540),
('Krk',45.030, 14.580),
('Kutina',45.479, 16.776),
('Kutjevo',45.426, 17.883),
('Labin',45.092, 14.124),
('Lepoglava',46.207, 16.044),
('Lipik',45.414, 17.161),
('Ludbreg',46.253, 16.616),
('Makarska',43.293, 17.020),
('Mali Lošinj',44.533, 14.467),
('Metković',43.050, 17.630),
('Mursko Središće', 46.513, 16.439),
('Našice',45.495, 18.095),
('Nin',44.242, 15.184),
('Nova Gradiška',45.258, 17.384),
('Novalja',44.556, 14.885),
('Novi Marof',46.167, 16.335),
('Novi Vinodolski', 45.128, 14.790),
('Novigrad',45.316, 13.562),
('Novska',45.340, 16.979),
('Obrovac',44.201, 15.681),
('Ogulin',45.270, 15.230),
('Omiš',43.443, 16.693),
('Opatija',45.338, 14.305),
('Opuzen',43.017, 17.564),
('Orahovica',45.529, 17.880),
('Oroslavje',45.997, 15.916),
('Osijek',45.562, 18.700),
('Otok',45.146, 18.884),
('Otočac',44.870, 15.241),
('Ozalj',45.613, 15.478),
('Pag',44.440, 15.050),
('Pakrac',45.439, 17.192),
('Pazin',45.240, 13.940),
('Petrinja',45.440, 16.284),
('Pleternica',45.286, 17.802),
('Ploče',43.050, 17.430),
('Popovača',45.571, 16.627),
('Poreč',45.227, 13.595),
('Požega',45.330, 17.670),
('Pregrada',46.165, 15.751),
('Prelog',46.337, 16.615),
('Pula',44.864, 13.846),
('Rab',44.760, 14.770),
('Rijeka',45.327, 14.446),
('Rovinj',45.081, 13.639),
('Samobor',45.801, 15.711),
('Senj',44.990, 14.910),
('Sinj',43.700, 16.630),
('Sisak',45.480, 16.360),
('Skradin',43.818, 15.923),
('Slatina',45.700, 17.710),
('Slavonski Brod',45.160, 18.010),
('Slunj',45.110, 15.590),
('Solin',43.542, 16.492),
('Split',43.508, 16.444),
('Stari Grad',43.184, 16.599),
('Supetar',43.383, 16.556),
('Sveta Nedelja',45.797, 15.776),
('Sveti Ivan Zelina',45.960, 16.243),
('Šibenik',43.737, 15.893),
('Trilj',43.619, 16.724),
('Trogir',43.516, 16.250),
('Umag',45.437, 13.526),
('Valpovo',45.659, 18.415),
('Varaždin',46.308, 16.342),
('Varaždinske Toplice',46.210, 16.423),
('Velika Gorica',45.714, 16.075),
('Vinkovci',45.290, 18.800),
('Virovitica',45.840, 17.400),
('Vis',43.059, 16.195),
('Vodice',43.761, 15.779),
('Vodnjan',44.961, 13.853),
('Vrbovec',45.884, 16.417),
('Vrbovsko',45.370, 15.080),
('Vrgorac',43.204, 17.370),
('Vrlika',43.909, 16.400),
('Vukovar',45.350, 18.990),
('Zabok',46.026, 15.904),
('Zadar',44.114, 15.233),
('Zagreb',45.812, 15.981),
('Zaprešić',45.857, 15.805),
('Zlatar',46.092, 16.077),
('Županja',45.072, 18.694);

INSERT INTO partija (vrsta, dokolikoseigra, lokacija, unosi)
VALUES('501', 501, 7, 8),
      ('1001', 1001, 30, 2),
      ('1001', 1001, 13, 9);
      
INSERT INTO partija_igrac (partija, igrac)
VALUES(3, 2),
      (2, 1),
      (1, 3),
      (2, 4),
      (2, 6),
      (3, 9),
      (1, 6);

INSERT INTO mjesanje (vrsta, belot, datumunosa, stiglja, bodovadrugiunos, bodovaprviunos, zvanjeprviunos, bodovatreciunos, zvanjetreciunos, partija) 
VALUES('1001', 0, '2022-06-07', 0, NULL, NULL, NULL, NULL, NULL, 2),
      ('501', 0, '2022-06-08', 0, NULL, NULL, NULL, NULL, NULL, 1);

