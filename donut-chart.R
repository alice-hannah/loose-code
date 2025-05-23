
library(tibble)
library(dplyr)
library(stringr)
library(ggplot2)
library(ggiraph)

dat <- tibble(
  measure = c("% Meeting Level", "% Not Met Level"),
  value   = c(0.8, 0.2),
  value_label = c("80%", "20%")
)

ggplot(dat, aes(y = rev(value), fill = measure)) +
  geom_bar(
    aes(x = 1),
    width = 0.5,
    stat = "identity",
    show.legend = FALSE
  ) +
  annotate(
    geom = "text",
    x = 0,
    y = 0,
    label = 
      filter(dat, measure == "% Meeting Level") %>%
      pull(value_label),
    size = 12,
    color = "#3182bd"
  ) +
  scale_fill_manual(values = c("white", "#3182bd")) +
  coord_polar(theta = "y") +
  theme_void() +
  theme(plot.title = element_text(size = 16, hjust = 0.5))
