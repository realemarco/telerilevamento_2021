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
y2014 <- brick("Yellowstone_oli_2014291_lrg.jpg")
y2019 <- brick ("Yellowstone_oli_2019193_lrg.jpg")

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

par(mfrow=c(2,4))
levelplot(y1987$Yellowstone_19870805_lrg.2)
levelplot(y1989$Yellowstone_19890802_lrg.2)                  ##
levelplot(y1994$Yellowstone_19940925_lrg.2)               ##
levelplot(y1999$Yellowstone_19990923_lrg.2)            ###########NON PLOTTA TUTTO INSIEME
levelplot(y2004$Yellowstone_20041006_lrg.2)               ##
levelplot(y2009$Yellowstone_20090902_lrg.2)                  ##
levelplot(y2014$Yellowstone_oli_2014291_lrg.2)
levelplot(y2019$Yellowstone_oli_2019193_lrg.2)



#####PROVA############# (non funziona)
p1<-levelplot(y1987$Yellowstone_19870805_lrg.2)
p2<-levelplot(y1989$Yellowstone_19890802_lrg.2)
p3<-levelplot(y1994$Yellowstone_19940925_lrg.2)
p4<-levelplot(y1999$Yellowstone_19990923_lrg.2)
p5<-levelplot(y2004$Yellowstone_20041006_lrg.2)
p6<-levelplot(y2009$Yellowstone_20090902_lrg.2)
p7<-levelplot(y2014$Yellowstone_oli_2014291_lrg.2)
p8<-levelplot(y2019$Yellowstone_oli_2019193_lrg.2)
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8, nrow=4)
#########################

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

usc1987 <- unsuperClass(y1987, nClasses=3)
usc1989 <- unsuperClass(y1989, nClasses=3)
usc1994 <- unsuperClass(y1994, nClasses=3)
usc1999 <- unsuperClass(y1999, nClasses=3)
usc2004 <- unsuperClass(y2004, nClasses=3)
usc2009 <- unsuperClass(y2009, nClasses=3)
usc2014 <- unsuperClass(y2014, nClasses=3)
usc2019 <- unsuperClass(y2019, nClasses=3)

par(mfrow=c(2,4))
plot(usc1987$map)
plot(usc1989$map)
plot(usc1994$map)
plot(usc1999$map)
plot(usc2004$map)
plot(usc2009$map)
plot(usc2014$map)
plot(usc2019$map)

#CALCOLARE FREQ CLASSI

#TIME SERIES

#####SEZIONE PROVA######
setwd("C:/lab/esame/")
library(rasterVis)
library(raster)
library(RStoolbox)

rlist <- list.files (pattern="lrg")
rlist
import<-lapply(rlist,raster)
import 

TGr<-stack(import)
TGr
par(mfrow=c(2,4))
levelplot(TGr,pattern="lrg.2")  ###capire se il pattern funziona davvero per la seconda banda

par(mfrow=c(2,4))
plotRGB(TGr, r=1, g=2, b=3, stretch="hist")
############################################






#1 carico tutte le immagini
#2 dati sulle immagini
#3 plot delle immagini
#4 mettere etichette immagini


#time series
#vegetation index
