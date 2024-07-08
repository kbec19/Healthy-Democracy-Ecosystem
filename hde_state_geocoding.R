# Geocoding the state data
# Bridge Alliance API used first - $200 limit. 
# Need to get National Civic League Google Maps API

# Load necessary libraries
library(ggmap)
library(tidyverse)
library(tibble)
library(dplyr)
library(readr)
library(ggmap)

# Set Google API key
register_google(key = "AIzaSyDHzM6rHu3sTxW-XO3XwOtu8jjnhbMMeqc")

# Function to read CSV and create 'address' column
# When exporting from Airtable, name the file 'uncoded_STATE.csv'
df <- read.csv("uncoded_wa.csv", stringsAsFactors = FALSE)
  
# Combine the address components into a single 'address' column
df <- df %>%
    mutate(address = paste(Street.Address, City, State, Zip.Code, sep = ", "))
  
# Function to geocode a single address
geocode_address <- function(address) {

  result <- geocode(address, output = "latlona", source = "google")
  return(result)
}

# Function to handle multiple addresses from a data frame
geocode_dataframe <- function(df) {

  # Create empty columns for latitude and longitude
  df$latitude <- NA
  df$longitude <- NA
  
  # Iterate over each address and get the coordinates
  for (i in 1:nrow(df)) {
    address <- df$address[i]
    result <- geocode_address(address)
    df$latitude[i] <- result$lat
    df$longitude[i] <- result$lon
  }
  
  return(df)
}

# Call the function to geocode the addresses
geocoded_results <- geocode_dataframe(df)

# Display the resulting data frame
print(geocoded_results)

# Save the results to a CSV file
# Name the file 'geocoded_STATE_results.csv"
write.csv(geocoded_results, file = "geocoded_wa_results.csv", row.names = FALSE)



