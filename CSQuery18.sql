USE CodeSchool
GO


--Q18: Find the percentage of students per track passing all required test.
SELECT all_students.track_id,passed_students.student_num/all_students.student_num*100 AS passed_all_percentage
FROM (
    SELECT 1.0*COUNT(student_id) AS student_num, track_id
    FROM scores
    INNER JOIN students
    ON students.id = scores.student_id
    WHERE ISNULL(linux,10) >= 7
    AND ISNULL(python,10) >= 7
    AND ISNULL(databases,10) >= 7
    AND ISNULL(networking,10) >= 7
    AND ISNULL(security,10) >= 7
    AND ISNULL(java,10) >= 7
    AND ISNULL("version control",10) >= 7
    GROUP BY track_id
) AS passed_students
INNER JOIN (
    SELECT 1.0*COUNT(student_id) AS student_num, track_id
    FROM scores
    INNER JOIN students
    ON students.id = scores.student_id
    GROUP BY track_id
) AS all_students
ON all_students.track_id = passed_students.track_id
GO