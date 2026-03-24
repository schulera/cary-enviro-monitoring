# More retooling, and modeling, of Cary meteorological data. 
# Written by A. Schuler, updated 03 24 2026.


#install.packages(c("lubridate", "tidyverse", "janitor", "purrr", "dplyr", "viridis", "ggrepel", "forecast"))

library(lubridate)
library(dplyr)
library(tidyverse)
library(janitor)
library(viridis)
library(ggrepel)

# Set working directory.
# setwd()

#read in some key data files

#monthly_ts <- read.csv ("data/processed/monthly_ts.csv")
seasonal_data <- read.csv ("~/processed_data/seasonal_data.csv")
average_temps <- read.csv ("~/raw_data/ann_avg_temps.csv") #note this is a new file supplied with project, not derived from previous code files
#also note the ann_avg_temps raw file has temperatures in degrees Fahrenheit


# create function to convert F to Celsius
fahrenheit.to.celsius <- function(T.fahrenheit) {
  return((T.fahrenheit - 32) * 5/9)
}

# apply conversion function to average_temps and add the new column for degrees Celsius

average_temps$avg_temp_C <- fahrenheit.to.celsius(average_temps$avg_temp_F)
average_temps$avg_temp_C <- round(average_temps$avg_temp_C, digits = 1)

# linear model where avg_temp_C is dependent and month_num(as factor) and year are independent vars
# this treats each month as a category, not a number.

seasonal_data <- na.omit(seasonal_data)

model1 <- lm(avg_temp ~ year + factor(month_num), data = seasonal_data)
summary(model1)

seasonal_data$fitted <- predict(model1)

# add month names before plotting seasonal data

seasonal_data$month_name <- factor(
  seasonal_data$month_num,
  levels = 1:12,
  labels = month.abb  # built-in abbreviations: "Jan", "Feb", …
)

#plot fitted values

ggplot(seasonal_data, aes(x = year, y = avg_temp)) +
  geom_point(alpha = 0.4) +
  geom_line(aes(y = fitted), color = "blue", size = 1) +
  facet_wrap(~ month_num, ncol = 4) +
  labs(
    title = "Observed vs Fitted Temperatures by Month",
    x = "Year",
    y = "Average Temperature (C)"
  ) +
  theme_minimal()

#overall trend and seasonal adjustment

season_adj <- ggplot(seasonal_data, aes(x = year, y = fitted, color = as.factor(month_num))) +
  geom_line(linewidth = 1.1) +
  scale_color_viridis_d(option = "C", end = 0.9) +
  labs(
    title = "Model-Predicted Seasonal Temperature Trends",
    x = "Year",
    y = "Predicted Average Temperature",
    color = "Month"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )

season_adj

# adjust model1 to see different warming rates for month

model2 <-lm(avg_temp ~ year * factor(month_num), data = seasonal_data)

seasonal_data$fitted2 <- predict(model2)

summary(model2)

# now plot fitted trends by month

season_adj2 <- ggplot(seasonal_data, aes(x = year, y = fitted2,
                          color = factor(month_num))) +
  geom_line(linewidth = 1.1) +
  scale_color_viridis_d(option = "C", end = 0.9) +
  labs(
    title = "Temperature Trends by Month (Interaction Model)",
    x = "Year",
    y = "Fitted Temperature (°C)",
    color = "Month"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )

season_adj2

# facet

season_adj_facet <-  ggplot(seasonal_data, aes(x = year, y = avg_temp)) +
  geom_point(alpha = 0.3) +
  geom_line(aes(y = fitted2, color = factor(month_num)),
            linewidth = 1) +
  scale_color_viridis_d(option = "C", guide = "none") +
  facet_wrap(~ month_name, ncol = 4) +  # use the new month_name column
  labs(
    title = "Observed vs Fitted Trends by Month (Interaction Model)",
    caption = "Observed monthly temperatures (points) and fitted linear trends (lines) from an interaction model \nallowing month-specific temperature trends. Each panel represents a calendar month.",
    x = "Year",
    y = "Temperature (°C)"
  ) +
  theme_minimal(base_size = 13) +
  theme(panel.grid.minor = element_blank(),
        plot.title = element_text(face = "bold"),
        plot.caption = element_text(hjust = 0, size = 12),
        plot.margin = margin(15, 20, 40, 15))

season_adj_facet

#simple linear trend and prediction intervals

model3 <- lm(avg_temp_C ~ year, data = average_temps)


#forecast 10 years ahead
future_years <- data.frame(
  year = seq(max(average_temps$year) + 1,
             max(average_temps$year) + 10)
)

#generate predictions 
pred_conf <- predict(model3, newdata = future_years, interval = "confidence")
pred_pred <- predict(model3, newdata = future_years, interval = "prediction")

future_years <- cbind(future_years,
                      conf_lwr = pred_conf[, "lwr"],
                      conf_upr = pred_conf[, "upr"],
                      pred_lwr = pred_pred[, "lwr"],
                      pred_upr = pred_pred[, "upr"],
                      fit = pred_conf[, "fit"])

#plot

forecast_plot <- ggplot() +
  geom_point(data = average_temps,
             aes(x = year, y = avg_temp_C),
             color = "black") +
  
  geom_line(data = average_temps,
            aes(x = year, y = avg_temp_C),
            color = "gray") +
  
  geom_line(data = future_years,
            aes(x = year, y = fit),
            color = "red",
            linewidth = 1) +
  
  # Prediction interval
  geom_ribbon(data = future_years,
              aes(x = year, ymin = pred_lwr, ymax = pred_upr),
              fill = viridis(2)[1],
              alpha = 0.15) +
  
  # Confidence interval
  geom_ribbon(data = future_years,
              aes(x = year, ymin = conf_lwr, ymax = conf_upr),
              fill = viridis(2)[2],
              alpha = 0.35) +
  
  labs(x = "Year",
       y = "Average Temperature (C)",
       title = "Temperatures are Likely to Keep Rising",
       caption = "Historical average temperatures (points and gray line) with a 10-year linear forecast (red line). \nShaded regions indicate 95% confidence (dark) and prediction (light) intervals.") +
  
  theme_minimal(base_size = 13) +
  theme(panel.grid.minor = element_blank(),
        plot.title = element_text(face = "bold"),
        plot.caption = element_text(hjust = 0, size = 12),  # left-align caption
        plot.margin = margin(15, 20, 40, 15)
  )

forecast_plot

summary(model3)
confint(model3)
            

# write out key figures if you like
# ggsave("~/outputs/figures/forecast_plot.png", forecast_plot, width = 8, height = 6, dpi = 300)
# ggsave("~/outputs/figures/season_adj_facet.png", season_adj_facet, width = 8, height = 6, dpi = 300)
