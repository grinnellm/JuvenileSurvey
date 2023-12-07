# Transect and station data
ts_data <- tibble::tribble(
  ~Date,        ~Transect,
  "2022-09-19", 1,
  "2022-09-20", 3,
  "2022-09-21", 6,
  "2022-09-22", 12,
  "2022-09-23", 10,
  "2022-09-24", 44
)
# ts_data <- dplyr::mutate(ts_data, Date = lubridate::as_date(Date))
save(ts_data, file = here::here("data", "ts_data.RData"))
