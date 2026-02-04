USE CodeSchool
GO


--Q12: Looking at scores, find the hardest subject.
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
) AS pivoted
ORDER BY average_score ASC
GO