USE CodeSchool
GO


--Q7: List all classes from highest scoring to lowest scoring.
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

SELECT track_number AS class, ROUND(AVG(average_score),2) as average_score
FROM students
INNER JOIN [average_score]
ON students.id = [average_score].student_id
GROUP BY track_number
ORDER BY average_score DESC
GO

DROP VIEW [average_score]
GO