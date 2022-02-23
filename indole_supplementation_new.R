knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
library(viridis)
theme_set(theme_classic())


AntTouch <- read_csv('new_indole.csv') %>%
  mutate(plate = as.factor(plate))


(TAbodybendPlot <- AntTouch %>%
    ggplot(aes(x = additive, fill = genotype, y = bends)) +
    geom_boxplot() +
    ggbeeswarm::geom_quasirandom(aes(group = genotype),
                                 width = .1,
                                 alpha = 0.3,
                                 dodge.width = .75) +
    stat_summary(aes(color = genotype),
                 geom = "errorbar", 
                 fun.data = "mean_se", 
                 width = 0.1, 
                 position = position_dodge(width = 1.6)) +
    scale_color_brewer(palette = "Accent") +
    scale_fill_brewer(palette = "Accent") +
    labs(title = "Body bends in anterior       
touch response",
         y = "number of body bends per reversal", x = "Plate additive"))

