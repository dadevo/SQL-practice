USE CodeSchool
GO


--Q17: Find the percentage of students passing all required test.
SELECT ( 100 * (
    SELECT 1.0*COUNT(student_id)
    FROM scores
    WHERE ISNULL(linux,10) >= 7
    AND ISNULL(python,10) >= 7
    AND ISNULL(databases,10) >= 7
    AND ISNULL(networking,10) >= 7
    AND ISNULL(security,10) >= 7
    AND ISNULL(java,10) >= 7
    AND ISNULL("version control",10) >= 7
    ) / (
    SELECT 1.0*COUNT(student_id)
    FROM scores
    )
) AS passed_percentage
GO