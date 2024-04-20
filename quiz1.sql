create database if not exists companyxyz;

use companyxyz;

create table employee_info (
id int primary key,
name varchar(50),
salary int 
);

insert into employee_info
(id, name, salary)
values
(1 , "ahsan", 8000000),
(2, "mehmood", 900000),
(3, "laraib", 10000000);

select * from employee_info;