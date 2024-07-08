# THIS DID NOT WORK - NOT SPECIFIC ENOUGH

# Loading the tagged Texas data

library(tidyverse)
library(tibble)
library(dplyr)
library(readr)
hde_tx_addresses <- read_csv("Master List-Texas Groups.csv")
View(hde_tx_addresses)

# Loading the package for converting addresses to coordinates

library(tidygeocoder)

# Create census objects

census_tx <- hde_tx_addresses %>%
  geocode(street = Street, city = City, state = State, method = "census")

# Missing a lot of street addresses and only have PO boxes so have to run osm 
# method to get coordinates of city only

osm_tx <- hde_tx_addresses %>%
  geocode(city = City, state = State, method = "osm")

<<<<<<< HEAD
# Export csv for reintegration

write.csv(osm_tx, "tx_coordinates.csv")
=======
# Export csv for reintegratio
>>>>>>> 47efcf4 (Correct Texas)
