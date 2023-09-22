#' Load RBR data.
#'
#' Load data collected by the RBR sensor used in Bongo net casts.
#'
#' @param where Location of the input data file.
#' @template param-ts_info
#' @template param-quiet
#' @importFrom tibble tibble
#' @importFrom Rdpack reprompt
#' @return tibble
#' @family load functions
#' @note Before loading the data, process the data by hand to identify transect
#'   and station.
#' @references \insertAllCited{}
#' @export
#' @examples
#' load_rbr(where = "data-raw/RBR.rsk")

load_rbr <- function(where, ts_info, quiet = TRUE) {
  raw <- read.rsk(file = where)
  browser()
  dat <- tibble(a=1:5, b=1:5)
  dat
}
