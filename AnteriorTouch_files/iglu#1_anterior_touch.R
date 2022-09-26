library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
theme_set(theme_classic())

igluAntTouch <- read_csv('iglu#1_anterior_touch.csv')


bodybendPlot <- igluAntTouch %>%
  ggplot(aes(x = additive, y = bends, fill = additive)) +
  geom_boxplot() +
  labs(title = "Body bends in anterior touch response",
       y = "number of body bends per reversal")
       
bodybendPlot

