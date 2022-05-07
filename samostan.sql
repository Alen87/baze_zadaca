# C:\xampp\mysql\bin>mysql -uroot < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\samostan.sql

drop database if exists samostan;
create database samostan;
use samostan;

create table svecenici(
    ime_prezime varchar(50),
    oib varchar(50),
    adresa varchar(50),
    velicina_odore varchar(50)
);

create table poslovi(
    mise varchar(50),
    ispovijedi varchar(50),
    svecenje_kuca varchar(50),
);

create table nadredeni_svecenik(
    ime_prezime varchar(50),
    oib varchar(50),
    mjesto_rodenja varchar(50),
    velicina_odore varchar(50)
);