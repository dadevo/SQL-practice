USE CodeSchool
GO


--Q34: Find the student(s) with the longest last name and shortest first name.

SELECT students.name, 
LEN(SUBSTRING(students.name, CHARINDEX(' ', students.name)+1, LEN(students.name))) AS last_name_length,
LEN(SUBSTRING(students.name, 0, CHARINDEX(' ', students.name))) AS first_name_length
FROM students
ORDER BY last_name_length DESC, first_name_length
GO