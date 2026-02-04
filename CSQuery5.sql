USE CodeSchool
GO


--Q5: List the highest scoring students per track, per year.
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

SELECT id,name,track_id,track_number,score_table.average_score 
FROM [average_score] as score_table
INNER JOIN (
    SELECT students.track_id, track_number, MAX(average_score) AS max_score
    FROM [average_score] as max_table
    INNER JOIN students
    ON students.id = max_table.student_id
    LEFT JOIN (
        SELECT track_id, number
        FROM classes
    ) AS classes
    ON students.track_id = classes.track_id AND students.track_number = classes.number
    GROUP BY students.track_id,students.track_number
) as max
ON max.max_score = score_table.average_score
INNER JOIN (
    SELECT id,name
    FROM students
) AS students
ON students.id = score_table.student_id
ORDER BY track_id,track_number
GO

DROP VIEW [average_score]
GO