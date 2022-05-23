

select naziv, smjer,predavac from grupa;

select a.naziv as grupa, 
b.naziv as smjer, d.ime, d.prezime
from grupa a inner join smjer b
on a.smjer=b.sifra
left join predavac c
on a.predavac = c.sifra
left join osoba d
on c.osoba = d.sifra

# Izlistajte sva imena i prezimena 
# polaznika na grupi JP26

# Zadatak: Sebe upišite u grupu PP25
select * from polaznik where osoba=6;
select * from osoba where ime='Ivana';
select * from grupa;
insert into clan(grupa,polaznik)
values (2,4);

# Izlistajte sva imena i prezimena 
# polaznika na grupi PP25

# Obrišite sebe iz grupe PP25

# Postavite sebi broj ugovora 12/2022


# baza knjižnica
# Izlistajte sve knjige s ljubavnom tematikom

select * from katalog where naslov like '%ljub%';

# na postojeće rezultate dovucite 
# naziv mjesta umjesto šifre

select a.naslov, b.naziv
from katalog a inner join mjesto b
on a.mjesto =b.sifra
where a.naslov like '%ljub%';

# Čitati: https://dev.to/azibom/sql-joins-29j4

# Izlistajte sve izdavače koji su 
# Društvo s ograničenom odgovornošću
select * from izdavac where naziv like '%d%o%o%';

# Unesite sebe kao autora

# Objavite knjigu (vašu omiljenu), 
# izdavač i mjesto po izboru

# Postavite sebi kao autoru datum rođenja na danas

# OVO VAM NISAM POKAZAO
# Tablici katalog dodajte kolonu cijena
# Svakoj knjizi postavite slučajnu vrijednost između
# 100 i 200


# izvucite sve nazive knjiga koje su izdali
# ne aktivni izdavači


# Izvucite sve autore koji nemaju 
# definiran datum rođenja
select * from autor where datumrodenja is null;

# Izvucite sve autore 
# koji nisu izdali niti jednu knjigu
select a.ime, a.prezime 
from autor a left join katalog b
on b.autor =a.sifra 
where b.naslov is null

# DZ: 
# 1. Učitati sve baze za vježbanje, vježbati 
#    select, insert, update i delete
# 2. U direktoriju DZ_mini_break imate dokumente koje
#    je potrebno pročitati, kreirati i učitati
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
