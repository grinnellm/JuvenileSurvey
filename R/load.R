#' Load RBR data.
#'
#' Load data collected by the RBR sensor used in Bongo net casts.
#'
#' @param where Location of the input data file.
#' @param ... Other arguments passed to [oce::read.rsk()].
#' @template param-ts_info
#' @template param-quiet
#' @importFrom magrittr %>%
#' @importFrom tibble tibble
#' @importFrom oce read.rsk
#' @importFrom lubridate as_date
#' @importFrom dplyr select arrange left_join
#' @return tibble
#' @family load functions
#' @note Before loading the data, process the data by hand to identify transect
#'   and station.
#' @references \insertAllCited{}
#' @seealso oce::read.rsk(), ts_data
#' @export
#' @examples
#' data(ts_data)
#' load_rbr(where = here::here("data-raw", "Test.rsk"), ts_info = NULL)
load_rbr <- function(where, ts_info = NULL, quiet = TRUE, ...) {
  dat_raw <- read.rsk(file = where, ...)
  dat <- tibble(
    DateTime = dat_raw@data$time,
    Date = as.character(as_date(DateTime)),
    Time = format(DateTime, format = "%H:%M:%S"),
    Pressure = dat_raw@data$pressure,
    Temperature = dat_raw@data$temperature
  )
  if(is.null(ts_info)) {
    dat <- dat %>%
      select(DateTime, Date, Time, Pressure, Temperature)
  } else {
    dat <- dat %>%
      left_join(y = ts_info, by = "Date") %>%
      select(DateTime, Date, Time, Transect, Station, Pressure, Temperature)
  }
  dat <- dat %>%
    arrange(DateTime)
  dat
}
