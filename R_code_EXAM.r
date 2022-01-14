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

#PLOT RGB IN HISTOGRAM STRETCH#
# par(mfrow=c(2,4))
# plotRGB(y1987, r=1, g=2, b=3, stretch="hist")
# plotRGB(y1989, r=1, g=2, b=3, stretch="hist")
# plotRGB(y1994, r=1, g=2, b=3, stretch="hist")
# plotRGB(y1999, r=1, g=2, b=3, stretch="hist")
# plotRGB(y2004, r=1, g=2, b=3, stretch="hist")
# plotRGB(y2009, r=1, g=2, b=3, stretch="hist")
# plotRGB(y2014, r=1, g=2, b=3, stretch="hist")
# plotRGB(y2019, r=1, g=2, b=3, stretch="hist")

#prova stretch
par(mfrow=c(2,3))
plot(y1989, stretch="lin")
plot(y1989, stretch="hist")
#con questo plot no differenza tra lin e hist stretch

#PROVARE LEVELPLOT!#

#PROVA GGPLOT##
library(gridExtra)
p1<-ggRGB(y1987, r=1, g=2, b=3, stretch="hist")
p2<-ggRGB(y1989, r=1, g=2, b=3, stretch="hist")
p3<-ggRGB(y1994, r=1, g=2, b=3, stretch="hist")
p4<-ggRGB(y1999, r=1, g=2, b=3, stretch="hist")
p5<-ggRGB(y2004, r=1, g=2, b=3, stretch="hist")
p6<-ggRGB(y2009, r=1, g=2, b=3, stretch="hist")
p7<-ggRGB(y2014, r=1, g=2, b=3, stretch="hist")
p8<-ggRGB(y2019, r=1, g=2, b=3, stretch="hist")
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, nrow=2)

#####PROVA2 plottare solo una banda#####
plot(y2019$Yellowstone_oli_2019193_lrg.1) #funziona

#plot solo prima banda (verde?)
par(mfrow=c(2,4))
plot(y1987$Yellowstone_19870805_lrg.1)
plot(y1989$Yellowstone_19890802_lrg.1)
plot(y1994$Yellowstone_19940925_lrg.1)
plot(y1999$Yellowstone_19990923_lrg.1)
plot(y2004$Yellowstone_20041006_lrg.1)
plot(y2009$Yellowstone_20090902_lrg.1)
plot(y2014$Yellowstone_oli_2014291_lrg.1)
plot(y2019$Yellowstone_oli_2019193_lrg.1)


#plot solo seconda banda (nir??)
par(mfrow=c(2,4))
plot(y1987$Yellowstone_19870805_lrg.2)
plot(y1989$Yellowstone_19890802_lrg.2)
plot(y1994$Yellowstone_19940925_lrg.2)
plot(y1999$Yellowstone_19990923_lrg.2)
plot(y2004$Yellowstone_20041006_lrg.2)
plot(y2009$Yellowstone_20090902_lrg.2)
plot(y2014$Yellowstone_oli_2014291_lrg.2)
plot(y2019$Yellowstone_oli_2019193_lrg.2)

#plot solo terza banda (swir??)
par(mfrow=c(2,4))
plot(y1987$Yellowstone_19870805_lrg.3)
plot(y1989$Yellowstone_19890802_lrg.3)
plot(y1994$Yellowstone_19940925_lrg.3)
plot(y1999$Yellowstone_19990923_lrg.3)
plot(y2004$Yellowstone_20041006_lrg.3)
plot(y2009$Yellowstone_20090902_lrg.3)
plot(y2014$Yellowstone_oli_2014291_lrg.3)
plot(y2019$Yellowstone_oli_2019193_lrg.3)

#funziona tutto, decidere quale banda usare per  analisi sulle zone incendiate

