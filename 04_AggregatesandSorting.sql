-- Lab-4: Advanced Queries, Aggregates, and Sorting

-- sorting the employee records in descending order by salary
SELECT *
FROM Employee
ORDER BY Salary DESC; -- used to sort salary from highest to lowest


-- sorting name and publication name in ascending order from booklist
SELECT name, publication
FROM booklist
ORDER BY name ASC, publication ASC; -- sorting both columns alphabetically


-- displaying top three records from teacher relation
-- Note: In SQL Server we use TOP 3, in MySQL we use LIMIT 3 at the end
SELECT TOP 3 * FROM teacher
ORDER BY name ASC; -- displaying first three teachers alphabetically


-- displaying sum of salaries of all employees
SELECT SUM(Salary) AS total_salary
FROM Employee; 


-- display minimum salary of employee 
SELECT MIN(Salary) AS min_salary
FROM Employee; -- finding the lowest salary 


-- displaying avg price of book written by same author
SELECT author, AVG(price) AS avg_price_per_author
FROM bookid
GROUP BY author; -- grouping by author to find their average book price


-- displaying publication name and number of books published by it
SELECT publication, COUNT(name) AS number_of_books
FROM booklist
GROUP BY publication; 


-- displaying the bid and bname of books whose price is greater than average prices
SELECT bid, bname, price
FROM bookid
WHERE price > (SELECT AVG(price) FROM bookid); 


--finding bid, bname and author where author name starts with 'S' 
SELECT bid, bname, author
FROM bookid
WHERE author LIKE 'S%'
ORDER BY author ASC;


--finding the reachers name and books with maximum salary
SELECT E.ename, B.bname
FROM Employee AS E
JOIN issues AS I ON E.eid = I.IID
JOIN bookid AS B ON I.IID = B.bid
WHERE E.Salary = (SELECT MAX(Salary) FROM Employee);


-- finding total books written my each author
SELECT author, COUNT(bid) AS number_of_books
FROM bookid
GROUP BY author
HAVING COUNT(bid) > 1; 
