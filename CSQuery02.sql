USE CodeSchool
GO

--Q2: Find the student with the highest average score. (don't bother compensating for different numbers of subjects)
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

SELECT name,average_score
FROM [average_score]
INNER JOIN students
ON students.id = [average_score].student_id
WHERE average_score = (
    SELECT TOP 1 average_score
    FROM [average_score]
    ORDER BY average_score DESC
)
ORDER BY id
GO

DROP VIEW [average_score]
GO