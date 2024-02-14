# Project Title
Extract Transform and Load GDP Data from Wikipedia

# Introduction
In this project, a complete ETL pipeline will be created to access data from a website and process it to meet the requirements.

# Scenario
Express Transport is an international firm that is looking to expand its business in different countries across the world. The company requests one of their data engineers to create an automated script that can extract the list of all countries in order of their GDPs in billion USDs (rounded to 2 decimal places), as logged by the International Monetary Fund (IMF). Since IMF releases this evaluation twice a year, this code will be used the the organisation to extract the information as it is updated.

The required data is available [here](https://web.archive.org/web/20230902185326/https://en.wikipedia.org/wiki/List_of_countries_by_GDP_%28nominal%29).

# Objective
Complete the following tasks:

1. Write a data extraction function to retrieve the relevant information from the required URL.
2. Transform the available GDP information into 'Billion USD' from 'Million USD'.
3. Load the transformed information to the required CSV file and as a database file.
4. Run the required query on the database.
5. Log the progress of the code with appropriate timestamps.
