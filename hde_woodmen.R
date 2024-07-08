# Loading the tagged Texas data

library(tidyverse)
library(tibble)
library(dplyr)
library(readr)
hde_woodmen <- read_csv("Master Woodmen.csv")
View(hde_woodmen)

# Loading the package for converting addresses to coordinates

library(tidygeocoder)

# Create census objects

census_woodmen <- hde_woodmen  %>%
  geocode(street = Street, city = City, state = State, method = "census")

# Missing a lot of street addresses and only have PO boxes so have to run osm 
# method to get coordinates of city only

osm_woodmen <- hde_woodmen %>%
  geocode(city = City, state = State, method = "osm")

# Export csv for reintegration

write.csv(osm_woodmen, "woodmen_coordinates.csv")
