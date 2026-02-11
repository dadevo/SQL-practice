USE CodeSchool
GO


--Q9: List the teachers, ranked by highest scoring classes to lowest scoring classes.
CREATE VIEW [average_score] AS
    SELECT student_id,AVG(score) AS average_score
    FROM (
        SELECT student_id, CONVERT(real,linux) AS score FROM scores
        UNION ALL SELECT student_id, python AS score FROM scores
        UNION ALL SELECT student_id, databases AS score FROM scores
        UNION ALL SELECT student_id, networking AS score FROM scores
        UNION ALL SELECT student_id, security AS score FROM scores
        UNION ALL SELECT student_id, java AS score FROM scores
        UNION ALL SELECT student_id, "version control" AS score FROM scores
    ) AS score_table
    GROUP BY student_id
GO

SELECT teachers.name,track_number AS class,ROUND(AVG(average_score),2) AS average_score
FROM [average_score]
INNER JOIN students
ON students.id = [average_score].student_id
INNER JOIN tracks
ON tracks.id = students.track_id
INNER JOIN teachers
ON teachers.id = tracks.teacher_id
GROUP BY teachers.name,track_number
ORDER BY average_score DESC
GO

DROP VIEW [average_score]
GO