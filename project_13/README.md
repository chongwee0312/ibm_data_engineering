# Project Title
Creating a Machine Learning Pipeline to Predict Sound Level

# Scenario
You are a data engineer at a data analytics consulting company. Your company prides itself in being able to efficiently handle huge datasets. Data scientists in your office need to work with different algorithms and data in different formats. While they are good at Machine Learning, they count on you to be able do ETL jobs and build ML pipelines.

# Overview
In this project, you will create an end-to-end solution using machine learning pipelines for regression. Your objective is to clean the dataset, create a model that predicts the SoundLevel based on the other columns, evaluate its performance, and persist the model for future use.

This project has four parts, each building on the previous one. 

In part one, you will perform ETL activities, including loading the CSV dataset, removing duplicate rows, if any, dropping rows with null values, applying necessary transformations, and storing the cleaned data in the parquet format. 

Moving on to part two, you will create a machine learning pipeline with three stages, including a regression stage. This pipeline will be the backbone of your model development, enabling you to process the data and train a predictive model efficiently. 

Once you’ve trained the model, you will proceed to part three to evaluate its performance using relevant metrics. This step is crucial in understanding how well your model predicts SoundLevel and identifying areas for improvement. 

Finally, in part four, you will persist the model, allowing you to load and utilize it in real-world applications when predicting new data. As the final step, you will load and verify the stored model to ensure its integrity and usability in future tasks or deployments.

# Tools / Software
- PySpark
