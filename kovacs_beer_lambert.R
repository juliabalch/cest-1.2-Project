knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(patchwork)
library(ggbeeswarm)
library(kableExtra)
library(magrittr)
theme_set(theme_classic())

df <- read_csv("kovacs_standards.csv")

  ggplot(df, aes(x=concentration_microM, y=absorbance_571nm, color=Compound)) +
        geom_point(size = 3, shape=19)+
        geom_smooth(method = "lm")+
        
         