USE CodeSchool
GO


--Q24: Are there any students with duplicate names?

SELECT name, COUNT(name) AS occurence
FROM students
GROUP BY name
HAVING COUNT(name) > 1
GO