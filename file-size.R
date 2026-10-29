library(dplyr)
library(janitor)

dir_size <- function(dir) {
  list.files(dir, recursive = TRUE, full.names = TRUE) |>
    purrr::map(file.size) |>
    purrr::list_c() |>
    sum(na.rm = TRUE)
}

dir <- ""

x <- 
  tibble(
    path = list.files(dir, full.names = TRUE)
  ) |>
  mutate(is_dir = dir.exists(path)) |> 
  rowwise() |> 
  mutate(size_bytes = case_when(
    is_dir ~ dir_size(path),
    .default = file.size(path)
  )) |>
  ungroup() |>
  mutate(
    size_mb = round_half_up(size_bytes / 1024^2, 2),
    size_gb = round_half_up(size_bytes / 1024^3, 2)
  ) |> 
  mutate(name = basename(path), .after = path) |>
  arrange(desc(size_bytes))
