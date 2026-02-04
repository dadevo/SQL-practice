USE CodeSchool
GO

--Q1: Find the student(s) with the longest name(s).
SELECT id,name FROM students 
WHERE LEN(name) = (SELECT TOP 1 LEN(name) FROM students ORDER BY LEN(name) DESC);
GO