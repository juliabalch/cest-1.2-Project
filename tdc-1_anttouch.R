install.packages("viridis")

knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
library(viridis)
theme_set(theme_classic())


AntTouch <- read_csv('cest1.2_anterior_touch_merged.csv') %>%
  mutate(plate = as.factor(plate))

(bodybend <- AntTouch %>%
    filter(date == "1/31/2022"| date == "2/4/2022") %>%
    ggplot(aes(x =genotype, y = bends, fill = genotype)) +
    geom_boxplot() +
    ggbeeswarm::geom_quasirandom(aes(group = genotype),
                                 width = .1,
                                 alpha = 0.3,
                                 dodge.width = .75) +
    stat_summary(aes(),
                 geom = "errorbar", 
                 fun.data = "mean_se", 
                 width = 0.1, 
                 position = position_dodge(width = 1.6)) +
    scale_color_viridis(discrete = TRUE, option = "D", alpha = 0.65) +
    scale_fill_viridis(discrete = TRUE, option = "D", alpha = 0.65) +
    labs(title = "Body bends in anterior touch response",
         y = "number of body bends per reversal") +
   # facet_grid(.~ date)+
    stat_summary(aes(shape = genotype), fun = mean, geom = "point",
                 color = "red", size = 2))

