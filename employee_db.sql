CREATE TABLE employee  (
    Education VARCHAR(50),
    JoiningYear INT,
    City VARCHAR(50),
    PaymentTier INT,
    Age INT,
    Gender VARCHAR(10),
    EverBenched VARCHAR(10),
    ExperienceInCurrentDomain INT,
    LeaveOrNot INT
);
--1.Retrieve All Employee Records

select * from employee;

---2. Display Education and City of Employees
SELECT Education, City FROM employee_data;

--.3 Count Total Number of Employees
SELECT COUNT(*) AS TotalEmployees FROM employee_data;

--4. Find Unique Cities of Employees
SELECT DISTINCT City FROM employee_data;

--5 Get All Male Employees
SELECT * FROM employee_data
WHERE Gender = 'Male';

--6. Find Employees Older Than 30
SELECT * FROM employee_data
WHERE Age > 30;

-- 7 Calculate Average Age of Employees
SELECT AVG(Age) FROM employee_data;

--8Count Employees in Each City
SELECT City, COUNT(*) 
FROM employee_data
GROUP BY City;

--9 .Find Average Payment Tier by Category
SELECT PaymentTier, AVG(Age)
FROM employee_data
GROUP BY PaymentTier;

--10 . Sort Employees by Experience (Highest First)

SELECT * FROM employee_data
ORDER BY ExperienceInCurrentDomain DESC;

-- 11Count Employees by Education Level
SELECT Education, COUNT(*) 
FROM employee_data
GROUP BY Education
ORDER BY COUNT(*) DESC;

-- 12 Find Cities with High Average Payment Tier
SELECT City, AVG(PaymentTier)
FROM employee_data
GROUP BY City
HAVING AVG(PaymentTier) > 2;

-- 13 Get Employee(s) with Maximum Experience
SELECT * FROM employee_data
WHERE ExperienceInCurrentDomain = (
    SELECT MAX(ExperienceInCurrentDomain) FROM employee_data
);

-- 14 Count Employees by Gender
SELECT Gender, COUNT(*) 
FROM employee_data
GROUP BY Gender;

-- 15 Find Benched Employees in Highest Payment Tier
SELECT * FROM employee_data
WHERE EverBenched = 'Yes' AND PaymentTier = 3;

-- 16 Rank Employees Based on Age
SELECT *,
RANK() OVER (ORDER BY Age DESC) AS AgeRank
FROM employee_data;

-- 17Calculate Growth Score of Employees
SELECT *,
(ExperienceInCurrentDomain * PaymentTier) AS GrowthScore
FROM employee_data;

-- 18Compare Employees Who Left vs Stayed (City-wise)
SELECT City,
COUNT(*) FILTER (WHERE LeaveOrNot = 1) AS LeftEmployees,
COUNT(*) FILTER (WHERE LeaveOrNot = 0) AS StayedEmployees
FROM employee_data
GROUP BY City;

-- 19 Find Average Experience by Education

SELECT Education,
AVG(ExperienceInCurrentDomain) AS AvgExperience
FROM employee_data
GROUP BY Education;

-- 20 Find Employees Older Than Average Age
SELECT *
FROM employee_data
WHERE Age > (SELECT AVG(Age) FROM employee_data);