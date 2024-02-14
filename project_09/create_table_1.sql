-- Create table MyDimDate
CREATE TABLE MyDimDate (
	dateid INTEGER NOT NULL PRIMARY KEY,
	date DATE NOT NULL,
	year INTEGER,
	quarter SMALLINT,
	quartername CHAR(2),
	month SMALLINT,
	monthname VARCHAR(20),
	day SMALLINT,
	weekday SMALLINT,
	weekdayname VARCHAR(20)
);

-- Create table MyDimWaste
CREATE TABLE MyDimWaste (
	wasteid INTEGER NOT NULL PRIMARY KEY,
	wastetype VARCHAR(30) NOT NULL
);

-- Create table MyDimZone
CREATE TABLE MyDimZone (
	zoneid INTEGER NOT NULL PRIMARY KEY,
	zonename VARCHAR(20) NOT NULL,
	city VARCHAR(30) NOT NULL
);

-- Create table MyFactTrips
CREATE TABLE MyFactTrips (
	tripid INTEGER NOT NULL PRIMARY KEY,
	wasteid INTEGER NOT NULL,
	zoneid INTEGER NOT NULL,
	wastetons NUMERIC NOT NULL
);