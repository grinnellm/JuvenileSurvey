# Additional checks to run before `R-CMD-CHECK`

# Load packages
require(JuvenileSurvey)
require(here)

# Build the raw data files
source(file = here("data-raw", "pars.R"))

# Build the read me file
rmarkdown::render(input = here("README.Rmd"))
file.remove(here("README.html"))

# Compile the supporting documents
devtools::build_manual(path = here("doc"))
devtools::build_vignettes(pkg = ".")

# Styler
styler::style_pkg()
styler::style_file(path = here("vignettes", "Introduction.Rmd"))
styler::style_file(path = here("man", "sticker", "sticker.R"))
styler::style_file(path = here("README.Rmd"))

# Lint
lintr::lint_package()
lintr::lint(filename = here("man", "sticker", "sticker.R"))
lintr::lint(filename = here("README.Rmd"))
lintr::lint(filename = here("tr", "SpawnIndex.Rnw"))

# Good practice (takes a while; restart R and require `SpawnIndex` first)
goodpractice::gp(path = ".")
