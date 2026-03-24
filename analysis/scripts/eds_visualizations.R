# Exploratory data analysis and visualization for Cary meteorological data.
# Written by A. Schuler, updated 03 24 2026.

# install.packages(c("lubridate", "tidyverse", "janitor", viridis", "ggrepel", "tsibble", "dplyr"))

library(lubridate)
library(dplyr)
library(tidyverse)
library(janitor)
library(viridis)
library(ggrepel)
library(tsibble)

# Set working directory.
# setwd()

# Import data 


summary_fall_mint <- read.csv("~/processed_data/summary_fall_mint.csv")
summary_spring_mint <- read.csv("~/processed_data/summary_spring_mint.csv")
highlights_fall <- read.csv("~/processed_data/highlights_fall.csv") 
highlights_spring <- read.csv("~/processed_data/highlights_spring.csv")
daily_clean <- read.csv("~/processed_data/daily_clean_eds.csv")

# fix all the darn dates

summary_fall_mint$date <- as.Date(summary_fall_mint$date)
highlights_fall$date <- as.Date(highlights_fall$date)
summary_spring_mint$date <- as.Date(summary_spring_mint$date)
highlights_spring$date <- as.Date(highlights_spring$date)
daily_clean$date <- as.Date(daily_clean$date)

# spot check the dates if you like
class(summary_fall_mint$date)
# class(highlights_spring$date)

############## PLOTS ###################

# fall frosts with linear model

fall_fr_viz <- ggplot(summary_fall_mint, aes(x = date, y = min_temp)) +
  
# Gradient line through time
  geom_line(aes(color = date), linewidth = 1.2, alpha = 0.9) +
  
# Trend line
  geom_smooth(method = "lm", se = FALSE, color = "black", linewidth = .6) +
  
# Highlighted points
  geom_point(data = highlights_fall,
             aes(x = date, y = min_temp),
             color = viridis(5, option = "inferno")[4],
             size = 4) +
  
# Labels
  geom_text_repel(
    data = highlights_fall,
    aes(label = paste0(format(date, "%Y"), ": ", round(min_temp, 1), "°F")),
    size = 4,
    fontface = "bold",
    color = "black"
  ) +
  
  scale_color_viridis_c(option = "inferno", guide = "none") +
  
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  scale_y_continuous(
    limits = c(min(summary_fall_mint$min_temp, na.rm = TRUE) - 2,
               max(summary_fall_mint$min_temp, na.rm = TRUE) + 2),
    breaks = scales::pretty_breaks(n = 8)
  ) +
  
  theme_minimal(base_size = 14) +
  
  labs(
    title = "First fall frost temperatures are warming",
    subtitle = "1988–2025",
    x = "Year",
    y = "Temperature (°C)"
  )

fall_fr_viz


#spring frosts with linear model

spring_fr_viz <- ggplot(summary_spring_mint, aes(x = date, y = min_temp)) +
  
# Add gradient line through time
  geom_line(aes(color = date), linewidth = 1.2) +
  
# Add trend line
  geom_smooth(method = "lm", se = FALSE, color = "black", linewidth = .6) +
  
# Highlighted points
  geom_point(data = highlights_spring,
             aes(x = date, y = min_temp),
             color = viridis(5)[4], size = 4) +
# Labels
  geom_text_repel(
    data = highlights_spring,
    aes(label = paste0(format(date, "%Y"), ": ", round(min_temp, 1), "°F")),
    size = 4,
    fontface = "bold",
    color = "black"
  ) +
  
  scale_color_viridis_c(option = "viridis", guide = "none") +
  
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  scale_y_continuous(
    limits = c(min(summary_spring_mint$min_temp, na.rm = TRUE) - 2,
               max(summary_spring_mint$min_temp, na.rm = TRUE) + 2),
    breaks = scales::pretty_breaks(n = 8)
  ) +
  
  theme_minimal(base_size = 14) +
  
  labs(
    title = "Last spring frost temperatures are warming",
    subtitle = "1988–2025",
    x = "Year",
    y = "Temperature (°C)"
  )

spring_fr_viz

# fall and spring: combine frost data

spring_df <- summary_spring_mint %>%
  mutate(season = "Last Spring Frost")

fall_df <- summary_fall_mint %>%
  mutate(season = "First Fall Frost")

frost_combined <- bind_rows(spring_df, fall_df)

# combine my highlights

highlights_spring <- highlights_spring %>%
  mutate(season = "Last Spring Frost")

highlights_fall <- highlights_fall %>%
  mutate(season = "First Fall Frost")

highlights_all <- bind_rows(highlights_spring, highlights_fall)

# now plot facets for fall and spring 

