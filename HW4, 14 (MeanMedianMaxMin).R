
#title: 'HW 4: R More with Data Wrangling'
#author: "ES 207 Spring 2019"

library(tidyverse)
library(readr)
library(readxl)
library(stringr)
#the following is copied verbatim from previous
colnames(loc)[1] <- "site"
daily.site <- daily %>%
  left_join(loc, by = "site")

 #filter in anything w/o "San" or "Santa"
 daily.site %>% filter(str_detect(`Site Name`,"San")) %>%
   mutate(year = format(date, "%YYYY")) %>% 
   group_by(Site = as.factor(Site), year, `Site Name`) %>%
   #get annual mean/median/max/min
   summarize(`Mean Ozone` = mean(o3, na.rm = TRUE), `Median Ozone` = median(o3, na.rm = TRUE), `Max Ozone` = max(o3, na.rm = TRUE), `Minimum Ozone` = min(o3, na.rm = TRUE))