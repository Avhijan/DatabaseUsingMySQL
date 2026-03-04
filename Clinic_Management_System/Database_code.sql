-- creating DEPARTMENTS table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) NOT NULL
);

-- creating DOCTORS table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DocName VARCHAR(50) NOT NULL,
    DeptID INT,
    Specialization VARCHAR(50),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- crating PATIENTS table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatName VARCHAR(50) NOT NULL,
    Contact VARCHAR(15),
    Age INT
);

-- creating APPOINTMENTS table
CREATE TABLE Appointments (
    AppointID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointDate DATE,
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- creating BILLS table
CREATE TABLE Bills (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    AppointID INT,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (AppointID) REFERENCES Appointments(AppointID)
);
-- ----------------------------------------------------------------------------------------------------------
-- Inserting values in all the tables
INSERT INTO Departments (DeptName) 
VALUES 
('Cardiology'), 
('Neurology'), 
('Pediatrics'), 
('General Medicine'),
('UROLOGY'); -- This department will be empty to demonstrate right join

INSERT INTO Doctors (DocName, DeptID, Specialization) 
VALUES 
('Dr. Smith', 1, 'Heart Surgeon'),
('Dr. Adams', 2, 'Neurologist'),
('Dr. Brown', 3, 'Child Specialist'),
('Dr. Taylor', 4, 'GP'),
('Dr. Strange', 1, 'Magic Arts'); -- This doctor will have no appointment to demonstrate left join

INSERT INTO Patients (PatName, Contact, Age) 
VALUES 
('Alice Johnson', '555-0101', 29),
('Bob Miller', '555-0202', 45),
('Charlie Davis', '555-0303', 10),
('Diana Prince', '555-0404', 34),
('Edward Norton', '555-0505', 60);

INSERT INTO Appointments (PatientID, DoctorID, AppointDate, Status) 
VALUES 
(1, 1, '2026-03-01', 'Completed'),
(2, 2, '2026-03-02', 'Completed'),
(3, 3, '2026-03-03', 'Scheduled'),
(4, 4, '2026-03-04', 'Scheduled'),
(5, 1, '2026-03-05', 'Scheduled');

INSERT INTO Bills (AppointID, Amount, PaymentStatus) 
VALUES 
(1, 500.00, 'Paid'),
(2, 750.00, 'Paid'),
(3, 150.00, 'Pending'),
(4, 100.00, 'Pending'),
(5, 500.00, 'Pending');

-- ----------------------------------------------------------------------------------------------------------
-- displaying all the tables 
SELECT *  FROM Departments;
SELECT *  FROM Doctors;
SELECT *  FROM Patients;
SELECT *  FROM Appointments;
SELECT *  FROM Bills;
-- ----------------------------------------------------------------------------------------------------------
-- Inner Join
-- using Inner join to show patients, doctors and appointment date
SELECT A.AppointID, P.PatName, D.DocName, A.AppointDate
FROM Appointments A
INNER JOIN Patients P ON A.PatientID = P.PatientID
INNER JOIN Doctors D ON A.DoctorID = D.DoctorID; -- displays only matching values and no nulls

-- ------------------------------------------------------------------------

-- Left Join
-- Using left join to show all the doctors and the appointments they have
 
SELECT D.DocName, A.AppointID, A.AppointDate
FROM Doctors D
LEFT JOIN Appointments A ON D.DoctorID = A.DoctorID; -- displays doctors without any appointments too

-- ------------------------------------------------------------------------
-- Right Join
-- showing all the departemts including empty ones like Radiology
-- 
SELECT D.DocName, Dept.DeptName
FROM Doctors D
RIGHT JOIN Departments Dept ON D.DeptID = Dept.DeptID; -- displays empty departments too
-- ------------------------------------------------------------------------
-- Aggregate Functions
-- showing total amount using aggregate functions
SELECT PaymentStatus, SUM(Amount) AS TotalRevenue, COUNT(BillID) AS BillCount
FROM Bills
GROUP BY PaymentStatus;

-- ------------------------------------------------------------------------

-- Subquery
-- using subquery to find patients with more bill amount than the avergae 
SELECT PatName FROM Patients 
WHERE PatientID IN (
    SELECT PatientID FROM Appointments WHERE AppointID IN (
        SELECT AppointID FROM Bills WHERE Amount > (SELECT AVG(Amount) FROM Bills)
    )
);

-- ----------------------------------------------------------------------------------------------------------
-- Creating a veiw to show daily schedule of doctors
CREATE VIEW DailySchedule AS
SELECT A.AppointDate, P.PatName, D.DocName, A.Status
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;

-- displaying the view
SELECT * FROM DailySchedule; -- this shows the names of doctors, patients and the appointment status
-- ----------------------------------------------------------------------------------------------------------
-- Transactions 
-- Commit
SELECT * FROM Bills WHERE BillID = 3; -- displays billid-3

START TRANSACTION;-- starting transaction
UPDATE Bills SET PaymentStatus = 'Paid' WHERE BillID = 3; -- updating BILLID 3 to paid
COMMIT; -- Commiting changes

SELECT * FROM Bills WHERE BillID = 3; -- displaying the committed changs (shows paid)
-- ----------------------------------------------------------------------------------------------------------
-- Transactions
-- Rollback
SELECT * FROM Bills WHERE BillID = 5; -- displaying billid 5 before transaction 

START TRANSACTION; -- starting transaction
UPDATE Bills 
SET PaymentStatus = 'Paid' 
WHERE BillID = 5; -- updating bill as paid 

SELECT * FROM Bills  WHERE BillID = 5; -- displaying Bill no 5 (shows paid)

-- undoing the update using ROLLBACK (if any required conditions fail)
ROLLBACK; -- changes it back to pending

-- displaying Bills after the ROLLBACK 
SELECT * FROM Bills WHERE BillID = 5; -- displays pending
