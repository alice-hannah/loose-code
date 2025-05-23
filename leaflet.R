library(leaflet)
library(dplyr)
library(tibble)

x <- tribble(
  ~ city, ~ latitude, ~ longitude,
  "Ayr", 55.4586, -4.6292,
  "Glasgow", 55.8642, -4.2518
)

leaflet() %>%
  addTiles() %>%
  setView(-4.140078, 57.837990, zoom = 5.3) %>%
  addCircleMarkers(
    data = x,
    lng = ~ longitude, lat = ~ latitude,
    radius = 6,
    stroke = FALSE,
    opacity = 1,
    fillOpacity = 1,
    color = "navy")

# If need to convert easting/northing to latitude/longitude
# Or if need to get lat/long for postcodes:
# https://github.com/scotgovanalysis/school-information-dashboard/blob/main/functions/lat_long.R

