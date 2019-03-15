
#title: 'HW 4: R More with Data Wrangling'
#author: "ES 207 Spring 2019"

library(tidyverse)
library(readr)
library(readxl)

#><span style="color:CRIMSON;">15. Write a function to caculate the annual daily mean (what is the annual mean of the daily mean?). Apply that function to Merced County. What is the annual daily mean of o3 for Merced County? Report your results in quantititive format (i.e., prose, or a table), and in visual format (i.e., a graph). </span>

library(stringr)
#the following is copied verbatim from previous
colnames(loc)[1] <- "site"
daily.site <- daily %>%
  left_join(loc, by = "site")

#filter out anything not MerCo
daily.site %>% filter(str_detect(`County Name`,"Merced")) %>%
   mutate(year = format(date, "%YYYY")) %>% 
   group_by(Site = as.factor(Site), year, `Site Name`) %>%
   #get annual mean/median/max/min
   summarize(`Mean Ozone` = mean(o3, na.rm = TRUE))

#couldn't figure out the graphing part