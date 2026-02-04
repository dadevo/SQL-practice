USE CodeSchool
GO


--Q3: List the highest scoring student(s) per track.
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

SELECT id,name,students.track_id,score_table.average_score 
FROM [average_score] as score_table
INNER JOIN students
ON students.id = score_table.student_id
INNER JOIN (
    SELECT track_id, MAX(average_score) AS max_score
    FROM [average_score]
    INNER JOIN students
    ON students.id = [average_score].[student_id]
    GROUP BY track_id
) as max
ON max.track_id = students.track_id AND max.max_score = score_table.average_score
ORDER BY track_id
GO

DROP VIEW [average_score]
GO