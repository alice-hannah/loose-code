lookup <- tibble::tribble(
  ~ old, ~ new,
  "Test1", "test_1",
  "Test2", "test_2"
)

dat <- tibble(
  Test1 = 1:5,
  Test2 = 6:10
)

recode_vec <- setNames(lookup$old, lookup$new)

dat %>% rename(all_of(recode_vec))

# https://tim-tiefenbach.de/post/2022-rename-columns/#dplyr-tidyverse
# Change to any_of if want to allow for some unmatched
