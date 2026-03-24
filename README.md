## Temperature and seasonal patterns at the Cary Institute: What's changing?

### Description
This project explores meteorological data; primarily average, minimum and maximum temperature data, collected by the Environmental Monitoring Program at Cary Institute.  Temperatures are rising and seasonal patterns are changing at the Cary Institute. Who cares?
- Property managers and operations crews, when planning work on trails, roads, bridges, buildings and other infrastructure
- Researchers, students, and visitors, when siting field locations and timing their work
- Educators and naturalists, who plan and coordinate outdoor programs
  
### Key Findings of this project
- Simple statistical extrapolation of 38 years of temperature data at Cary shows that temperatures are likely to rise ~.03°C per year
- Month-to-month differences in warming rate are suggestive but not statistically strong

### Data and Data Collection
Daily average, minimum, and maximum temperatures (° C), 1988-2025, collected at the Cary Institute weather station. These meteorological data are collected using a Campbell Scientific, Inc. datalogger (21X 1M 1987-14 September 1993, 21XL 14 September 1993- 12 October 1999, 23X 12 Oct. 1999-December 2011, CR3000 Dec. 2011-present). 

### Period
1 January 1988 - 31 December 2025

### Site
The meteorological and solar radiation instruments are located in a flat, open field in Millbrook, NY at an elevation of 128 m. GPS coordinates are N41.785823 W073.741447.

### Data frequency
Daily

### File Organization
- analysis/ scripts/ (3 R files)
- communications/ slide deck (1 PPTX file)
- metadata/ codebook and data processing notes (2 MD documents)
- outputs/ figures (6 PNG files)
- processed_data/ cleaned, derived files (6 CSV files)
- raw_data / original data files (2 CSV files)

### Requirements
R 4.5+
Packages: lubridate, tidyverse, and ggplot2 are the primary packages needed.  See each R script for install.packages() utility and loading instructions for dependencies.

### Contacts
Amy Schuler, schulera@caryinstitute.org

### License
[MIT License](https://opensource.org/license/MIT) for all code (R) scripts 
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) for data 

### Recommended citation for data download:
Kelly, Victoria (2025). Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025. Cary Institute. https://doi.org/10.25390/caryinstitute.11553219 

### Data Sharing Statement
The Cary Institute of Ecosystem Studies, Environmental Monitoring Program furnishes data under the following conditions: The data have received quality assurance scrutiny by our program, and, although we are confident of the accuracy of these data, Cary Institute will not be held liable for errors in these data. Data are subject to change resulting from updates in data screening or models used.

### Additional notes regarding data provenance:
Temperature data for the dates 22 September 2025 - 31 December 2025 are from the [NOAA Climate Reference Network Millbrook site](https://www.ncei.noaa.gov/pub/data/uscrn/products/daily01/2025/) (CRND0103-2025-NY_Millbrook_3_W) and were incorporated into the raw data file, cary_met_data_daily.csv. 
