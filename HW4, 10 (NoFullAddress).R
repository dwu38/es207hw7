
#title: 'HW 4: R More with Data Wrangling'
#author: "ES 207 Spring 2019"


library(tidyverse)
library(readr)
library(readxl)

#><span style="color:CRIMSON;">10. Identify the number of sites that do not have a complete address (full street address and zip code).  </span>

library(stringr)
loc <- read_excel("data/ca_ozone/location.xls")

#get rid of anything with "NA" or less than 5 digits in the zip
loc %>% filter(str_detect(`Zip Code`,"[0-9]{5}")) %>%
filter(!str_detect(`Zip Code`,"NA")) %>%
#"get rid of Location Approximate" or "Address Not Known" in address
filter(!str_detect(Address, 'Address Not Known|Location Approximate'))

#517 rows have proper addresses out of 921 total rows, so 921 - 517 = 404