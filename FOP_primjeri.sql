
# funkcije
select now();

select lower(ime) from osoba;

select upper(left(ime,1)) from osoba;

select email(ime,prezime) from osoba;

# očistiti još i '

# čitati https://mariadb.com/kb/en/built-in-functions/


select pow(2,3);

select sqrt(9);

select abs(1);

select adddate(now(), interval -45 day);


select datediff(now(),'1980-12-07')*24*60*80;

# Na trenutni dan ispisati koliko ste
# stari godine, mjeseci i dana
# primjer: 41 godina, 5 mjeseci i 6 dana



create table logiranje(
tko varchar(255),
sto varchar(255),
kada datetime default now()
);


select * from logiranje;

insert into osoba (ime,prezime,email) 
values ('Pero','Perić','email');

select sifra from osoba 
order by 1 desc limit 1;

update osoba set ime = 'Katarina' where sifra=15;

delete from osoba where sifra=15;

call brisismjer(1);

select * from smjer;
delete from smjer where sifra=1;