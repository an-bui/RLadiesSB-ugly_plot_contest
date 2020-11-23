# libraries
library(tidyverse)
library(here)

# data
# this is the google sheet of responses without timestamp, location, name, image file columns (taken out in Excel)

hs <- read_csv(here::here("data", "holiday_sweaters.csv")) %>% 
  
  # column names
  rename("hs_tf" = 'Do you have a holiday sweater?',
         "sparkly" = 'Is it sparkly?',
         "noise" = 'Does it make noise?',
         "lights" = 'Does it light up?',
         "objects" = 'Are things attached to it (i.e. is there anything that is normally not part of a sweater on it)?',
         "colors" = 'What colors does it have?',
         "image_tf" = 'Does it have a major image on it (i.e. something outside of the main pattern)?',
         "image_desc" = 'If yes, what is the image?') %>% 
  
  # sweater number
  rownames_to_column("sweater") %>% 
  mutate(sweater = paste("sweater", sweater, sep = "")) 

# write csv
write_csv(hs, here::here("data", "holiday_sweaters-clean.csv"))
