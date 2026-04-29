select * FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information;

--Rank and Dense rank
SELECT Department_Name,
       Therapy_Name,
       Therapy_Fees,
       RANK() OVER (PARTITION BY Department_Name ORDER BY Therapy_Fees DESC) AS FeeRank,
       DENSE_RANK() OVER (PARTITION BY Department_Name ORDER BY Therapy_Fees DESC) AS DenseFeeRank
FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information;

--Rank Number--
WITH RankedTherapies AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           RANK() OVER (PARTITION BY Department_Name ORDER BY Therapy_Fees DESC) AS FeeRank
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees
FROM RankedTherapies
WHERE FeeRank = 1;

 -- Row Number--
WITH RowNumbered AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           ROW_NUMBER() OVER (PARTITION BY Department_Name ORDER BY Therapy_Fees DESC) AS RowNum
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees
FROM RowNumbered
WHERE RowNum = 1;
 
--Top 3 Fees per Department (RANK and ROW_NUMBER)
-- Using RANK()
WITH RankedFees AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           RANK() OVER (
               PARTITION BY Department_Name 
               ORDER BY Therapy_Fees DESC
           ) AS FeeRank
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees, FeeRank
FROM RankedFees
WHERE FeeRank <= 3;

-- Top 3 Fees per Department Using (RANK and ROW_NUMBER) 
-- Use this functionality to fetch only 1st rank. Dont use this for the next highest rank retrival as it there wouldnot always be Rank 2 if multiple rows are present under rank 1.
-- Using RANK()
WITH RankedFees AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           RANK() OVER (
               PARTITION BY Department_Name 
               ORDER BY Therapy_Fees DESC
           ) AS FeeRank
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees, FeeRank
FROM RankedFees
WHERE FeeRank <= 3;


-- Using ROW_NUMBER()
WITH RowNumberFees AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           ROW_NUMBER() OVER (
               PARTITION BY Department_Name 
               ORDER BY Therapy_Fees DESC
           ) AS FeeRowNum
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees, FeeRowNum
FROM RowNumberFees
WHERE FeeRowNum <= 3;

-- Third Highest Fee per Department Using  Dense Rank.
-- Use this functionality if specific rank is required without any gaps though multiple rows are available for 1st and 2nd highest ranks.
WITH DenseRankedFees AS (
    SELECT Department_Name,
           Therapy_Name,
           Therapy_Fees,
           DENSE_RANK() OVER (
               PARTITION BY Department_Name 
               ORDER BY Therapy_Fees DESC
           ) AS DenseFeeRank
    FROM Employee_Treatment_Diagnosis.dbo.Therapy_Information
)
SELECT Department_Name, Therapy_Name, Therapy_Fees
FROM DenseRankedFees
WHERE DenseFeeRank = 3;


