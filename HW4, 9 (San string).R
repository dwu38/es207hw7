
#title: 'HW 4: R More with Data Wrangling'
#author: "ES 207 Spring 2019"


library(tidyverse)
library(readr)
library(readxl)

#><span style="color:CRIMSON;">9. How many site names in the CA air quality location dataset "Site Name" contain "San" or "Santa?".  </span>


#for all intents/purposes, prefix "San" will be equivalent to "Santa" as it is included and I can't think of any CA placenames that begin with "San..." that aren't either of the above

library(stringr)
loc <- read_excel("data/ca_ozone/location.xls")
str_count(loc, "San") #counts occurences - column 3 is "Site Name" so 100 occurrences
