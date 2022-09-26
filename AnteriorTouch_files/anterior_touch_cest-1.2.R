library(tidyverse)
library(ggbeeswarm)

#initial data 

AntTouch <- read_csv('cest-1.2 anterior touch practice.csv')
AntTouch1 <- read_csv("cest-1.2_anterior_touch_repeat.csv")

bodybendPlot1 <- AntTouch %>%
  #filter(NumBends < 10) %>%
  ggplot(aes(x = genotype, y = NumBends)) +
  geom_boxplot() +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = 0.25, color = "red") +
  ggbeeswarm::geom_quasirandom(width = .25) +
  facet_grid(.~Time_off_food)

bodybendPlot1
#Are num bends dependent on time on plate? 
(bends_by_order <- AntTouch %>%
    group_by(genotype, Time_off_food) %>%
    mutate(index = row_number()) %>%
    ggplot(aes(x = index, y = NumBends)) +
    geom_point()) +
  facet_grid(Time_off_food ~ genotype, scales = "free_y") +
  geom_smooth(method = "lm")

#recent data
bodybendPlot2 <- AntTouch1 %>%
  ggplot(aes(x = genotype, y = bends)) +
  geom_boxplot() +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = 0.25, color = "red") +
  ggbeeswarm::geom_quasirandom(width = .25) +
  facet_grid(.~observer)
bodybendPlot2  
