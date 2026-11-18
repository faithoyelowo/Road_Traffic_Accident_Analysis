CREATE DATABASE starm_accident_analysis;
USE starm_accident_analysis;


SELECT *
FROM accidents;

-- CHECKING FOR MISSING VALUES
SELECT *
FROM accidents
WHERE Age_band_of_driver IS NULL
OR Sex_of_driver IS NULL
OR Driving_experience IS NULL;


-- REMOVING DUPLICATE RECORDS
SELECT 
    Age_band_of_driver,
    Sex_of_driver,
    Driving_experience,
    Cause_of_accident,
    COUNT(*) AS duplicate_count
FROM accidents
GROUP BY 
    Age_band_of_driver,
    Sex_of_driver,
    Driving_experience,
    Cause_of_accident
HAVING COUNT(*) > 1;

/* -- FINDING EXACT DUPLICATE ROWS
SELECT
Age_band_of_driver,
Sex_of_driver,
Educational_level,
Vehicle_driver_relation,
Driving_experience,
Lanes_or_Medians,
Types_of_Junction,
Road_surface_type,
Light_conditions,
Weather_conditions,
Type_of_collision,
Vehicle_movement,
Pedestrian_movement,
Cause_of_accident,
Accident_severity,
COUNT(*) AS duplicate_count
FROM accidents
GROUP BY
Age_band_of_driver,
Sex_of_driver,
Educational_level,
Vehicle_driver_relation,
Driving_experience,
Lanes_or_Medians,
Types_of_Junction,
Road_surface_type,
Light_conditions,
Weather_conditions,
Type_of_collision,
Vehicle_movement,
Pedestrian_movement,
Cause_of_accident,
Accident_severity
HAVING COUNT(*) > 1; */

-- VERIFING UNIQUE VALUES
SELECT DISTINCT Sex_of_driver
FROM accidents;

SELECT DISTINCT Weather_conditions
FROM accidents;

SELECT DISTINCT Accident_severity
FROM accidents;

-- CREATING ANALYSIS QUERIES
SELECT
Age_band_of_driver,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Age_band_of_driver
ORDER BY Total_Accidents DESC;
-- 18-30(4271) HAS THE HIGHEST INVOLVEMENT

-- WHICH GENDER IS MORE LIKELY TO BE INVOLVED IN ACCIDENTS
SELECT
Sex_of_driver,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Sex_of_driver
ORDER BY Total_Accidents DESC;
-- MALE HAS THE HIGHEST (11437)

-- LEADING CAUSES OF TRAFFIC ACCIDENTS
SELECT
Cause_of_accident,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Cause_of_accident
ORDER BY Total_Accidents DESC;
-- (No distancing	2263) HAS THE HIGHEST

-- DO WEATHER CONDITIONS AFFECT ACCIDENT OCCURENCE
SELECT
Weather_conditions,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Weather_conditions
ORDER BY Total_Accidents DESC;
-- (Normal	10063)

-- DO LIGHTING CONDITIONS AFFECT ACCIDENT OCCURENCE
SELECT
Light_conditions,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Light_conditions
ORDER BY Total_Accidents DESC;
-- (Daylight	8798)

-- WHAT FACTOR CONTRIBUT MOST TO SEVERE ACCIDENTS
SELECT
Cause_of_accident,
Accident_severity,
COUNT(*) AS Total_Accidents
FROM accidents
GROUP BY Cause_of_accident, Accident_severity
ORDER BY Total_Accidents DESC;
-- (No distancing	2	1940)

















