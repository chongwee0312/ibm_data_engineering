-- Create table DimDate
CREATE TABLE DimDate (
	dateid INTEGER NOT NULL PRIMARY KEY,
	date DATE NOT NULL,
	Year INTEGER,
	Quarter SMALLINT,
	QuarterName CHAR(2),
	Month SMALLINT,
	Monthname VARCHAR(20),
	Day SMALLINT,
	Weekday SMALLINT,
	WeekdayName VARCHAR(20)
);

-- Create table DimStation
CREATE TABLE DimStation (
	Stationid INTEGER NOT NULL PRIMARY KEY,
	City VARCHAR(30) NOT NULL
);

-- Create table DimTruck
CREATE TABLE DimTruck (
	Truckid INTEGER NOT NULL PRIMARY KEY,
	TruckType VARCHAR(30) NOT NULL
);

-- Create table FactTrips
CREATE TABLE FactTrips (
	Tripid INTEGER NOT NULL PRIMARY KEY,
	Dateid INTEGER NOT NULL,
	Stationid INTEGER NOT NULL,
	Truckid INTEGER NOT NULL,
	Wastecollected NUMERIC NOT NULL
);