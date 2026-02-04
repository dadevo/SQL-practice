USE CodeSchool
GO


--Q13: Looking at scores, find the easiest subject.
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

SELECT TOP 1 subject_name, ROUND(average_score,2) AS average_score
FROM (
    SELECT AVG(CONVERT(real,linux)) AS linux,
    AVG(CONVERT(real,python)) AS python,
    AVG(CONVERT(real,databases)) AS databases,
    AVG(CONVERT(real,networking)) AS networking,
    AVG(CONVERT(real,security)) AS security,
    AVG(CONVERT(real,java)) AS java,
    AVG(CONVERT(real,"version control")) AS version_control
    FROM scores
) AS scores
UNPIVOT (
    average_score
    FOR subject_name IN ([linux],[python],[databases],[networking],[security],[java],[version_control])
) AS test
ORDER BY average_score DESC
GO

DROP VIEW [average_score]
GO