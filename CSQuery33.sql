USE CodeSchool
GO


--Q33: Rank age groups by their performance the linux exam, work with 'teens', 'twenties', 'thirties.
SELECT CASE
    WHEN LEFT(age, 1) = 1 then 'teens'
    WHEN LEFT(age, 1) = 2 then 'twenties'
    WHEN LEFT(age, 1) = 3 then 'thirties'
    WHEN LEFT(age, 1) = 4 then 'fourties'
END AS age, average_score
FROM (
    SELECT ROUND(2026-CAST(YEAR(students.birthday) AS int),-1) AS age, ROUND(AVG(CAST(scores.linux AS decimal(2,0))),2) AS average_score
    FROM students
    INNER JOIN scores
    ON scores.student_id = students.id
    GROUP BY ROUND(2026-CAST(YEAR(students.birthday) AS int),-1)
) AS decade_score
GO