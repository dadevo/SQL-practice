USE CodeSchool
GO


--Q19: Find the average score for the python exams of 2021.
SELECT AVG(1.0*python) AS average_python_score
FROM scores
INNER JOIN students
ON students.id = scores.student_id
INNER JOIN classes
ON classes.track_id = students.track_id AND classes.number = students.track_number
WHERE LEFT(end_date,4) = 2021