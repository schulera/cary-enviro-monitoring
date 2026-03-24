### Codebook for data files
##### For complete documentation and codebook for all variables, see: Kelly, Victoria (2020). Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025. Cary Institute. https://doi.org/10.25390/caryinstitute.11553219.v8.  
##### Variables defined here are those retained for analysis.
##### Note that some new variables derived in processing, visualizing and modeling are not defined here.
#### cary_met_data_daily.csv
- DATE. Date in MM/DD/YYYY format where MM is month number, DD is day number and YYYY is year.  Note that dates are reformatted after read-in.
- AVE_TEMP. Average air temperature (degrees C)
- MIN_TEMP. Minimum air temperature (degrees C)
- MIN_TEMT. Time of minimum air temperature (Eastern Standard Time)
- MAX_TEMP. Maximum air temperature (degrees C)
- MAX_TEMT. Time of maximum air temperature (Eastern Standard Time)
#### summary_fall_mint.csv and summary_spring_mint.csv
- date. Date in YYYY-MM-DD format
- ave_temp. Same as above
- max_temp. Same as above
- max_temt. Same as above
- min_temp. Same as above
- min_temt. Same as above
- year. Year in YYYY format
#### daily_clean_eds.csv
- same variables as above, plus these additional variables used for correlation matrix:
  - tot_prec. Total precipitation (mm)
  - sno_depcm. Snow depth (cm)
  - min_rh. Minimum relative humidity (percent)
  - max_rh. Maximum relative humidity (percent)
#### highlights_fall.csv and highlights_spring.csv
- same variables as summary_fall_mint and summary_spring_mint, plus additional:
  - season.  value = [First Fall Frost] or [First Spring Frost]
#### seasonal_data.csv
- month.  Year and month in this format: YYYY [month abbreviation]
- avg_temp. Same as above
- year. Same as above
- month_num. value = [1:12] where 1=January, 2=February, etc.
#### ann_avg_temp.csv
- year. Same as above
- avg_temp_F.  Average air temperature (degrees F), used only to convert to degrees C
