# R packages
library(readr)
library(here)

# Transect and station data
ts_data <- readr::read_csv(
  "Transect, Station, Date, Time
  1, 1, 6 Sept 2022, 19:00",
  col_types = readr::cols("d", "d", "c", "c")
)
save(ts_data, file = here::here("data", "ts_data.RData"))
