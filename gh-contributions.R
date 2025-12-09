library(ghadmin)
library(dplyr)

org <- "ScotGovAnalysis"

repos <- repos(org)

contrib <- repo_contrib(org, repos$repo)

my_contrib <-
  contrib %>%
  group_by(repo) %>%
  mutate(top_contrib = list(user[contributions == max(contributions)])) %>%
  ungroup() %>%
  filter(user %in% c("alice-hannah", "alicebyers5"))
