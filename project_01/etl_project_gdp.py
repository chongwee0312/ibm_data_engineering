#!/usr/bin/env python
# coding: utf-8


# Code for ETL operations on Country-GDP data

# Importing the required libraries
import requests
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np
import sqlite3
from datetime import datetime

# Define a function to extract the country GDP data from the wikipedia
def extract(url, table_attribs):
    ''' This function extracts the required
    information from the website and saves it to a dataframe. The
    function returns the dataframe for further processing. '''
    html_page = requests.get(url).text
    data = BeautifulSoup(html_page, 'html.parser')

    df = pd.DataFrame(columns=table_attribs)
    tables = data.find_all('tbody')
    rows = tables[2].find_all('tr')
    for row in rows:
        col = row.find_all('td')
        if len(col) != 0:
            if col[0].find('a') is not None and '—' not in col[2]:
                country_data = pd.DataFrame([{
                    'Country': col[0].a.text.strip(),
                    'GDP_USD_millions': col[2].text.strip()
                }])
                df = pd.concat([df, country_data], ignore_index=True)

    return df

# Define a function to convert the GDP from million USD to billion USD
def transform(df):
    ''' This function converts the GDP information from Currency
    format to float value, transforms the information of GDP from
    USD (Millions) to USD (Billions) rounding to 2 decimal places.
    The function returns the transformed dataframe.'''
    df['GDP_USD_millions'] = df['GDP_USD_millions'].apply(lambda x: float(''.join(x.split(','))))
    df['GDP_USD_millions'] = np.round(df['GDP_USD_millions'] / 1000, 2)
    df.rename(columns={'GDP_USD_millions': 'GDP_USD_billions'}, inplace=True)

    return df

# Define a function to save the table in csv format
def load_to_csv(df, csv_path):
    ''' This function saves the final dataframe as a `CSV` file 
    in the provided path. Function returns nothing.'''
    df.to_csv(csv_path)

# Define a function to load the table to the database
def load_to_db(df, sql_connection, table_name):
    ''' This function saves the final dataframe as a database table
    with the provided name. Function returns nothing.'''
    df.to_sql(table_name, sql_connection, if_exists='replace', index=False)

# Define a function to run the sql query and print the result
def run_query(query_statement, sql_connection):
    ''' This function runs the stated query on the database table and
    prints the output on the terminal. Function returns nothing. '''
    query_output = pd.read_sql(query_statement, sql_connection)
    print(query_statement)
    print(query_output)

# Define a function to show the progress log and append the log message to the log file
def log_progress(message):
    ''' This function logs the mentioned message at a given stage of the code execution to a log file. Function returns nothing'''
    # Timestamp format: Year-Monthname-Day-Hour:Minute:Second
    timestamp_format = '%Y-%h-%d-%H:%M:%S'

    # Get current timestamp
    now = datetime.now()
    timestamp = now.strftime(timestamp_format)

    # Append the log message to the log file
    with open(log_file, 'a') as f:
        f.write(f'{timestamp} : {message}\n')

# Initialsie the known entities
url = 'https://web.archive.org/web/20230902185326/https://en.wikipedia.org/wiki/List_of_countries_by_GDP_%28nominal%29'
table_name = 'Countries_by_GDP'
table_attribs = ['Country', 'GDP_USD_millions']
db_name = 'World_Economies.db'
csv_path = './Countries_by_GDP.csv'
log_file = 'log_file.txt'

log_progress('Preliminaries is complete. Initiating ETL process.')

# Extract process
df = extract(url, table_attribs)

log_progress('Data extraction is complete. Initiating Transformation process.')

# Transform process
df = transform(df)

log_progress('Data transformation is complete. Initiating loading process.')

# Load process
load_to_csv(df, csv_path)

log_progress('Data has been saved as a CSV file')

sql_connection = sqlite3.connect(db_name)

log_progress('SQL connection has been initiated')

load_to_db(df, sql_connection, table_name)

log_progress(f'Data has been loaded to the {db_name} Database as a table.')

# SQL query
query_statement = f'SELECT * from {table_name} WHERE GDP_USD_billions >= 100'
run_query(query_statement, sql_connection)

log_progress('Process is complete')

# Close the sql connection
sql_connection.close()

log_progress('Server Connection closed')