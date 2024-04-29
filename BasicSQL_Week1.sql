create database mydb;
use mydb;
create table shoes
(
	ID char(10) PRIMARY KEY,
	Brand char(10) NOT NULL,
	TYPE char(10) NOT NULL,
	Color char(10) NOT NULL,
	price decimal(8,2) NOT NULL,
    Dsc VARCHAR(750) NULL
);


insert into shoes
values('123','Adidas','sneak','Red',10000.0,NULL);
insert into shoes
values('124','PUMA','Sandals','Red',8000.0,NULL);
/*

We can write this way Also.
insert into shoes(ID,Brand,TYPE,Color,Price,Dsc)
values('123','Adidas','sneak','Red',10000.0,NULL);

*/
#creating a temporary table:
drop table sandals;
create temporary table if not exists sandals AS(
select * from shoes
);

select * from sandals;

update sandals set color='Orange';

#Filtering 29/04/2024
#WHERE, BETWEEN and Concept of NULL

#Where Syntax: SELECT columns FROM tableName WHERE ,UPDATE and DELETE also used with WHERE
	select * from sandals where Brand='Adidas';

#IN syntax: Comma diliminated list of values. SELECT * FROM sandals WHERE ID IN(1,2,3,4,5) ,IN is Faster than OR
select * from sandals where Brand  IN('Adidas','Reebok');

# Wild Cards: LIKE(Only used for Text,String types), _, %,very usuful for Text  & String Data.
# _ will match only single charecter(Does not work with DB2).
# Takes longer to run other filtering techniqures.
# Need to be Careful
select * from sandals where Brand like '%did%';
select * from sandals where Brand like 'Ad_das';
select * from sandals where Brand like 'Ad_d%';

#SORTING USING: OrderBY: SELECT * FROM table Orderby Column
# It should be always last clause in select statement.
# DESC/ASC applies to column name directly it preceeds.

select * from sandals order by Brand DESC,ID;

#Mathematical Operations: +,-.x,/

select ID,(Select SUM(price) from sandals) AS total from sandals;

#Aggregate Functions:AVERAGE,MIN,MAX,COUNT,SUM,
SELECT avg(price) from sandals;
SELECT COUNT(Dsc) from sandals;

#DISTINCT: Retrieves Unique values in Column,DISTINCT on COUNT(*) is not applicable.
SELECT AVG(distinct price) from sandals;

#GroupBY: HAVING:: 


#Cross join: Syntax: select * from table1 cross join table2;

select * from shoes cross join sandals;

#Inner Join: Syntax: Select * from table1 inner join table2 on table.key=table2=key;
insert into shoes values (125, 'Nike', 'sports', 'White',19999.0,NULL);
select * from shoes right join sandals on shoes.Brand=sandals.Brand;

select * from shoes union 
select * from sandals;
