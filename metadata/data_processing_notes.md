#### Project title: Temperature and seasonal patterns at the Cary Institute: What's Changing?
### Data processing notes
1. Import *clean_filtered_daily_data_eds.R* into RStudio or other platform compatible with R Programming Language, https://www.r-project.org/ 
- Options:
  - use the data file *cary_met_data_daily.csv* supplied in this github repository's raw_data folder, which is the default (and preferred) file.  The dataset supplied with this project includes a modified version of the download (see below).  I manually added mean temperature (ave_temp), minimum temperature (min_temp), and and maximum temperature (max_temp) values from the National Centers for Environmental Information (NCEI) NOAA data portal for their weather station located adjacent to the Cary Institute weather station for dates 22 September, 2025 - end of year.  Refer to project README for reference.
  - alternatively, download the Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025 at https://caryinstitute.figshare.com/ndownloader/articles/11553219/versions/8 or durable DOI https://doi.org/10.25390/caryinstitute.11553219.  If you use this public dataset, note that 2025 data are incomplete and results of data cleaning, visualization and modeling steps will be different from the outputs of this project (e.g. visualizations will render differently and model results will change).  ALSO NOTE in-line comments in cleaning script directing you to comment/uncomment based on which dataset is used.
2. Run *clean_filtered_daily_data_eds.R* and write out derivative files as indicated in script.
3. Import *eds.visualizations.R* into RStudio or other platform.
- read in data files derived from the cleaning script as directed.  These derivative files may also be found in the processed_data folder.
4. Run *eds.visualizations.R* and write out derivative files as indicated in script.
5. Import *lm_model_predict.R* into RStudio or other platform.
- read in data files derived from the visualization script as directed.  The derivative files may also be found in the processed_data folder.
- also make sure to read in *ann_avg_temps.csv* supplied in the raw_data folder.  This is a raw file, not a file derived from previous steps!
6. Run *lm_model_predict.R*
7. Key outputs from visualization and modeling scripts may be found in the outputs folder, and in the slide presentation found in the communications folder.
