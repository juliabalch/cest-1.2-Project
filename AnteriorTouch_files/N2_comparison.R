library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
library(viridis)
theme_set(theme_classic())


AntTouch <- read_csv('ant_touch_N2comparison.csv')
 

(bodybend <- AntTouch %>%
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
    theme(axis.text = element_text(size = 25)) +
    theme(axis.title = element_text(size = 20)) +
    theme(axis.text.x = element_text(angle = -15))+ 
    theme(axis.ticks.length=unit(0.1,"inch")))

(bodybendPlot <- AntTouch %>%
    ggplot(aes(x = genotype, fill = genotype, y = bends)) +
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
    scale_color_brewer(palette = "Accent") +
    scale_fill_brewer(palette = "Accent") +
    labs(title = "Body bends in anterior touch response",
         y = "number of body bends per reversal") +
    stat_summary(aes(shape = genotype), fun = mean, geom = "point",
                 color = "red", size = 2))
