# Data cleaning and filtering of daily meteorological data from the Cary Institute.  
# Written by A. Schuler, updated 03 24 2026. 

# install.packages(c("lubridate", "tidyverse", "janitor", "dplyr"))

library(lubridate)
library(dplyr)
library(tidyverse)
library(janitor)

# Set working directory.
# setwd()

# download the Cary Environmental Monitoring Program Daily Meteorological and Solar Radiation Data: 1988-2025 and accompanying metadata at
# https://caryinstitute.figshare.com/ndownloader/articles/11553219/versions/8 or durable DOI https://doi.org/10.25390/caryinstitute.11553219

### NOTE: the downloaded data contain incomplete temperature data for 2025, but will work for this analysis.  However, the dataset 
# supplied with this project includes a modified version of the download.  I manually added mean temperature (ave_temp), minimum 
# temperature (min_temp), and and maximum temperature (max_temp) values from the National Centers for Environmental Information (NCEI) NOAA
# data portal for their weather station located adjacent to the Cary Institute weather station.  See README for more information.

DAILY_all_eds <- read.csv("~/raw_data/cary_met_data_daily.csv",   na = c("", "NA"))

# clean up the names
DAILY_clean <- clean_names(DAILY_all_eds)

# use the line below to fix the dates for the modified dataset supplied with this project.  Comment it out if
# using the dataset downloaded from the Cary Data Repository!
DAILY_clean$date <- as.POSIXct(DAILY_clean$date, format = "%m/%d/%Y")  

# uncomment the line below to fix the dates for dataset downloaded from Cary Data Repository
# DAILY_clean$date <- as.POSIXct(DAILY_clean$date, origin="1988-01-01")  

# check date 
class(DAILY_clean$date)
# fix if needed

# filter by year and split up into separate data 
All1988 <- DAILY_clean %>% filter(between(date, as.Date('1988-01-01'), as.Date('1988-12-31')))
All1989 <- DAILY_clean %>% filter(between(date, as.Date('1989-01-01'), as.Date('1989-12-31')))
All1990 <- DAILY_clean %>% filter(between(date, as.Date('1990-01-01'), as.Date('1990-12-31')))
All1991 <- DAILY_clean %>% filter(between(date, as.Date('1991-01-01'), as.Date('1991-12-31')))
All1992 <- DAILY_clean %>% filter(between(date, as.Date('1992-01-01'), as.Date('1992-12-31')))
All1993 <- DAILY_clean %>% filter(between(date, as.Date('1993-01-01'), as.Date('1993-12-31')))
All1994 <- DAILY_clean %>% filter(between(date, as.Date('1994-01-01'), as.Date('1994-12-31')))

All1995 <- DAILY_clean %>% filter(between(date, as.Date('1995-01-01'), as.Date('1995-12-31')))
All1996 <- DAILY_clean %>% filter(between(date, as.Date('1996-01-01'), as.Date('1996-12-31')))
All1997 <- DAILY_clean %>% filter(between(date, as.Date('1997-01-01'), as.Date('1997-12-31')))
All1998 <- DAILY_clean %>% filter(between(date, as.Date('1998-01-01'), as.Date('1998-12-31')))
All1999 <- DAILY_clean %>% filter(between(date, as.Date('1999-01-01'), as.Date('1999-12-31')))

All2000 <- DAILY_clean %>% filter(between(date, as.Date('2000-01-01'), as.Date('2000-12-31')))
All2001 <- DAILY_clean %>% filter(between(date, as.Date('2001-01-01'), as.Date('2001-12-31')))
All2002 <- DAILY_clean %>% filter(between(date, as.Date('2002-01-01'), as.Date('2002-12-31')))
All2003 <- DAILY_clean %>% filter(between(date, as.Date('2003-01-01'), as.Date('2003-12-31')))
All2004 <- DAILY_clean %>% filter(between(date, as.Date('2004-01-01'), as.Date('2004-12-31')))

All2005 <- DAILY_clean %>% filter(between(date, as.Date('2005-01-01'), as.Date('2005-12-31')))
All2006 <- DAILY_clean %>% filter(between(date, as.Date('2006-01-01'), as.Date('2006-12-31')))
All2007 <- DAILY_clean %>% filter(between(date, as.Date('2007-01-01'), as.Date('2007-12-31')))
All2008 <- DAILY_clean %>% filter(between(date, as.Date('2008-01-01'), as.Date('2008-12-31')))
All2009 <- DAILY_clean %>% filter(between(date, as.Date('2009-01-01'), as.Date('2009-12-31')))

