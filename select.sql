select * from smjer;

# filtriranje kolona - select liste
# 1. * - sve kolone
# 2. nazivi kolina odvojeni zarezom
# 3. konstanta
# 4. izraz
select naziv,cijena from smjer;
select naziv,cijena,naziv from smjer;
select naziv, 'Osijek', 10 from smjer;
# zamjenska imena kolona
select naziv as smjer, 'Edunova' as skola from smjer;
select naziv, now() as vrijeme from smjer;

select *, naziv, 'Osijek' from smjer;


# filtriranje redova
select * from osoba where sifra=1;

# operatori where klauzule
# operatori uspoređivanja: = != (<>) > >= < <=
select * from osoba where sifra<=4;
# logički operatori: and or not (https://i.ytimg.com/vi/7dvqfpXEjdg/maxresdefault.jpg)
select * from osoba where sifra>3 and sifra<5;
select * from osoba where sifra=3 or sifra=5;
select * from osoba where not sifra=3;
# ostali operatori: like in between
select * from osoba where ime='Marko';
select * from osoba where ime like 'M%';
select * from osoba where ime like '%a';
select * from osoba where prezime like '%r%';

select * from osoba where sifra=2 or sifra=6 or sifra=9;
select * from osoba where sifra in (2,6,9);

select * from osoba where sifra>=5 and sifra<=7;
select * from osoba where sifra between 5 and 7;

# izlistajte datum početka i nazive grupa
select naziv,datumpocetka from grupa;


# izlistajte sva mjesta koja su u OBŽ
select  * from mjesto where zupanija=14;

# Unesite mjesto Boril u OBŽ
insert into mjesto (postanskibroj,zupanija,naziv)
values(32014,14,'Boril');
