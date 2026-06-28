-- ============================================================
-- Punjab Stubble Burning Analysis
-- SQL Business Queries
-- ============================================================


-- Q1. What is the total number of stubble burning incidents?

SELECT COUNT(*) AS Total_Incidents
FROM stubble_data;



-- Q2. How many stubble burning incidents were recorded each year?

SELECT
    Year,
    COUNT(*) AS Total_Incidents
FROM stubble_data
GROUP BY Year
ORDER BY Year;



-- Q3. Which are the top 10 districts with the highest number of stubble burning incidents?

SELECT
    District,
    COUNT(*) AS Total_Incidents
FROM stubble_data
GROUP BY District
ORDER BY Total_Incidents DESC
LIMIT 10;



-- Q4. Which districts have more than 10,000 stubble burning incidents?

SELECT
    District,
    COUNT(*) AS Total_Incidents
FROM stubble_data
GROUP BY District
HAVING COUNT(*) > 10000
ORDER BY Total_Incidents DESC;



-- Q5. What is the average, minimum, and maximum Fire Power recorded?

SELECT
    ROUND(AVG(`Fire Power(W/m2)`),2) AS Average_FirePower,
    MIN(`Fire Power(W/m2)`) AS Minimum_FirePower,
    MAX(`Fire Power(W/m2)`) AS Maximum_FirePower
FROM stubble_data;



-- Q6. Rank districts based on the total number of stubble burning incidents.

SELECT
    District,
    COUNT(*) AS Total_Incidents,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS District_Rank
FROM stubble_data
GROUP BY District;



-- Q7. Use a Common Table Expression (CTE) to identify districts with more than 10,000 incidents.

WITH DistrictFire AS
(
    SELECT
        District,
        COUNT(*) AS Total_Incidents
    FROM stubble_data
    GROUP BY District
)

SELECT *
FROM DistrictFire
WHERE Total_Incidents > 10000
ORDER BY Total_Incidents DESC;