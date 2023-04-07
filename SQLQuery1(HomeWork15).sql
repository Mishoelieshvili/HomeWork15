select * from [dbo].[Persons]
select * from [dbo].[Students]

--Students

--Task1
select * from Students WHERE Dob > '1990-12-31';

--Task2
select Lastname, Firstname, YEAR(dob) From Students 
Where Country IN ('Georgia', 'Libya');

--Task3
INSERT INTO students (Firstname, Lastname, dob, country, email)
VALUES ('Toko', 'Nesvidze', '2003-07-17', 'USA', 'toko.nes@gmail.com');

--Task4
SELECT TOP 5 Firstname, STUFF((SELECT ', ' + CAST(MiddleTest AS VARCHAR(MAX)) FROM students s2 WHERE s2.FinalTest = s1.FinalTest ORDER BY MiddleTest FOR XML PATH('')), 1, 2, '') AS MiddleTestScores
FROM students s1
ORDER BY FinalTest DESC;

--Task5
DELETE FROM students
OUTPUT DELETED.*
WHERE FinalTest = 19;

--Task6
UPDATE students
SET FinalTest = 0
WHERE MiddleTest = 1;

--Persons

--Task1
SELECT *
FROM persons
WHERE PrivateId LIKE '163%';

--Task2
SELECT *
FROM persons
WHERE LastName = City;

--Task3
SELECT *
FROM persons
WHERE Country IN ('Canada', 'Monaco');

--Task4
SELECT FirstName, LastName, PrivateId
FROM persons
WHERE Email IS NULL;

--Task5
SELECT *
FROM persons
WHERE (Country = 'Spain' OR Country = 'Turkey') AND Salary >= 1000 AND Salary <= 3000;

--Task6
SELECT *
FROM persons
WHERE WorkPlace LIKE '%LLC%' OR WorkPlace LIKE '%PC%' OR WorkPlace LIKE '%LLP%';

--Task7
UPDATE persons
SET Email = 
  CASE 
    WHEN LEN(Email) - LEN(REPLACE(Email, '.', '')) > 2 THEN 'more than 2 dots'
    ELSE 'less than 2 dots'
  END;

--Task8
SELECT *
FROM persons
WHERE PinCode LIKE '%51';

--Task9
SELECT country, AVG(salary) 
FROM Persons
GROUP BY country;




