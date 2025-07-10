library(sgplot)
library(ggplot2)
library(dplyr)
library(gapminder)

d <-
  gapminder |>
  filter(continent != "Oceania") |>
  group_by(continent, year) |>
  summarise(pop = sum(as.numeric(pop)), .groups = "drop")

circle_data <-
  d %>%
  group_by(continent) %>%
  summarise(max_pop = max(pop), 
            med_pop = median(pop),
            med_year = median(year),
            .groups = "drop") %>%
  mutate(pop_size = ifelse(max_pop > 2e9, "big", "small"))

ggplot(d, aes(x = year, y = pop)) +
  geom_line() +
  geom_point(data = circle_data,
             aes(x = med_year, y = med_pop, colour = pop_size),
             size = 35,
             shape = 1) +
  theme_sg(legend = "none") +
  scale_color_manual(values = c("orange", "red")) +
  facet_wrap(~ continent, ncol = 2, scales = "free_y") +
  labs(y = NULL)
