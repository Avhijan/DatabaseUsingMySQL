
--creating four tables of contents
Create Table Employee(
eid int primary key, 
ename varchar(10), 
dateofemploy Date Default 
'2010-01-01',Salary int
);
select *from Employee; --This should show empty table with columns

Create Table booklist(
isbn int primary key, 
name varchar(10), 
publication varchar(10)
);
select *from booklist;


create Table bookid (
bid int primary key, 
bname varchar(10), 
author varchar(10), 
price int,
);
select *from bookid;

create Table issues
(
IID int primary key, 
name varchar(10), 
dateofissue int, 
);
select *from issues;


--altering bookid to set bid as a foreign key that points to isbn of booklist table
aLtEr TaBlE bookid Add
Foreign key (bid) References booklist(isbn);
select *from bookid;


--Adding constraint price so its always less than 5000
Alter table bookid
Add Constraint pk_check
check(price<5000);

Insert into bookid(bid, price) --Checking if the added constraint works
Values 
(1,5005); -- This should print error



--Altering table employee so name cannot be null
alter table employee
Alter Column ename varchar(20) not null;

Insert into Employee(eid,dateofemploy) --Checking if we can add content without name
Values
(1,'2077-12-8'); -- THis should print error




-- Inserting 4 random records in each relation
INSERT INTO Employee(eid,ename,salary) VALUES (1,'Ram',30000),(2,'Shyam',35000),(3,'Hari',28000),(4,'Kale',40000);
INSERT INTO Booklist(isbn,name,Publication) VALUES (101,'Quantum ','Einstein'),(102,'MunaMadan','Devokta ji'),(103,'1984','George'),(104,'AI Basics','Abhijan');
INSERT INTO BookId(bid,bname,author,price) VALUES (101,'DBMS','hari',4500),(102,'OS','Shyam',4800),(103,'CN','goru',3200),(104,'AI','Socrates',4900);
Insert Into issues(IID, name, dateofissue) values (1,'newtimes',2),(2,'oldtimes',4),(3,'hightimes',9),(4,'ancient',221)

select* from Employee --displaying all the records
select* from bookid
select* from booklist
select* from issues


  
select*
From bookid
where (2500 < price) AND (price <5000); --displaying contents of bookid where price is in between 2500 and 5000



select*
from booklist
where publication like 'A%';  --displays content of booklist where the name of publication starts with A


select*
from booklist
where publication like '%e'; --Displays content of booklist where publication ends with e


select*
from Employee
where ename like '_____'; -- Displays content of EMployee such that ename is equal to exactly 5 characters


select*
from Employee
where ename like 'R%' AND Salary<40000; --Displays from employee where ename starts with R and the salary is less than 40000


select isbn, name
from booklist
where isbn != 101; --Displays all isbn and name column from booklist except for the row where isbn = 101
