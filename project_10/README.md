# Project Title
Querying data in NoSQL databases

# Scenario
You are a data engineer at a Data Analytics Consulting Company. Your company prides itself in being able to efficiently handle data in any format on any database on any platform. Analysts in the offices need to work with data on different databases, and with data in different formats. While they are good at analyzing data, they count on you to be able to move data from external sources into various databases, move data from one type of database to another, and be able to run basic queries on various databases.

# Objectives
- Replicate a Cloudant database
- Create indexes on a Cloudant database
- Query data in a Cloudant database
- Import data into a MongoDB database
- Query data in a MongoDB database
- Export data from MongoDB
- Import data into a Cassandra database
- Query data in a Cassandra database

# Tasks
- Replicate a remote database into your Cloudant instance
- Create an index for key "director", on the database movies using the HTTP API
- Write a query to find all movies directed by Richard Gage using the HTTP API
- Create an index for key "title", on the database movies using the HTTP API
- Write a query to list only the keys year and director for the movie `Top Dog` using the HTTP API
- Export the data from movies database into a file named movies.json
- Import movies.json into mongodb server into a database named entertainment and collection named movies
- Write a mongodb query to find the year in which most number of movies were released
- Write a mongodb query to find the count of movies released after the year 1999
- Write a query to find out the average votes for movies released in 2007
- Export the fields _id, title, year, rating and director from movies collection into a file named partial_data.csv
- Import partial_data.csv into cassandra server into a keyspace named entertainment and table named movies
- Write a cql query to count the number of rows in the movies table
- Create an index for the column rating in the movies table using cql
- Write a cql query to count the number of in the movies that are rated 'G'

# Tools / Software
- Cloudant
- MongoDB
- Cassandra
