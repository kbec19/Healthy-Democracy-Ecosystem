# Loading the general data

library(tidyverse)
library(tibble)
library(dplyr)
library(readr)
hde_americorps <- read_csv("AmeriCorps.csv")
View(hde_americorps)

# Loading the package for converting addresses to coordinates

library(tidygeocoder)

# Create osm objects

osm_americorps <- hde_americorps %>%
  geocode(city = City, state = State, method = "osm")

osm_americorps2 <- hde_americorps %>%
  geocode(city = City, state = State, postalcode = Zip, method = "osm")

# Export csv for reintegration

write.csv(osm_americorps2, "americorps_coordinates2.csv")
