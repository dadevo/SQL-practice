USE CodeSchool
GO


--Q36: Find the student(s) with the shortest last name and longest first name in the data science track that failed at least 2 tests.

SELECT students.name,
LEN(SUBSTRING(students.name, CHARINDEX(' ', students.name)+1, LEN(students.name))) AS last_name_length,
LEN(SUBSTRING(students.name, 0, CHARINDEX(' ', students.name))) AS first_name_length
FROM students
INNER JOIN scores
ON scores.student_id = students.id
WHERE students.track_id = 'ds'
AND CASE WHEN ISNULL(linux,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL(python,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL(databases,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL(networking,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL(security,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL(java,10) < 7 THEN 1 ELSE 0 END
    + CASE WHEN ISNULL("version control",10) < 7 THEN 1 ELSE 0 END
    > 1
ORDER BY last_name_length, first_name_length DESC
GO