#data import function
data_import <- function(x, y) {
  data_url <- paste0(y, x)
  response <- GET(data_url)
  soil_poll_content <- content(response, as = "text")
  soil_poll <<- fromJSON(soil_poll_content)
}

#data frame making function
data_frame_making <- function() {
  clean_data_geo <- sapply(
  soil_poll,
  function(x) {
    x$Cells$geoData$coordinates
    }
)
clean_data_level <- sapply(
  soil_poll,
  function(x) {
    x$Cells$PollutionLevel
    }
)
clean_data_year <- sapply(
  soil_poll,
  function(x) {
    x$Cells$Year
    }
)
clean_data_value <- sapply(
  soil_poll,
  function(x) {
    x$Cells$EstimatedindexValue
    }
)
clean_data_geo <- t(clean_data_geo)
soil_df <- cbind(clean_data_geo, clean_data_level)
soil_df <- cbind(soil_df, clean_data_year)
soil_df <- cbind(soil_df, clean_data_value)
soil_df <- as.data.frame(soil_df)
colnames(soil_df) <- c("lon", "lat", "level", "year", "value")
soil_df <<- unfactor(soil_df)
}
