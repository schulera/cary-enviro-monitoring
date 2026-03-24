#### Project title: Temperature and seasonal patterns at the Cary Institute: What's Changing?
### Data processing Notes
1. Import *clean_filtered_daily_data_eds.R* into RStudio or other platform compatible with R Programming Language, https://www.r-project.org/ 
- Options:
  - use the data file supplied in this github repository data/raw folder, which is the default (and preferred) file.  The dataset supplied with this project includes a modified version of the download (see below).  I manually added mean temperature (ave_temp), minimum temperature (min_temp), and and maximum temperature (max_temp) values from the National Centers for Environmental Information (NCEI) NOAA data portal for their weather station located adjacent to the Cary Institute weather station for dates 22 September, 2025 - end of year.  Refer to project README for reference.
  - alternatively, download the Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025 at https://caryinstitute.figshare.com/ndownloader/articles/11553219/versions/8 or durable DOI https://doi.org/10.25390/caryinstitute.11553219.  If you use this public dataset, note that 2025 data are incomplete and results of data cleaning, visualization and modeling steps will be different from the outputs of this project (e.g. visualizations will render differently and model results will change).  ALSO NOTE in-line comments in cleaning script directing you to comment/uncomment based on which dataset is used.
2. Run *clean_filtered_daily_data_eds.R* and write out derivative files as indicated in script.
3. Import *eds.visualizations.R* into RStudio or other platform.
- read in data files derived from the cleaning script as directed.  These derivative files may also be found in the data/processed folder.
4. Run *eds.visualizations.R* and write out derivative files as indicated in script.
5. Import *lm_model_predict.R* into RStudio or other platform.
- read in data files derived from the visualization script as directed.  The derivative files may also be found in the data/processed folder. 
