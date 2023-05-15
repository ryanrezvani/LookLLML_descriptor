# Overview

## Capstone Concept
- Looker contains the [Looker Data Dictionary](https://cloud.google.com/looker/docs/using-looker-data-dictionary) which is a powerful but often under-utilized tool, which "...provides a dedicated, centralized interface for searching through all Looker fields and descriptions"
- The idea of the capstone is to help automate the slow and time consuming process of writiing individual descriptions for the hundred to thousands of individual measures found within LookML files


## Technical Details:
- The underlying data is from the [NYC Citi Bike Trips Dataset](https://pantheon.corp.google.com/marketplace/details/city-of-new-york/nyc-citi-bike)
- The LookML is from the following public [repository](https://github.com/ryanrezvani/LookLLML_descriptor)
- The model was given the following context:
  - "Write a Python regex to grab all examples of the text between the word "measure:" and the closing "}" character and add a description: "
- ~15 examples were used to train the model

# **Outputs: Compare Before/After**

## Examples of descriptions added

### **Avg. Trip Duration**
![Avg Trip Duration](/Screenshots/average_duration.png)

### **Unique Bikes**
![unique_bikes](/Screenshots/unique_bikes.png)

### **Unique Bikes: Filtered**
![unique_bikes_last_7](/Screenshots/unique_bike_last_7.png)

### **Trip Duration per Bike**
![duration_per_bike](/Screenshots/duration_per_bike.png)

### **Count**
![count](/Screenshots/count.png)

## Output within the Data Dictionary

### **Count**
![dd](/Screenshots/data_dictionary.png)