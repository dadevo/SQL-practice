USE CodeSchool
GO


--Q35: Find the student(s) with the shortest last name and longest first name.

SELECT students.name, 
LEN(SUBSTRING(students.name, CHARINDEX(' ', students.name)+1, LEN(students.name))) AS last_name_length,
LEN(SUBSTRING(students.name, 0, CHARINDEX(' ', students.name))) AS first_name_length
FROM students
ORDER BY last_name_length, first_name_length DESC
GO