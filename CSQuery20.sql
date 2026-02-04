USE CodeSchool
GO


--Q20: List the average score for the python exams of 2022 per track (that offers this exam).
SELECT track_id, average_python_score
FROM (
    SELECT classes.track_id, AVG(1.0*python) AS average_python_score
    FROM scores
    INNER JOIN students
    ON students.id = scores.student_id
    INNER JOIN classes
    ON classes.track_id = students.track_id AND classes.number = students.track_number
    WHERE LEFT(end_date,4) = 2021
    GROUP BY classes.track_id
) AS track_data
WHERE average_python_score > 0
GO