#####PROVA############# (non funziona)
library(gridExtra)
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
set.seed(42)
#########PROVA unsuperClass CON BANDA VERDE#######
 usc1987 <- unsuperClass(y1987$Yellowstone_19870805_lrg.1, nClasses=4)
 usc1989 <- unsuperClass(y1989$Yellowstone_19890802_lrg.1, nClasses=4)
 usc1994 <- unsuperClass(y1994$Yellowstone_19940925_lrg.1, nClasses=4)
 usc1999 <- unsuperClass(y1999$Yellowstone_19990923_lrg.1, nClasses=4)     
 usc2004 <- unsuperClass(y2004$Yellowstone_20041006_lrg.1, nClasses=4)     ##FORSE BANDA VERDE EVIDENZIA INCENDIO
 usc2009 <- unsuperClass(y2009$Yellowstone_20090902_lrg.1, nClasses=4)
 usc2014 <- unsuperClass(y2014$Yellowstone_oli_2014291_lrg.1, nClasses=4)
 usc2019 <- unsuperClass(y2019$Yellowstone_oli_2019193_lrg.1, nClasses=4)
##################

c1<-colorRampPalette(c("green","grey","purple")) (100)
c2<-colorRampPalette(c("grey","green","purple")) (100)
c3<-colorRampPalette(c("purple","grey","green")) (100)
c4<-colorRampPalette(c("purple","green","grey")) (100)
c5<-colorRampPalette(c("grey","purple","green")) (100)
c6<-colorRampPalette(c("green","purple","grey")) (100)

par(mfrow=c(2,4))
#plot(usc1987$map, col=c1)
#plot(usc1987$map, col=c2)
plot(usc1987$map, col=c3)
#plot(usc1987$map, col=c4)
#plot(usc1987$map, col=c5)
#plot(usc1987$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc1989$map, col=c1)
#plot(usc1989$map, col=c2)
#plot(usc1989$map, col=c3)
#plot(usc1989$map, col=c4)
plot(usc1989$map, col=c5)
#plot(usc1989$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc1994$map, col=c1)
#plot(usc1994$map, col=c2)
#plot(usc1994$map, col=c3)
plot(usc1994$map, col=c4)
#plot(usc1994$map, col=c5)
#plot(usc1994$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc1999$map, col=c1)
plot(usc1999$map, col=c2)
#plot(usc1999$map, col=c3)
#plot(usc1999$map, col=c4)
#plot(usc1999$map, col=c5)
#plot(usc1999$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc2004$map, col=c1)
#plot(usc2004$map, col=c2)
#plot(usc2004$map, col=c3)
#plot(usc2004$map, col=c4)
#plot(usc2004$map, col=c5)
plot(usc2004$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc2009$map, col=c1)
#plot(usc2009$map, col=c2)
#plot(usc2009$map, col=c3)
#plot(usc2009$map, col=c4)
#plot(usc2009$map, col=c5)
plot(usc2009$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc2014$map, col=c1)
#plot(usc2014$map, col=c2)
plot(usc2014$map, col=c3)
#plot(usc2014$map, col=c4)
#plot(usc2014$map, col=c5)
#plot(usc2014$map, col=c6)

#par(mfrow=c(2,4))
#plot(usc2019$map, col=c1)
#plot(usc2019$map, col=c2)
plot(usc2019$map, col=c3)
#plot(usc2019$map, col=c4)
#plot(usc2019$map, col=c5)
#plot(usc2019$map, col=c6)

########
usc1987 <- unsuperClass(y1987, nClasses=4)
usc1989 <- unsuperClass(y1989, nClasses=4)
usc1994 <- unsuperClass(y1994, nClasses=4)
usc1999 <- unsuperClass(y1999, nClasses=4)
usc2004 <- unsuperClass(y2004, nClasses=4)
usc2009 <- unsuperClass(y2009, nClasses=4)
usc2014 <- unsuperClass(y2014, nClasses=4)
usc2019 <- unsuperClass(y2019, nClasses=4)

