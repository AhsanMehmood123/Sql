create database college;
create database if not exists college;

drop database company;
drop database if exists company;

use college;

create table student(
id int primary key,
name varchar(50),
age int not null
);

insert into student values(1, "Ahsan", 24);
insert into student values(2, "Mehmood", 26);

select * from student;

show databases;

show tables;

drop table student;

create table student(
rollno int primary key,
name varchar(50)
);

select * from student;

insert into student 
(rollno, name)
values
(101, "ahsan"),
(102, "mehmood"),
(103, "laraib");

select * from student;

insert into student  values (104, "ahsan");


create table temp1(
id int unique
);

insert into temp1 values (101);
insert into temp1 values (101);

select * from temp1;

create table temp2(
id int,
name varchar(50),
city varchar(20),
age int,
primary key(id,name)
);

create table emp(
id int,
salary int default 25000
);

insert into emp (id) values  (101);

select * from emp;