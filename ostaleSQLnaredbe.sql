# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\ostaleSQLnaredbe.sql
select * from products
order by productLine desc, productName  ;

select * from products
order by 3 desc, 2;

# https://mariadb.com/kb/en/aggregate-functions/
select sum(buyPrice),
min(buyPrice),
max(buyPrice),
avg(buyPrice),
count(buyPrice) 
from products
where productLine ='Vintage cars';

select productLine, sum(buyPrice),
min(buyPrice),max(buyPrice),
avg(buyPrice),count(buyPrice) 
from products
where productLine like '%i%'
group by productLine 
having avg(buyPrice)>47 
order by 5 desc
limit 1;


select distinct orderNumber from orderdetails
limit 1,7;

# Otvorite ured u Osijeku

# Postavite cijenu na 10 svim
# proizvodima koji u svom nazivu
# nemaju slovo i
update products 
set buyprice=10 
where productName not like '%i%';

# Izvucite ukupan broj proizvoda 
# koji imaju cijenu 10 
select sum(0.5) from products
where buyPrice =10;

# Unesite sebe kao glavnog šefa

# obrisati sve proizvode u kategoriji planes
delete from orderdetails where 
productCode in (
select productCode from products where 
productLine='planes'
);
delete from products where productLine ='planes';

# izlistajte sve jedinstvene nazive proizvoda 
# i njihove cijene koje su kupili
# kupci iz Las Vegasa

select distinct a.productName, a.buyPrice 
from products a inner join orderdetails b
on a.productCode =b.productCode 
inner join orders c on b.orderNumber =c.orderNumber 
inner join customers d on c.customerNumber =d.customerNumber 
where d.city ='Las Vegas' order by 1;

# Uvećaj sve cijene proizvoda prodane u 
# Las Vegasu za 10%

update products a inner join orderdetails b
on a.productCode =b.productCode 
inner join orders c on b.orderNumber =c.orderNumber 
inner join customers d on c.customerNumber =d.customerNumber 
set a.buyPrice =a.buyPrice * 1.1
where d.city ='Las Vegas';


# obrisati sve proizvode koje su kupili
# kupci koji dolaze iz Las Vegasa
create table zaobrisati
select distinct a.productCode  
from products a inner join orderdetails b
on a.productCode =b.productCode 
inner join orders c on b.orderNumber =c.orderNumber 
inner join customers d on c.customerNumber =d.customerNumber 
where d.city ='Las Vegas' order by 1;

select * from zaobrisati;
delete from orderdetails 
where productCode in (
select productCode from zaobrisati
);

delete from products  
where productCode in (
select productCode from zaobrisati
);

drop table zaobrisati;

# izlistajte sve zaposlenike kojima je šefica
# Diane Murphy
select * from employees where reportsTo =1002;

select b.firstName, b.lastName 
from employees a inner join employees b 
on a.employeeNumber =b.reportsTo 
where a.firstName ='Diane' and 
a.lastName ='Murphy';

# Ispišite imena i prezimena djelatnika 
# ureda u Tokyo

select b.firstName, b.lastName 
from offices a inner join employees b 
on a.officeCode  = b.officeCode 
where a.city ='Tokyo';

select employees.firstName, employees.lastName 
from offices inner join employees 
on offices.officeCode  = employees.officeCode 
where offices.city ='Tokyo';

select b.firstName, b.lastName 
from offices a, employees b
where a.officeCode = b.officeCode and 
a.city ='Tokyo';


# Tablici products dodati kolonu 
# aktivan logički tip podatka
alter table products add aktivan boolean;

select productname, 'Ana'  from products
union
select firstName, lastName  from employees;
