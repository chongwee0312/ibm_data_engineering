/* Question 1
Write and execute a SQL query to list the school names, community names and average attendance
for communities with a hardship index of 98.
*/
SELECT CPS.NAME_OF_SCHOOL, CPS.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM chicago_socioeconomic_data AS CSD
LEFT OUTER JOIN chicago_public_schools AS CPS
ON CSD.COMMUNITY_AREA_NUMBER = CPS.COMMUNITY_AREA_NUMBER
WHERE CSD.HARDSHIP_INDEX = '98';

/* Question 2
Write and execute a SQL query to list all crimes 
that took place at a school. Include case number, crime type and community name.
*/
SELECT CC.CASE_NUMBER, CC.PRIMARY_TYPE, CSD.COMMUNITY_AREA_NAME
FROM chicago_socioeconomic_data AS CSD
LEFT OUTER JOIN chicago_crime as CC
ON CSD.COMMUNITY_AREA_NUMBER = CC.COMMUNITY_AREA_NUMBER
WHERE CC.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

