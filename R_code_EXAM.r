setwd("C:/lab/esame/")
library(raster)
library(RStoolbox)
library(ggplot2)

y1987 <- brick("Yellowstone_19870805_lrg.jpg")
plot(y1987)
