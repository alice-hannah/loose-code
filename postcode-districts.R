library(httr2)

file <- tempfile(fileext = ".geojson")

resp <-
  request(
    "https://maps.gov.scot/server/services/NRS/SPD/MapServer/WFSServer"
  ) %>%
  req_url_query(service = "wfs",
                request = "GetFeature",
                version = "1.1.0",
                typename = "SPD:PostcodeDistrictGridRef",
                outputformat = "GML3") %>%
  req_perform(path = file)

x <- sf::read_sf(file)

unlink(file)
