setwd("C:/lab/esame/")
library(raster)
library(RStoolbox)
library(ggplot2)
library(rasterVis)

y1987 <- brick("Yellowstone_19870805_lrg.jpg")
y1989 <- brick("Yellowstone_19890802_lrg.jpg")
y1994 <- brick("Yellowstone_19940925_lrg.jpg")
y1999 <- brick("Yellowstone_19990923_lrg.jpg")
y2004 <- brick("Yellowstone_20041006_lrg.jpg")
y2009 <- brick("Yellowstone_20090902_lrg.jpg")
y2014 <- brick("yellowstone_oli_2014291_lrg.jpg")
y2019 <- brick ("yellowstone_oli_2019193_lrg.jpg")

y1987
y1989
y1994
y1999
y2004
y2009
y2014
y2019

par(mfrow=c(2,4))
plotRGB(y1987, r=1, g=2, b=3, stretch="lin")
plotRGB(y1989, r=1, g=2, b=3, stretch="lin")
plotRGB(y1994, r=1, g=2, b=3, stretch="lin")
plotRGB(y1999, r=1, g=2, b=3, stretch="lin")
plotRGB(y2004, r=1, g=2, b=3, stretch="lin")
plotRGB(y2009, r=1, g=2, b=3, stretch="lin")
plotRGB(y2014, r=1, g=2, b=3, stretch="lin")
plotRGB(y2019, r=1, g=2, b=3, stretch="lin")

dev.off()

#UNSUPERCLASS

######TEST CLASSI###########
#   usc19891 <- unsuperClass(y1989, nClasses=3)
#   usc19892 <- unsuperClass(y1989, nClasses=4) #forse meglio 4 classi
#   usc19893 <- unsuperClass(y1989, nClasses=5)
#   par(mfrow=c(2,4))
#   plot(usc19891$map)
#   plot(usc19892$map) 
#   plot(usc19893$map) 
#########################################

usc1987 <- unsuperClass(y1987, nClasses=4)
usc1989 <- unsuperClass(y1989, nClasses=4)
usc1994 <- unsuperClass(y1994, nClasses=4)
usc1999 <- unsuperClass(y1999, nClasses=4)
usc2004 <- unsuperClass(y2004, nClasses=4)
usc2009 <- unsuperClass(y2009, nClasses=4)
usc2014 <- unsuperClass(y2014, nClasses=4)
usc2019 <- unsuperClass(y2019, nClasses=4)

par(mfrow=c(2,4))
plot(usc1987$map)
plot(usc1989$map)
plot(usc1994$map)
plot(usc1999$map)
plot(usc2004$map)
plot(usc2009$map)
plot(usc2014$map)
plot(usc2019$map)

#TIME SERIES

#####SEZIONE PROVA######
setwd("C:/lab/esame/")
library(rasterVis)
library(raster)
library(RStoolbox)
rlist <- list.files (pattern="lrg")
rlist
import<-lapply(rlist,brick)
TGr<-stack(import)
TGr
par(mfrow=c(2,4))
levelplot(TGr)
par(mfrow=c(2,4))
plotRGB(TGr, r=1, g=2, b=3, stretch="lin")
############################################






#1 carico tutte le immagini
#2 dati sulle immagini
#3 plot delle immagini
#4 mettere etichette immagini


#time series
#vegetation index
