
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
library(viridis)
theme_set(theme_classic())


AntTouch <- read.csv('cest1.2_anterior_touch_merged.csv') %>%
  mutate(plate = as.factor(plate))
tibble(AntTouch)

dates_contaminated <- c("7/7/2021","7/8/2021","7/14/2021","7/15/2021", "12/7/2021")

AntTouch$genotype <- factor(AntTouch$genotype, levels = c('N2','cest-1.2', 
                          'lgc-55','tdc-1','cest-1.2;lgc-55','cest-1.2;tdc-1')
                          ,ordered = TRUE)

(bodybend <- AntTouch %>%
    filter(date == c("1/31/2022","2/25/2022","3/4/2022")) %>%
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
    scale_color_viridis(discrete = TRUE, option = "D", alpha = 0.65) +
    scale_fill_viridis(discrete = TRUE, option = "D", alpha = 0.65) + 
    labs(y = "Number of Body Bends per Reversal") + 
    theme(axis.text = element_text(size = 25)) +
    theme(axis.title = element_text(size = 20)) +
    theme(axis.text.x = element_text(angle = -15))+ 
    theme(axis.ticks.length=unit(0.1,"inch")))

(tnaAbodybendPlot <- AntTouch %>%
  filter(is.na(note), 
         is.na(additive),  
         !food %in% c("OP50", "JUb39", "tdcKO"), 
         genotype %in% c("N2", "cest-1.2"),
         !date %in% dates_contaminated) %>%
  ggplot(aes(x = food, fill = genotype, y = bends)) +
  stat_summary(aes(fill= genotype),
               geom = "bar", 
               fun = "mean", 
               width = 0.5, 
               position = position_dodge(width = .65)) +
  stat_summary(geom = "errorbar", 
               fun.data = "mean_se", 
               width = 0.1, 
               position = position_dodge(width = .65)) +
    scale_color_viridis(discrete = TRUE, option = "D", begin = 0, end = 0.25, alpha = 0.65) +
    scale_fill_viridis(discrete = TRUE, option = "D", begin = 0, end = 0.25, alpha = 0.65) + 
    labs(y = "Number of Body Bends per Reversal") + 
    theme(axis.text = element_text(size = 20)) +
    theme(axis.title = element_text(size = 20)) +
    theme(legend.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 20)) +
    theme(axis.ticks.length=unit(0.08,"inch")))

  