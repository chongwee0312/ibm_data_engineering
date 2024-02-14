# Project Title
Building a Machine Learning Pipeline for Airfoil Noise Prediction

# Scenario
You are a data engineer at an aeronautics consulting company. Your company prides itself in being able to efficiently design airfoils for use in planes and sports cars. Data scientists in your office need to work with different algorithms and data in different formats. While they are good at Machine Learning, they count on you to be able to do ETL jobs and build ML pipelines. In this project you will use the modified version of the NASA Airfoil Self Noise dataset. You will clean this dataset, by dropping the duplicate rows, and removing the rows with null values. You will create an ML pipeline to create a model that will predict the SoundLevel based on all the other columns. You will evaluate the model and towards the end you will persist the model.

# Contents
1. Perform ETL activity
    - Load the CSV File into A Dataframe
    - Duplicates
    - Missing Values
    - Transformation
    - Save the Cleaned Dataset
    - Part 1 Evaluation
2. Create a  Machine Learning Pipeline
    - Load the Dataset from the Saved File
    - Define the Pipeline Stages
    - Build the pipeline
    - Train/Test Split
    - Model Training
    - Part 2 Evaluation
3. Evaluate the Model
    - Prediction
    - Evaluation of the Model
    - Part 3 Evaluation
4. Persist the Model
    - Save the Model
    - Load the Model
    - Make predictions with the Loaded Model on the Testdata
    - Compare the Predictions from the Loaded Model and the Original Model
    - Part 4 Evaluation

# Tools / Software
- Pyspark