All2010 <- DAILY_clean %>% filter(between(date, as.Date('2010-01-01'), as.Date('2010-12-31')))
All2011 <- DAILY_clean %>% filter(between(date, as.Date('2011-01-01'), as.Date('2011-12-31')))
All2012 <- DAILY_clean %>% filter(between(date, as.Date('2012-01-01'), as.Date('2012-12-31')))
All2013 <- DAILY_clean %>% filter(between(date, as.Date('2013-01-01'), as.Date('2013-12-31')))
All2014 <- DAILY_clean %>% filter(between(date, as.Date('2014-01-01'), as.Date('2014-12-31')))

All2015 <- DAILY_clean %>% filter(between(date, as.Date('2015-01-01'), as.Date('2015-12-31')))
All2016 <- DAILY_clean %>% filter(between(date, as.Date('2016-01-01'), as.Date('2016-12-31')))
All2017 <- DAILY_clean %>% filter(between(date, as.Date('2017-01-01'), as.Date('2017-12-31')))
All2018 <- DAILY_clean %>% filter(between(date, as.Date('2018-01-01'), as.Date('2018-12-31')))
All2019 <- DAILY_clean %>% filter(between(date, as.Date('2019-01-01'), as.Date('2019-12-31')))

All2020 <- DAILY_clean %>% filter(between(date, as.Date('2020-01-01'), as.Date('2020-12-31')))
All2021 <- DAILY_clean %>% filter(between(date, as.Date('2021-01-01'), as.Date('2021-12-31')))
All2022 <- DAILY_clean %>% filter(between(date, as.Date('2022-01-01'), as.Date('2022-12-31')))
All2023 <- DAILY_clean %>% filter(between(date, as.Date('2023-01-01'), as.Date('2023-12-31')))
All2024 <- DAILY_clean %>% filter(between(date, as.Date('2024-01-01'), as.Date('2024-12-31')))
All2025 <- DAILY_clean %>% filter(between(date, as.Date('2025-01-01'), as.Date('2025-12-31')))