all_frost_viz <- ggplot(frost_combined, aes(x = date, y = min_temp)) +
  
  geom_line(aes(color = date), linewidth = 1.2, alpha = .9) +
  
  geom_smooth(method = "lm", se = FALSE, color = "black", linewidth = .6) +
  
  geom_point(data = highlights_all,
             aes(x = date, y = min_temp),
             position = position_nudge(y = 0.5),
             color = "black",
             size = 3) +
  
  geom_text_repel(
    data = highlights_all,
    aes(label = paste0(format(date, "%Y"), ": ", round(min_temp, 1), "°F")),
    size = 3.8,
    fontface = "bold"
  ) +
  
  facet_wrap(~season, ncol = 1) +
  
  scale_color_viridis_c(option = "viridis", guide = "none") +
  
  scale_x_date(date_breaks = "3 years", date_labels = "%Y") +
  
  scale_y_continuous(
    limits = c(min(frost_combined$min_temp, na.rm = TRUE) - 2,
               max(frost_combined$min_temp, na.rm = TRUE) + 2),
    breaks = scales::pretty_breaks(n = 8)
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    strip.text = element_text(face = "bold", size = 14),
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(size = 13)
  ) +
  
  labs(
    title = "Seasonal Frost Temperatures Are Changing",
    subtitle = "Minimum temperatures during last spring frost and first fall frost (1988–2025)",
    caption = "First fall frost and last spring frost temperatures are rising in Millbrook, NY, USA between 1988-2025.",
    x = "Year",
    y = "Temperature (°C)"
  )

all_frost_viz

#modify daily_clean, add a year column

daily_clean$year <- year(daily_clean$date)
daily_clean

#create two time periods?
all_data_eds <- daily_clean |>
  mutate(period = ifelse(year <= median(year),
                         "Earlier Years",
                         "Recent Years"))

# prepare to plot average temps, first compute means

means_df <- all_data_eds %>%
  group_by(period) %>%
  summarise(mean_temp = mean(ave_temp, na.rm = TRUE))

# plot shifting warming

shifting <- ggplot(all_data_eds, aes(x = ave_temp, fill = period)) +
  
  # Density curves
  geom_density(
    alpha = 0.55,
    color = NA,        # cleaner than black outlines
    adjust = 1.4
  ) +
  
  # Mean lines (no legend → avoids duplication/overlap)
  geom_vline(
    data = means_df,
    aes(xintercept = mean_temp, color = period),
    linetype = "dashed",
    linewidth = 1,
    show.legend = FALSE
  ) +
  
  # Viridis (colorblind-safe)
  scale_fill_viridis_d(
    option = "D",
    begin = 0.2,
    end = 0.85
  ) +
  
  scale_color_viridis_d(
    option = "D",
    begin = 0.2,
    end = 0.85
  ) +
  
  labs(
    title = "There is a Shift Toward Warmer Average Temperatures",
    subtitle = "Distribution of daily averages: 1988–2006 vs. 2007–2025",
    caption = "The distribution has shifted toward warmer temperatures in the more recent period.\nMean daily temperature increased from 9.64°C to 10.09°C.",
    x = "Average Temperature (°C)",
    y = "Relative Frequency",
    fill = NULL
  ) +
  
  theme_minimal(base_size = 14, base_family = "sans") +
  theme(
    # Titles
    plot.title = element_text(face = "bold", size = 18, hjust = .01),
    plot.subtitle = element_text(size = 13, margin = margin(b = 12)),
    
    # Axes
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    
    # Legend
    legend.position = "top",
    legend.text = element_text(size = 12),
    legend.key.width = unit(1.5, "cm"),
    
    # Grid refinement
    panel.grid = element_blank(),
    
    # margins and caption
    plot.caption = element_text(hjust = 0, size = 12),  # left-align caption
    plot.margin = margin(15, 20, 40, 15)               # increase bottom margin
    )

shifting

# create time series

data_ts <- all_data_eds %>%
 select(date, temp = ave_temp) %>%   
 mutate(date = as.Date(date)) %>%    # ensure proper Date format
 arrange(date)

# grouping time series monthly

monthly_ts <- data_ts %>%
  mutate(month = yearmonth(date)) %>%
  group_by(month) %>%
  summarise(avg_temp = mean(temp, na.rm = TRUE))


# prep for heatmap

for_hm_data <- monthly_ts %>%
  mutate(
    year = year(month),
    month_num = month(month)
  )


# now plot heatmap

seasonal_heat <- ggplot(for_hm_data, aes(x = month_num, y = year, fill = avg_temp)) +
  geom_tile() +
  scale_x_continuous(
    breaks = 1:12,
    labels = month.abb
  ) +
  scale_fill_viridis_c() +
  labs(
    x = "Month",
    y = "Year",
    fill = "Temp (°C)",
    title = "Monthly Temperature Heatmap (38 Years)"
  ) +
  theme_minimal(base_size = 14)

seasonal_heat

# seasonal temp cycles

# prep data

seasonal_data <- monthly_ts %>%
  mutate(
    year = year(month),
    month_num = month(month)
  )


#plot seasonal  

seasonal_cyc_plot <- ggplot(seasonal_data, aes(x = month_num, y = avg_temp, group = year)) +
  geom_line(alpha = 0.2, color = "gray40") +
  stat_summary(
    aes(group = 1),
    fun = mean,
    geom = "line",
    size = 1.5,
    color = "red"
  ) +
  scale_x_continuous(
    breaks = 1:12,
    labels = month.abb
  ) +
  labs(
    x = "Month",
    y = "Temperature (°C)",
    title = "Seasonal Temperature Cycles",
    subtitle = "Gray = individual years, Red = mean seasonal cycle"
  ) +
  theme_minimal(base_size = 14)

