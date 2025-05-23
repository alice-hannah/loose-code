# Code to get number of lines in R scripts

dir <- here::here()

scripts <- list.files(
  dir, pattern = ".R$", full.names = TRUE, recursive = TRUE
)

lines <- 
  purrr::map_dfr(
    scripts,
    \(x) tibble::tibble(filepath = x,
                        name = basename(x),
                        n_lines = R.utils::countLines(x)[1])
  )
