
dir <- tempdir()

file.create(file.path(dir, "2022_data.csv"))
file.create(file.path(dir, "2023_data.csv"))

# Option 1

files_to_read <- c(x_2022 = 2022, x_2023 = 2023)

x <- purrr::map(
  files_to_read,
  ~ readr::read_csv(file.path(dir, paste0(.x, "_data.csv")))
)

list2env(x, .GlobalEnv)

# Option 2

purrr::walk(
  2022:2023,
  function(x) {
    data <- readr::read_csv(file.path(dir, paste0(x, "_data.csv")))
    assign(paste0("x_", x), data, .GlobalEnv)
  }
)
