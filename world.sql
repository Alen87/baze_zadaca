# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\world.sql

# database world vjezba inner join


select * from country;
select * from city;
select * from countrylanguage;



select a.IsOfficial ,b.SurfaceArea ,c.Name 
from countrylanguage a 
inner join country b on a.CountryCode = b.Code 
inner join city c  on b.Code = c.CountryCode 
where b.Region is not null
order by c.Population  desc;`


select a.IsOfficial ,b.Region 
from countrylanguage a
inner join country b on a.CountryCode = b.Code 
inner join city c on b.Code = c.CountryCode
where b.Name  is not null;


