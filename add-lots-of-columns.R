x <- airquality

x %>%
  magrittr::inset(sprintf("test_%d", 1:5), value = NA)
