create database query_ques;

use query_ques;

create table EmployeeInfo(
EmpID int primary key,
EmpFname varchar(50),
EmpLname varchar(50),
Department varchar(50),
Project varchar(50),
Address varchar(50),
DOB date,
Gender varchar(50)
);

insert into EmployeeInfo
(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB,Gender)
values
(1, "Sanjay", "Mehra", "HR", "P1", "Hyderabad(HYD)", '1976-12-01', "M"),
(2, "Ananya", "Mishra", "Admin", "P2", "Delhi(DEL)", '1968-05-02', "F"),
(3, "Rohan", "Diwan", "Account", "P3", "Mumbai(BOM)", '1980-01-01', "M"),
(4, "Sonia", "Kulkarni", "HR", "P1", "Hyderabad(HYD)", '1992-05-02', "F"),
(5, "Ankit", "Kapoor", "Admin", "P2", "Delhi(DEL)", '1994-07-03', "M");

drop table EmployeeInfo;

select * from EmployeeInfo;

create table EmployeePosition(
EmpID int,
EmpPosition varchar(50),
DateOfJoining date,
Salary int,
foreign key (EmpId) references EmployeeInfo(EmpID) on update cascade on delete cascade
);

insert into EmployeePosition
(EmpID, EmpPosition, DateOfJoining, Salary)
values
(1, "Manager", "2024-05-01", 500000),
(2, "Executive", "2024-05-02", 75000),
(3, "Manager", "2024-05-01", 90000),
(2, "Lead", "2024-05-02", 85000),
(1, "Executive", "2024-05-01", 300000);

drop table EmployeePosition;

select * from EmployeePosition;
/* Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName. */
select upper(EmpFname) as EmpName from EmployeeInfo;

/* Q2. Write a query to fetch the number of employees working in the department ‘HR’. */	
select count(EmpID) from EmployeeInfo where Department = 'HR'; 
SELECT COUNT(*) FROM EmployeeInfo WHERE Department = 'HR';

/* Q3. Write a query to get the current date. */
select sysdate();

/* Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table. */
/*For example, SUBSTRING(‘ABCDEF’, 2, 3) returns ‘BCD’;*/
select substring(EmpLname, 1, 4) from EmployeeInfo;

/*Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table. */
SELECT MID(Address, 1, LOCATE('(',Address)) FROM EmployeeInfo; /* LOCATE('(', Address) finds the position of the opening parenthesis '(' in the Address string.*/

alter table EmployeeInfo modify Address varchar(50);

/*Q6. Write a query to create a new table which consists of data and structure copied from the other table. */
CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;

/* Q7. Write q query to find all the employees whose salary is between 50000 to 100000. */
select salary from EmployeePosition where salary between 50000 and 100000;
SELECT * FROM EmployeePosition WHERE Salary BETWEEN '50000' AND '100000';

/* Q8. Write a query to find the names of employees that begin with ‘S’ */
select EmpFname from EmployeeInfo where EmpFname like 'S%';

/* Q9. Write a query to fetch top N records. */	
SELECT * FROM EmployeePosition ORDER BY Salary DESC LIMIT 4;

SELECT * FROM EmployeePosition;
SELECT Salary FROM EmployeePosition order by Salary desc;

/* find 3rd position value in a EmployeePosition table */
SELECT * FROM EmployeePosition ORDER BY Salary DESC LIMIT 1 OFFSET 2 ;

/* Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”.
The first name and the last name must be separated with space.*/
select concat(EmpFname, ' ', EmpLname) AS 'FullName' from EmployeeInfo;

/*Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 02/05/1970 and are grouped according to gender*/
select count(*), Gender from EmployeeInfo where DOB between '1970-05-02' and '1975-05-31' group	by Gender;
select * from EmployeeInfo;
SELECT COUNT(*), Gender FROM EmployeeInfo WHERE DOB BETWEEN '02/05/1970 ' AND '31/12/1975' GROUP BY Gender;

/* Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order. */
SELECT * FROM EmployeeInfo ORDER BY EmpFname desc, Department asc;

/* Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets. */
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';

/* Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table. */
SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');

/* Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.*/
SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';
SELECT * FROM EmployeeInfo WHERE Address = 'DELHI(DEL)';

/* Q16. Write a query to fetch all employees who also hold the managerial position. */

select * from EmployeeInfo as Ei inner join EmployeePosition as Ep on Ei.EmpID = Ep.EmpID and Ep.EmpPosition in ('Manager'); 

SELECT * 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');

SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');

SELECT * FROM EmployeeInfo;
/* Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order. */
SELECT Department, count(EmpID) 
FROM EmployeeInfo GROUP BY Department 
ORDER BY Department ASC;

SELECT Department, count(EmpID) AS EmpDeptCount 
FROM EmployeeInfo GROUP BY Department 
ORDER BY EmpDeptCount ASC;

select count(Department) from EmployeeInfo order by Department asc;

/* Q18. Write a query to calculate the even and odd records from a table. */
SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0;

SELECT
    SUM(CASE WHEN MOD(EmpID, 2) = 0 THEN 1 ELSE 0 END) AS even_count,
    SUM(CASE WHEN MOD(EmpID, 2) <> 0 THEN 1 ELSE 0 END) AS odd_count
FROM EmployeeInfo;

 