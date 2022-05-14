# C:\xampp\mysql\bin>mysql -uroot --default-character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\fakultet\fakultet.sql

drop database if exists fakultet;
create database fakultet;
use fakultet;


create table student(
    sifra int not null primary key auto_increment,
    ime_prezime varchar(40) not null,
    oib char(11) not null,
    adresa varchar(50),
    smjer varchar(30) not null
);

create table rok(
    sifra  int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum datetime not null,
    br_studenata int,
    profesor varchar(40)
);


create table rok_student(
    sifra int not null primary key auto_increment,
    rok int not null,
    student int not null
);


alter table rok_student add foreign key (student) references student(sifra);
alter table rok_student add foreign key (rok) references rok(sifra);


insert into rok (naziv,datum)
values ('Psihologija', '2022-05-17');