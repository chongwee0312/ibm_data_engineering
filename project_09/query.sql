-- Create a grouping sets query using the columns
-- stationid, trucktype, total waste collected
SELECT stationid, trucktype, SUM(wastecollected) AS totalwastecollected
FROM facttrips AS ft
LEFT JOIN dimtruck AS dt
ON ft.truckid = dt.truckid
GROUP BY GROUPING SETS(stationid, trucktype);

-- Create a rollup query using the columns
-- year, city, stationid, and total waste collected
SELECT year, city, ft.stationid, SUM(wastecollected) AS totalwastecollected
FROM facttrips AS ft
LEFT JOIN dimdate AS dd
ON ft.dateid = dd.dateid
LEFT JOIN dimstation AS ds
ON ft.stationid = ds.stationid
GROUP BY ROLLUP(year, city, ft.stationid)
ORDER BY year, city, ft.stationid;

-- Create a cube query using the columns
-- year, city, stationid, and average waste collected
SELECT year, city, ft.stationid, AVG(wastecollected) AS avgwastecollected
FROM facttrips AS ft
LEFT JOIN dimdate AS dd
ON ft.dateid = dd.dateid
LEFT JOIN dimstation AS ds
ON ft.stationid = ds.stationid
GROUP BY CUBE(year, city, ft.stationid)
ORDER BY year, city, ft.stationid;

-- Create an MQT named max_waste_stats using the columns
-- city, stationid, trucktype, and max waste collected
CREATE MATERIALIZED VIEW max_waste_stats(city, stationid, trucktype, maxwastecollected) AS (
	SELECT city, ft.stationid, trucktype, max(wastecollected)
	FROM facttrips AS ft
	LEFT JOIN dimstation AS ds
	ON ft.stationid = ds.stationid
	LEFT JOIN dimtruck AS dt
	ON ft.truckid = dt.truckid
	GROUP BY city, ft.stationid, trucktype
);

REFRESH MATERIALIZED VIEW max_waste_stats;

SELECT * FROM max_waste_stats;