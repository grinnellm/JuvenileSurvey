# Transect and station data
ts_data <- tibble::tribble(
  ~Date,        ~Transect, ~Station,
  "2021-09-19", 1,         "1,3",
  "2021-09-20", 3,         "3,5",
  "2021-09-21", 6,         "1,3"
)
# ts_data <- dplyr::mutate(ts_data, Date = lubridate::as_date(Date))
save(ts_data, file = here::here("data", "ts_data.RData"))
