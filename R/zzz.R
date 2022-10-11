.onAttach <- function(libname,
                      pkgname) {
  # Welcome message
  packageStartupMessage(
    "This is JuvenileSurvey version ",
    utils::packageVersion("JuvenileSurvey"),
    "."
  )
}
