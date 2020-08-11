create database dbEX;
create table food (
	id 			char(5) 	primary key,
    name		varchar(30) NOT NULL,
    expiredate 	datetime,
    placeid		char(2),
    price		int	unsigned,
    catalog		varchar(20)
); -- 1
    
create table place (
	id		char(2)		primary key,
    name	varchar(20)
); -- 2

create table food1 like food; -- 3
alter table food1 add XX int; -- 4
alter table food1 modify xx char(5); -- 4
alter table food1 change xx YY char(10); -- 4
alter table food1 drop YY; -- 4
alter table food1 rename food2; -- 5
drop table food2; -- 6
DESC food1;