seasonal_cyc_plot

# faceted

seasonal_facet <- ggplot(for_hm_data, aes(x = month_num, y = avg_temp)) +
  geom_line(color = "steelblue") +
  facet_wrap(~year, ncol = 6) +
  scale_x_continuous(
    breaks = c(1,4,7,10),
    labels = c("Jan","Apr","Jul","Oct")
  ) +
  labs(
    x = "Month",
    y = "Temperature (°C)",
    title = "Monthly Temperature by Year"
  ) +
  theme_minimal(base_size = 11)

seasonal_facet 

# only some years for facets

for_hm_data_select <- monthly_ts %>%
  mutate(
    year = year(month),
    month_num = month(month)
  ) %>%
  filter(year %in% c(1994, 2004, 2014, 2024))

# plot faceted select years with linear trend

face_select_years <- ggplot(for_hm_data_select, 
                            aes(x = month_num, y = avg_temp)) +
  
  # Subtle points
  geom_point(aes(color = factor(year)), size = 1.5, alpha = 0.5) +
  
  # Linear model per year
  geom_smooth(aes(color = factor(year)), 
              method = "lm", se = FALSE, linewidth = 1.2) +
  
  facet_wrap(~year, ncol = 2) +
  
  scale_x_continuous(
    breaks = 1:12,
    labels = month.abb
  ) +
  
  scale_color_viridis_d(option = "C", end = 0.9, guide = "none") +
  
  labs(
    x = "Month",
    y = "Average Temperature (°C)",
    title = "Monthly Temperature Cycles with Linear Trends",
    subtitle = "Selected Years: 1994, 2004, 2014, 2024"
  ) +
  
  theme_minimal(base_size = 14) +
  theme(
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

face_select_years

#fitting a nonlinear smoothing method to the seasonal data

seasonal_curve_plot <- ggplot(for_hm_data_select, aes(x = month_num, y = avg_temp, color = factor(year))) +
  geom_point(size = 1.2, alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, linewidth = 1.3) +
  facet_wrap(~year, ncol = 2) +
  scale_x_continuous(breaks = 1:12, labels = month.abb) +
  scale_color_viridis_d(option = "C", end = 0.9, guide = "none") +
  labs(
    x = "Month",
    y = "Average Temperature (°C)",
    title = "Seasonal Temperature Patterns by Year",
    subtitle = "LOESS Smoothed Curves"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

seasonal_curve_plot

# Select variables
vars <- all_data_eds %>%
  dplyr::select(ave_temp, max_temp, min_temp,
                max_rh, min_rh,
                tot_prec, sno_depcm)

# Compute correlation matrix
cor_mat <- cor(vars, use = "pairwise.complete.obs", method = "pearson")

# Convert to long format
cor_long <- as.data.frame(cor_mat) %>%
  tibble::rownames_to_column("Var1") %>%
  pivot_longer(-Var1, names_to = "Var2", values_to = "Correlation")

# Keep upper triangle only
cor_long <- cor_long %>%
  filter(as.numeric(factor(Var1)) <= as.numeric(factor(Var2)))

# Plot
corr <- ggplot(cor_long, aes(x = Var1, y = Var2, fill = Correlation)) +
  
  geom_tile(color = "white", linewidth = 0.4) +
  
  geom_text(aes(label = round(Correlation, 2)),
            size = 3.5) +
  
  scale_fill_viridis_c(
    option = "E",            # cividis 
    limits = c(-1, 1),
    breaks = seq(-1, 1, 0.5)
  ) +
  
  coord_fixed() +
  
  labs(
    title = "Strong correlation between temperature measurements",
    subtitle = "Millbrook, NY, USA",
    caption = "There is strong correlation between average, minimum, and maximum temperature measurements recorded in Millbrook, NY, USA between 1990-2025.",
    fill = "Pearson r",
    x = NULL,
    y = NULL
  ) +
  
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 15),
    plot.caption = element_text(hjust = 0),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank(),
    legend.position = "right",
    plot.margin = margin(15, 20, 40, 15)
    
  )
corr

# below, write out derivative files, need at least seasonal_data for modeling! 

# write_csv(all_data_eds, "all_data_eds.csv")
# write_csv(for_hm_data, "data/processed/for_hm_data.csv")
# write_csv (data_ts, "data/processed/data_ts.csv")
# write_csv(monthly_ts, "data/processed/monthly_ts.csv")
write_csv(seasonal_data, "~/processed_data/seasonal_data.csv")

# output key visualizations if you like

# ggsave("figures/corr.png", corr, width = 8, height = 6, dpi = 300)
# ggsave("figures/all_frost_viz.png", all_frost_viz, width = 8, height = 6, dpi = 300)
# ggsave("figures/seasonal_heat.png", seasonal_heat, width = 8, height = 6, dpi = 300)
# ggsave("figures/shifting.png", shifting, width = 8, height = 6, dpi = 300)

## see lm_model_predict.R for modeling seasonal data
