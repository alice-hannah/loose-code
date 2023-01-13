library(dplyr)

dat <- tibble(
  g = sample(c("A", "B"), 10, replace = TRUE), 
  x = sample(1:2, 10, replace = TRUE),
  y = rep(1, 10)
)

dat %>% summarise(z = sum(y[x == 1]))

dat %>% group_by(g) %>% summarise(z = sum(y[x == 2]))