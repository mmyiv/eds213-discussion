# Exploring Crop Yield and Calendar in South East Asian Countries

### Author: Michelle Yiv

## Purpose

![](https://d20knvk822eu5a.cloudfront.net/s3fs-public-optimized/2024-01/Mekong_Biking%20Excursion_10_0.jpg.webp)

This repository showcases practice with SQL, DuckDB, and R for creating and managing databases, handling multiple datasets, and writing queries as part of UCSB's Bren School of Environmental Science Master of Data Science Program, EDS213 Databases and Data Management.

Datasets from the FAO and SAGE were combined to determine average crop yields (kg/ha), planting, and harvest dates for South East Asian Countries.

The documents in the repository show how to load and clean the data, add to a database, and develop the query to answer these questions.


## Repository structure

```         
eds213-section/
│
├── README.md                     
├── cleaning_viz.qmd   
├── discussion.sql
├── query_and_viz.qmd
├── environment_dependencies.txt
|
├── data/
│   ├── FAOSTAT_data_en_4-1-2025.csv
│   ├── crop_yields.csv
│   ├── calendar.csv
│   ├── yield.csv
```

#### For code reproducibility, run the files in this order: 

-   The first half of cleaning_viz.qmd

-   discussion.sql

-   The remaining code from cleaning_viz.qmd

-   Make sure to un-comment the relevant code

Data is housed in the repository in the data folder.

Dependencies and environment requirements are located in the environment_dependencies text file.

## References and Acknowledgements

-   Food and Agriculture Organization of the United Nations FAOSTAT. (n.d.). Crops and livestock products [Crops and livestock products](<https://www.fao.org/faostat/en/#data/QCL>. Access date: April 3, 2025.

-   Center for Sustainability and the Global Environment (SAGE). (2024, May 15). Crop Calendar Dataset \| Center for Sustainability and the Global Environment. Center for Sustainability and the Global Environment. <https://sage.nelson.wisc.edu/data-and-models/datasets/crop-calendar-dataset/>. Access date: April 3, 2025.

Class materials were created by the instructors of the Master in Environmental Data Science (MEDS) course [EDS213 Databases and Database Management](https://ucsb-library-research-data-services.github.io/bren-eds213/), [Julien Brun](https://github.com/brunj7) & [Greg Janée](https://github.com/gjanee)
