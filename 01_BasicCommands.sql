create database Abhijan; --Creates a database
use Abhijan; --used to access the database

--Creating a table called Student
create TABLE Student(stu_id int, name Varchar(10), grade Varchar(10), rollno int, address Varchar(10)); --No primary key created here for convinience 
--Inserting all values
INSERT INTO Student(stu_id, name, grade, rollno, address) 
VALUES (1,'Abhijan','A',1,'Mulpani');

--Inserting in specific columns only
INSERT INTO Student(stu_id, grade, rollno)
values
(2, 'A', 2);

INSERT INTO Student(name, grade, rollno) 
values
('Aswin', 'A', 3);

INSERT INTO Student(stu_id, name, rollno) 
values
(3, 'Akrit', 4);

INSERT INTO Student( name, stu_id, rollno) 
values
('Aayam', 4, 5);


--Trying to insert a name larger than the capacity of varchar(10) results in error
INSERT INTO Student(stu_id, name, grade, rollno, address) 
VALUES
(3, 'Harryissocoooolwowiewowie1234566789', 'F', 6, 'America');

--We can alter table using Alter command to change the capacity
ALTER TABLE Student
alter column name
varchar(100);

--No errors after increasing capacity
INSERT INTO Student(stu_id, name, grade, rollno, address) 
VALUES
(3, 'Harryissocoooolwowiewowie1234566789', 'F', 6, 'America');

--displaying everything inside the Student table
select * from Student;


--creating new table Subjects and inserting values
create TABLE Subjects(name varchar(10), subjectid varchar(10));
INSERT INTO Subjects(name, subjectid) --Adding 5 subjects with their ids
values
('Math', 1),
('Science',2),
('Physics',3),
('Chem',4),
('Neplai',5);

--Creating new table Courses and inserting same values as subjects
create TABLE Courses(name varchar(10), subjectid varchar(10))
Insert into Courses(name, subjectid) --adding same content as Subjects table
values
('Math', 1),
('Science',2),
('Physics',3),
('Chem',4),
('Neplai',5);

--displaying both tables
select * from Subjects;
select * from Courses;

--drop command deletes the table
drop table Subjects;
select * from Subjects; --this will show that the object subject doesn't exist

--trucate command will delete all the values inside the table
truncate table Courses;
select * from Courses; --will show an empty table without values