cc<-colorRampPalette(c("green","grey","orange","blue")) (100)

par(mfrow=c(2,4))
plot(usc1987$map, col=cc, main="LandCover Yellowstone 1987")
plot(usc1989$map, col=cc, main="LandCover Yellowstone 1989")
plot(usc1994$map, col=cc, main="LandCover Yellowstone 1994")
plot(usc1999$map, col=cc, main="LandCover Yellowstone 1999")
plot(usc2004$map, col=cc, main="LandCover Yellowstone 2004")
plot(usc2009$map, col=cc, main="LandCover Yellowstone 2009")
plot(usc2014$map, col=cc, main="LandCover Yellowstone 2014")
plot(usc2019$map, col=cc, main="LandCover Yellowstone 2019")
set.seed(42)

#difficile scegliere numero di classi.
# a prescindere che siano 3 o 4 comunque non sembra esserci coerenza con la scala dei colori



#CALCOLARE FREQ CLASSI
plot(usc1987$map, col=cc)
freq(usc1987$map)

#   value   count
# [1,]     1  661053 -> nuvole
# [2,]     2 5788199 -> foresta matura
# [3,]     3  822107 -> acqua
# [4,]     4 3447717 -> foresta estiva


plot(usc1989$map, col=cc)
freq(usc1989$map)

#  value   count
# [1,]     1 3306887
# [2,]     2 4677596
# [3,]     3  620792
# [4,]     4 2113801


plot(usc1994)
freq(usc1994$map)

plot(usc1999)
freq(usc1999$map)

plot(usc2004)
freq(usc2004$map)

plot(usc2009)
freq(usc2009$map)

plot(usc2014)
freq(usc2014$map)

plot(usc2019)
freq(usc2019$map)




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

importcl<-lapply(import, unsuperClass, nClasses=3)
plot(importcl)
TGr<-stack(import)
TGr

plot(TGr)

UT<-unsuperClass(TGr,nClasses=3)

par(mfrow=c(2,4))
levelplot(TGr,pattern="lrg.2")  ###capire se il pattern funziona davvero per la seconda banda
levelplot(TGr$Yellowstone_19870805_lrg)
par(mfrow=c(2,4))
plotRGB(TGr, r=1, g=2, b=3, stretch="hist")
############################################






#1 carico tutte le immagini
#2 dati sulle immagini
#3 plot delle immagini
#4 mettere etichette immagini


#time series
#vegetation index

#PROVA LISTA TIME SERIES UNSUPERCLASS
usc1987 <- unsuperClass(y1987$Yellowstone_19870805_lrg.1, nClasses=3)
usc1989 <- unsuperClass(y1989$Yellowstone_19890802_lrg.1, nClasses=3)
usc1994 <- unsuperClass(y1994$Yellowstone_19940925_lrg.1, nClasses=3)
usc1999 <- unsuperClass(y1999$Yellowstone_19990923_lrg.1, nClasses=3)     
usc2004 <- unsuperClass(y2004$Yellowstone_20041006_lrg.1, nClasses=3)     ##FORSE BANDA VERDE EVIDENZIA INCENDIO
usc2009 <- unsuperClass(y2009$Yellowstone_20090902_lrg.1, nClasses=3)
usc2014 <- unsuperClass(y2014$Yellowstone_oli_2014291_lrg.1, nClasses=3)
usc2019 <- unsuperClass(y2019$Yellowstone_oli_2019193_lrg.1, nClasses=3)

lista<-c(usc1987,usc1989, usc1994, usc1999, usc2004, usc2009, usc2014, usc2019)
lista
plot(lista$map) ####HA FUSO TUTTE LE IMMAGINI IN UN'UNICA IMMAGINE
levelplot(lista$map, col.regions=c1) #LO STESSO QUI, COME PLOTTARLE SEPARATAMENTE MA CON CLASSI COERENTI?

