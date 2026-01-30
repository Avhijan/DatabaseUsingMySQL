USE Abhijan;

-- Create and Populate Student Table
CREATE TABLE student ( id INT PRIMARY KEY, name VARCHAR(20), RN INT,batch INT );

INSERT INTO student (id, name, RN, batch) 
VALUES 
(1, 'Alu', 01, 2080),
(2, 'talu', 02, 2080),
(3, 'lalu', 03, 2088),
(4, 'kalu', 04, 2087);

SELECT * 
FROM student; --displaying the student table


-- Create and Populate Teacher Table
CREATE TABLE teacher ( ID INT PRIMARY KEY, name VARCHAR(10), Faculty VARCHAR(20) );

INSERT INTO teacher (ID, name, Faculty) 
VALUES 
(1, 'Sailesh', 'Computer-engineering'),
(2, 'Isha', 'Computer-engineering'),
(3, 'PCR', 'Electronics'),
(4, 'Ukesh', 'AI');

SELECT * 
FROM teacher; --displaying teacher table
----------------------------------------------------
--data retrieval 

-- finding book details by publication name
SELECT * FROM booklist 
WHERE publication LIKE 'Abhijan';

-- Find teacher details based on employment date (using the tradional way)
SELECT T.name, T.Faculty
FROM employee AS E, teacher AS T
WHERE E.dateofemploy = '2010-01-01' AND T.ID = E.eid; --we use the second condition to avoid duplicates on the table thats created by cartession product

-- Find teacher details based on employment date (using the Join Keyword)
SELECT T.name, T.Faculty
FROM teacher AS T
INNER JOIN employee AS E ON T.ID = E.eid --we don't have to specify inner, sql defaults to inner if nothing is specified
WHERE E.dateofemploy = '2010-01-01';


-- finding employees with salary < 40000 in the 'AI' faculty
SELECT E.ename, T.Faculty
FROM employee AS E, teacher AS T
WHERE E.Salary < 40000 AND T.faculty = 'AI'; --this will produce cartession products too

-- using Join
SELECT E.ename, T.Faculty
FROM employee AS E
INNER JOIN teacher AS T ON E.eid = T.ID
WHERE E.Salary < 40000 
  AND T.faculty = 'AI';

-- finding teacher names and their issued book names where teacher name starts with 'S'
SELECT T.name, B.bname
FROM teacher AS T, bookid AS B
WHERE T.name LIKE 'S%'; 

--Using Join
SELECT T.name, B.bname
FROM teacher AS T, bookid AS B
WHERE T.ID = B.tid  
AND T.name LIKE 'S%';


-----------------------------------------------------------------
--updating the table

-- displaying the current salary and 10% increase of salary 
SELECT ename, Salary, 1.1 * Salary AS update_Salary
FROM Employee;

-- updating salary of all emplyees whose salary is less than 26000 with 20% increase
UPDATE Employee 
SET salary = salary * 1.20 
WHERE salary < 26000;

-- provide 5% increment to all salaries whose salary is greater than 20000 and 20% increment to rest of the salaries
UPDATE Employee
SET salary = CASE 
    WHEN salary > 20000 THEN salary * 1.05
    ELSE salary * 1.20
END;

-- deleting records with conditon 
SELECT * FROM Employee
DELETE FROM issues
WHERE IID = 6;
DELETE FROM Employee 
WHERE eid = 6;

----------------------------------------------------------------
--subqueries and aggregate functions
-- finding the name of the employee with the highest salary using subquery
SELECT e.ename
FROM employee AS e
WHERE salary = (
    SELECT MAX(salary) 
    FROM employee
);

--finding employee name whose faculty is "science"
SELECT ename 
FROM Employee 
WHERE eid IN (SELECT ID FROM Teacher WHERE faculty = 'Science');

--subquery to find books based on publication
SELECT bname, author 
FROM Book 
WHERE isbn IN (SELECT isbn FROM Booklist WHERE publication = 'Abhijan');


SELECT name, COUNT(bid) AS TotalBooksIssued
FROM issues
GROUP BY NAME;