#filter each year for temps 0 or below, and drop some unwanted columns at the same time
All1988mint <- select(filter(All1988, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw)) 
All1989mint <- select(filter(All1989, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw)) 
All1990mint <- select(filter(All1990, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1991mint <- select(filter(All1991, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1992mint <- select(filter(All1992, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1993mint <- select(filter(All1993, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1994mint <- select(filter(All1994, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1995mint <- select(filter(All1995, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1996mint <- select(filter(All1996, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1997mint <- select(filter(All1997, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1998mint <- select(filter(All1998, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All1999mint <- select(filter(All1999, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2000mint <- select(filter(All2000, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2001mint <- select(filter(All2001, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2002mint <- select(filter(All2002, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2003mint <- select(filter(All2003, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2004mint <- select(filter(All2004, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2005mint <- select(filter(All2005, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2006mint <- select(filter(All2006, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2007mint <- select(filter(All2007, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2008mint <- select(filter(All2008, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2009mint <- select(filter(All2009, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2010mint <- select(filter(All2010, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2011mint <- select(filter(All2011, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2012mint <- select(filter(All2012, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2013mint <- select(filter(All2013, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))  
All2014mint <- select(filter(All2014, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2015mint <- select(filter(All2015, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))            
All2016mint <- select(filter(All2016, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2017mint <- select(filter(All2017, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2018mint <- select(filter(All2018, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2019mint <- select(filter(All2019, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2020mint <- select(filter(All2020, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2021mint <- select(filter(All2021, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2022mint <- select(filter(All2022, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2023mint <- select(filter(All2023, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2024mint <- select(filter(All2024, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))
All2025mint <- select(filter(All2025, min_temp <= 0.0), -(ave_sws:max_wst), -(max_rh:kt_sw))

# FILTER by date, season
# spring and fall date ranges for all years based on fall and spring equinox and solstice dates, as recorded in the 
#US Navy seasons data tool online calendar located at 
# https://aa.usno.navy.mil/data/Earth_Seasons
# conversion does not account for daylight saving time!

spring1988 <- All1988mint %>% filter(between(date, as.Date('1988-03-20'), as.Date('1988-06-20')))
fall1988 <- All1988mint %>% filter(between(date, as.Date('1988-09-22'), as.Date('1988-12-20')))

spring1989 <- All1989mint %>% filter(between(date, as.Date('1989-03-20'), as.Date('1989-06-20')))
fall1989 <- All1989mint %>% filter(between(date, as.Date('1989-09-23'), as.Date('1989-12-21')))

spring1990 <- All1990mint %>% filter(between(date, as.Date('1990-03-20'), as.Date('1990-06-20')))
fall1990 <- All1990mint %>% filter(between(date, as.Date('1990-09-23'), as.Date('1990-12-20')))

spring1991 <- All1991mint %>% filter(between(date, as.Date('1991-03-21'), as.Date('1991-06-20')))
fall1991 <- All1991mint %>% filter(between(date, as.Date('1991-09-23'), as.Date('1991-12-21')))

spring1992 <- All1992mint %>% filter(between(date, as.Date('1992-03-20'), as.Date('1992-06-20')))
fall1992 <- All1992mint %>% filter(between(date, as.Date('1992-09-22'), as.Date('1992-12-20')))

spring1993 <- All1993mint %>% filter(between(date, as.Date('1993-03-20'), as.Date('1993-06-20')))
fall1993 <- All1993mint %>% filter(between(date, as.Date('1993-09-23'), as.Date('1993-12-20')))

spring1994 <- All1994mint %>% filter(between(date, as.Date('1994-03-20'), as.Date('1994-06-20')))
fall1994 <- All1994mint %>% filter(between(date, as.Date('1994-09-23'), as.Date('1994-12-21')))

spring1995 <- All1995mint %>% filter(between(date, as.Date('1995-03-21'), as.Date('1995-06-20')))
fall1995 <- All1995mint %>% filter(between(date, as.Date('1995-09-23'), as.Date('1995-12-21')))

spring1996 <- All1996mint %>% filter(between(date, as.Date('1996-03-20'), as.Date('1996-06-20')))
fall1996 <- All1996mint %>% filter(between(date, as.Date('1996-09-22'), as.Date('1996-12-20')))

spring1997 <- All1997mint %>% filter(between(date, as.Date('1997-03-20'), as.Date('1997-06-20')))
fall1997 <- All1997mint %>% filter(between(date, as.Date('1997-09-22'), as.Date('1997-12-20')))

spring1998 <- All1998mint %>% filter(between(date, as.Date('1998-03-20'), as.Date('1998-06-20')))
fall1998 <- All1998mint %>% filter(between(date, as.Date('1998-09-23'), as.Date('1998-12-21')))

spring1999 <- All1999mint %>% filter(between(date, as.Date('1999-03-21'), as.Date('1999-06-20')))
fall1999 <- All1999mint %>% filter(between(date, as.Date('1999-09-23'), as.Date('1999-12-21')))

spring2000 <- All2000mint %>% filter(between(date, as.Date('2000-03-20'), as.Date('2000-06-20')))
fall2000 <- All2000mint %>% filter(between(date, as.Date('2000-09-22'), as.Date('2000-12-20')))

spring2001 <- All2001mint %>% filter(between(date, as.Date('2001-03-20'), as.Date('2001-06-20')))
fall2001 <- All2001mint %>% filter(between(date, as.Date('2001-09-22'), as.Date('2001-12-20')))

spring2002 <- All2002mint %>% filter(between(date, as.Date('2002-03-20'), as.Date('2002-06-20')))
fall2002 <- All2002mint %>% filter(between(date, as.Date('2002-09-23'), as.Date('2002-12-21')))

spring2003 <- All2003mint %>% filter(between(date, as.Date('2003-03-21'), as.Date('2003-06-20')))
fall2003 <- All2003mint %>% filter(between(date, as.Date('2003-09-23'), as.Date('2003-12-21')))

spring2004 <- All2004mint %>% filter(between(date, as.Date('2004-03-20'), as.Date('2004-06-20')))
fall2004 <- All2004mint %>% filter(between(date, as.Date('2004-09-22'), as.Date('2004-12-20')))

spring2005 <- All2005mint %>% filter(between(date, as.Date('2005-03-20'), as.Date('2005-06-20')))
fall2005 <- All2005mint %>% filter(between(date, as.Date('2005-09-22'), as.Date('2005-12-20')))

spring2006 <- All2006mint %>% filter(between(date, as.Date('2006-03-20'), as.Date('2006-06-20')))
fall2006 <- All2006mint %>% filter(between(date, as.Date('2006-09-23'), as.Date('2006-12-21')))

spring2007 <- All2007mint %>% filter(between(date, as.Date('2007-03-21'), as.Date('2007-06-20')))
fall2007 <- All2007mint %>% filter(between(date, as.Date('2007-09-23'), as.Date('2007-12-21')))

spring2008 <- All2008mint %>% filter(between(date, as.Date('2008-03-20'), as.Date('2008-06-19')))
fall2008 <- All2008mint %>% filter(between(date, as.Date('2008-09-22'), as.Date('2008-12-20')))

spring2009 <- All2009mint %>% filter(between(date, as.Date('2009-03-20'), as.Date('2009-06-20')))
fall2009 <- All2009mint %>% filter(between(date, as.Date('2009-09-22'), as.Date('2009-12-20')))

spring2010 <- All2010mint %>% filter(between(date, as.Date('2010-03-20'), as.Date('2010-06-20')))
fall2010 <- All2010mint %>% filter(between(date, as.Date('2010-09-23'), as.Date('2010-12-20')))

spring2011 <- All2011mint %>% filter(between(date, as.Date('2011-03-20'), as.Date('2011-06-20')))
fall2011 <- All2011mint %>% filter(between(date, as.Date('2011-09-23'), as.Date('2011-12-21')))

spring2012 <- All2012mint %>% filter(between(date, as.Date('2012-03-20'), as.Date('2012-06-19')))
fall2012 <- All2012mint %>% filter(between(date, as.Date('2012-09-22'), as.Date('2012-12-20')))

spring2013 <- All2013mint %>% filter(between(date, as.Date('2013-03-20'), as.Date('2013-06-20')))
fall2013 <- All2013mint %>% filter(between(date, as.Date('2013-09-22'), as.Date('2013-12-20')))

spring2014 <- All2014mint %>% filter(between(date, as.Date('2014-03-20'), as.Date('2014-06-20')))
fall2014 <- All2014mint %>% filter(between(date, as.Date('2014-09-23'), as.Date('2014-12-20')))

spring2015 <- All2015mint %>% filter(between(date, as.Date('2015-03-20'), as.Date('2015-06-20')))
fall2015 <- All2015mint %>% filter(between(date, as.Date('2015-09-23'), as.Date('2015-12-21')))

spring2016 <- All2016mint %>% filter(between(date, as.Date('2016-03-20'), as.Date('2016-06-19')))
fall2016 <- All2016mint %>% filter(between(date, as.Date('2016-09-22'), as.Date('2016-12-20')))

spring2017 <- All2017mint %>% filter(between(date, as.Date('2017-03-20'), as.Date('2017-06-20')))
fall2017 <- All2017mint %>% filter(between(date, as.Date('2017-09-22'), as.Date('2017-12-20')))

spring2018 <- All2018mint %>% filter(between(date, as.Date('2018-03-20'), as.Date('2018-06-20')))
fall2018 <- All2018mint %>% filter(between(date, as.Date('2018-09-23'), as.Date('2018-12-21')))

spring2019 <- All2019mint %>% filter(between(date, as.Date('2019-03-20'), as.Date('2019-06-20')))
fall2019 <- All2019mint %>% filter(between(date, as.Date('2019-09-23'), as.Date('2019-12-20')))

spring2020 <- All2020mint %>% filter(between(date, as.Date('2020-03-20'), as.Date('2020-06-19')))
fall2020 <- All2020mint %>% filter(between(date, as.Date('2020-09-22'), as.Date('2020-12-20')))

spring2021 <- All2021mint %>% filter(between(date, as.Date('2021-03-20'), as.Date('2021-06-20')))
fall2021 <- All2021mint %>% filter(between(date, as.Date('2021-09-22'), as.Date('2021-12-20')))

spring2022 <- All2022mint %>% filter(between(date, as.Date('2022-03-20'), as.Date('2022-06-20')))
fall2022 <- All2022mint %>% filter(between(date, as.Date('2022-09-23'), as.Date('2022-12-20')))

spring2023 <- All2023mint %>% filter(between(date, as.Date('2023-03-20'), as.Date('2023-06-20')))
fall2023 <- All2023mint %>% filter(between(date, as.Date('2023-09-23'), as.Date('2023-12-21')))

spring2024 <- All2024mint %>% filter(between(date, as.Date('2024-03-20'), as.Date('2024-06-19')))
fall2024 <- All2024mint %>% filter(between(date, as.Date('2024-09-22'), as.Date('2024-12-20')))

spring2025 <- All2025mint %>% filter(between(date, as.Date('2025-03-20'), as.Date('2025-06-20')))
fall2025 <- All2025mint %>% filter(between(date, as.Date('2025-09-22'), as.Date('2025-12-20')))


#put the mint data frames in lists, fall and spring

fall_mint_list <- list(
  '1988' = fall1988,
  '1989' = fall1989,
  '1990' = fall1990,
  '1991' = fall1991,
  '1992' = fall1992,
  '1993' = fall1993,
  '1994' = fall1994,
  '1995' = fall1995,
  '1996' = fall1996,
  '1997' = fall1997,
  '1998' = fall1998,
  '1999' = fall1999,
  '2000' = fall2000,
  '2001' = fall2001,
  '2002' = fall2002,
  '2003' = fall2003,
  '2004' = fall2004,
  '2005' = fall2005,
  '2006' = fall2006,
  '2007' = fall2007,
  '2008' = fall2008,
  '2009' = fall2009,
  '2010' = fall2010,
  '2011' = fall2011,
  '2012' = fall2012,
  '2013' = fall2013,
  '2014' = fall2014,
  `2015` = fall2015,
  `2016` = fall2016,
  '2017' = fall2017,
  `2018` = fall2018,
  `2019` = fall2019,
  `2020` = fall2020,
  `2021` = fall2021,
  '2022' = fall2022,
  '2023' = fall2023,
  '2024' = fall2024,
  '2025' = fall2025
  
)

#pull first date from all the fall data frames

summary_fall_mint <- lapply(seq_along(fall_mint_list), function(i) {
 fall_mint_list[[i]] %>%
    mutate(date = as.Date(date)) %>%
    arrange(date) %>%
    slice(1) 
    }) %>%
  bind_rows()

#create new column for year

summary_fall_mint$year <- year(summary_fall_mint$date)

#create some highlight years for fall

highlights_fall <- summary_fall_mint %>%
  filter(format(date, "%Y") %in% c("1994", "2004", "2014", "2024"))

#now create lists and data frames for spring

spring_mint_list <- list(
  '1988' = spring1988,
  '1989' = spring1989,
  '1990' = spring1990,
  '1991' = spring1991,
  '1992' = spring1992,
  '1993' = spring1993,
  '1994' = spring1994,
  '1995' = spring1995,
  '1996' = spring1996,
  '1997' = spring1997,
  '1998' = spring1998,
  '1999' = spring1999,
  '2000' = spring2000,
  '2001' = spring2001,
  '2002' = spring2002,
  '2003' = spring2003,
  '2004' = spring2004,
  '2005' = spring2005,
  '2006' = spring2006,
  '2007' = spring2007,
  '2008' = spring2008,
  '2009' = spring2009,
  '2010' = spring2010,
  '2011' = spring2011,
  '2012' = spring2012,
  '2013' = spring2013,
  '2014' = spring2014,
  `2015` = spring2015,
  `2016` = spring2016,
  '2017' = spring2017,
  `2018` = spring2018,
  `2019` = spring2019,
  `2020` = spring2020,
  `2021` = spring2021,
  '2022' = spring2022,
  '2023' = spring2023,
  '2024' = spring2024,
  '2025' = spring2025
  
)

#pull first date from all the spring data frames

summary_spring_mint <- lapply(seq_along(spring_mint_list), function(i) {
  spring_mint_list[[i]] %>%
    mutate(date = as.Date(date)) %>%
    arrange(date) %>%
    slice(1) 
}) %>%
  bind_rows()

#new column for year

summary_spring_mint$year <- year(summary_spring_mint$date)

#create some highlight years for spring

highlights_spring <- summary_spring_mint %>%
  filter(format(date, "%Y") %in% c("1994", "2004", "2014", "2024"))

### # the end of primary cleaning and filtering ###

# below, write out select derivative files for analysis and visualizations

write_csv(summary_fall_mint, "processed/summary_fall_mint.csv")
write_csv(summary_spring_mint, "processed/summary_spring_mint.csv")
write_csv(highlights_fall, "processed/highlights_fall.csv")
write_csv(highlights_spring, "processed/highlights_spring.csv")
write_csv(DAILY_clean, "processed/daily_clean_eds.csv")

## see eds_visualizations.R for plotting and visualizing these data 
