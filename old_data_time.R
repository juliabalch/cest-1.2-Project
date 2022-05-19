knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
library(viridis)
theme_set(theme_classic())


AntTouch <- read_csv('cest1.2_anterior_touch_merged.csv') %>%


dates_contaminated <- c("7/7/2021","7/8/2021","7/14/2021","7/15/2021", "12/7/2021")


(bodybend <- AntTouch %>%
    filter(!date %in% dates_contaminated, genotype == c("N2", "cest-1.2")) %>%
    ggplot(aes(x = genotype, y = bends, fill = genotype)) +
    stat_summary(aes(fill= genotype),
                 geom = "bar", 
                 fun = "mean", 
                 width = 0.5, 
                 position = position_dodge(width = .65)) +
    stat_summary(geom = "errorbar", 
                 fun.data = "mean_se", 
                 width = 0.1, 
                 position = position_dodge(width = .65)) +
    labs(y = "Number of Body Bends per Reversal") +

    facet_grid(.~time_off_food))
