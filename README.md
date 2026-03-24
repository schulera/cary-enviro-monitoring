## Temperature and seasonal patterns at the Cary Institute: What's changing?

### Description
This project analyzes meteorological data, primarily average, minimum and maximum temperature data, collected by the Environmental Monitoring Program at Cary Institute.

### Data Collection
Meteorological and solar radiation data are collected using a Campbell Scientific, Inc. datalogger (21X 1M 1987-14 September 1993, 21XL 14 September 1993- 12 October 1999, 23X 12 Oct. 1999-December 2011, CR3000 Dec. 2011-present). January 2024 – December 2025 temperature data from US CRN Millbrook site.

### Period
1 January 1988 - 31 December 2025

### Site
The meteorological and solar radiation instruments are located in a flat, open field in Millbrook, NY at an elevation of 128 m. GPS coordinates are N41.785823 W073.741447.

### Data frequency
Daily

### File Organization

- raw_data / original data files (2 CSV files)
- processed_data/ cleaned, derived files (6 CSV files)
- analysis/ scripts/ (3 R files)
- metadata/ codebook and data processing notes (2 MD documents)
- outputs/ figures (6 PNG files)
- communications/ slide deck (1 PPTX file)
- archive/ legacy data (0)

### Requirements
R 4.5+
Packages: lubridate, tidyverse, and ggplot2 are the primary packages needed.  See each R script for installation and loading instructions for dependencies.

### Contacts
Amy Schuler, schulera@caryinstitute.org

### License
MIT License for all code (R) scripts 
CC BY 4.0 for data - Please cite when using these data.  

### Recommended citation for data download:
Kelly, Victoria (2025). Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025. Cary Institute. https://doi.org/10.25390/caryinstitute.11553219 

### Additional notes regarding data provenance:
Temperature data for 22 September 2025 - 31 December 2025 are from the US Climate Reference Network Millbrook site: https://www.ncei.noaa.gov/pub/data/uscrn/products/daily01/2025/ and were incorporated into the raw data file, cary_met_daily_data.csv. 
