setwd("C:/lab/esame/")
library(raster)
library(RStoolbox) #per unsupervised classificatiom
library(gridExtra) #per creare grafici
library(ggplot2) #per usare la funzione "ggplot"

#importo le immagini cn la funzione "brick"
y1987 <- brick("Yellowstone_19870805_lrg.jpg")
y1989 <- brick("Yellowstone_19890802_lrg.jpg")
y1994 <- brick("Yellowstone_19940925_lrg.jpg")
y1999 <- brick("Yellowstone_19990923_lrg.jpg")
y2004 <- brick("Yellowstone_20041006_lrg.jpg")
y2009 <- brick("Yellowstone_20090902_lrg.jpg")
y2014 <- brick("yellowstone_oli_2014291_lrg.jpg")
y2019 <- brick ("yellowstone_oli_2019193_lrg.jpg")

#visualizzo i file per vederne le caratteristiche
y1987
y1989
y1994
y1999
y2004
y2009
y2014
y2019

#PLOT RGB LINEAR STRETCH
#plot RGB anche se i colori rappresentati non sono quelli "naturali"
par(mfrow=c(2,4), mar=c(2.5,2.5,2.5,2.5)) 
plotRGB(y1987, r=1, g=2, b=3, stretch="lin")
plotRGB(y1989, r=1, g=2, b=3, stretch="lin")
plotRGB(y1994, r=1, g=2, b=3, stretch="lin")
plotRGB(y1999, r=1, g=2, b=3, stretch="lin")
plotRGB(y2004, r=1, g=2, b=3, stretch="lin")
plotRGB(y2009, r=1, g=2, b=3, stretch="lin")
plotRGB(y2014, r=1, g=2, b=3, stretch="lin")
plotRGB(y2019, r=1, g=2, b=3, stretch="lin")
mtext("plot RGB con stretch lineare 1987-2019", side = 3, line = -21, outer = TRUE)


#PLOT RGB IN HISTOGRAM STRETCH#
#per marcare maggiormente le differenze tra aree incendiate e non
par(mfrow=c(2,4), mar=c(2.5,2.5,2.5,2.5)) 
plotRGB(y1987, r=1, g=2, b=3, stretch="hist")
plotRGB(y1989, r=1, g=2, b=3, stretch="hist")
plotRGB(y1994, r=1, g=2, b=3, stretch="hist")
plotRGB(y1999, r=1, g=2, b=3, stretch="hist")
plotRGB(y2004, r=1, g=2, b=3, stretch="hist")
plotRGB(y2009, r=1, g=2, b=3, stretch="hist")
plotRGB(y2014, r=1, g=2, b=3, stretch="hist")
plotRGB(y2019, r=1, g=2, b=3, stretch="hist")
mtext("plot RGB con stretch istogramma 1987-2019", side = 3, line = -21, outer = TRUE)


#MULTIPANEL DELLE SINGOLE BANDE

#plot prima banda (GREEN)
par(mfrow=c(2,4), mar=c(2.5,3,2.5,2.5))
plot(y1987$Yellowstone_19870805_lrg.1)
plot(y1989$Yellowstone_19890802_lrg.1)
plot(y1994$Yellowstone_19940925_lrg.1)
plot(y1999$Yellowstone_19990923_lrg.1)
plot(y2004$Yellowstone_20041006_lrg.1)
plot(y2009$Yellowstone_20090902_lrg.1)
plot(y2014$Yellowstone_oli_2014291_lrg.1)
plot(y2019$Yellowstone_oli_2019193_lrg.1)
mtext("multipanel banda GREEN 1987-2019", side = 3, line = -22, outer = TRUE)


#plot seconda banda (NIR)
par(mfrow=c(2,4), mar=c(2.5,3,2.5,2.5))
plot(y1987$Yellowstone_19870805_lrg.2)
plot(y1989$Yellowstone_19890802_lrg.2)
plot(y1994$Yellowstone_19940925_lrg.2)
plot(y1999$Yellowstone_19990923_lrg.2)
plot(y2004$Yellowstone_20041006_lrg.2)
plot(y2009$Yellowstone_20090902_lrg.2)
plot(y2014$Yellowstone_oli_2014291_lrg.2)
plot(y2019$Yellowstone_oli_2019193_lrg.2)
mtext("multipanel banda NIR 1987-2019", side = 3, line = -22, outer = TRUE)

#plot terza banda (SWIR)
par(mfrow=c(2,4), mar=c(2.5,3,2.5,2.5))
plot(y1987$Yellowstone_19870805_lrg.3)
plot(y1989$Yellowstone_19890802_lrg.3)
plot(y1994$Yellowstone_19940925_lrg.3)
plot(y1999$Yellowstone_19990923_lrg.3)
plot(y2004$Yellowstone_20041006_lrg.3)
plot(y2009$Yellowstone_20090902_lrg.3)
plot(y2014$Yellowstone_oli_2014291_lrg.3)
plot(y2019$Yellowstone_oli_2019193_lrg.3)
mtext("multipanel banda SWIR 1987-2019", side = 3, line = -22, outer = TRUE)


#........................................................

#UNSUPERVISED CLASSIFICATION

##   UNSUPERCLASS TUTTE LE BANDE #
usc1987 <- unsuperClass(y1987, nClasses=4)
usc1989 <- unsuperClass(y1989, nClasses=4)
usc1994 <- unsuperClass(y1994, nClasses=4)
usc1999 <- unsuperClass(y1999, nClasses=4)
usc2004 <- unsuperClass(y2004, nClasses=4)
usc2009 <- unsuperClass(y2009, nClasses=4)
usc2014 <- unsuperClass(y2014, nClasses=4)
usc2019 <- unsuperClass(y2019, nClasses=4)

cc<-colorRampPalette(c("green","orange","blue")) (100)
 

par(mfrow=c(2,4), mar=c(2.5,2.5,2.5,2.5))                                                              
plot(usc1987$map, col=cc, main="LandCover Yellowstone 1987")
plot(usc1989$map, col=cc, main="LandCover Yellowstone 1989")
plot(usc1994$map, col=cc, main="LandCover Yellowstone 1994")
plot(usc1999$map, col=cc, main="LandCover Yellowstone 1999")
plot(usc2004$map, col=cc, main="LandCover Yellowstone 2004")
plot(usc2009$map, col=cc, main="LandCover Yellowstone 2009")
plot(usc2014$map, col=cc, main="LandCover Yellowstone 2014")
plot(usc2019$map, col=cc, main="LandCover Yellowstone 2019")

#..............................................................

#CALCOLO FREQUENZA CLASSI
# e successiva assegnazione delle 4 classi

# (la presenza di nuvole non permette di discernere le due classi di vegetazione)

plot(usc1987$map, col=cc, main="LandCover Yellowstone 1987")
freq(usc1987$map)

#  value   count
#[1,]     1  659620 -> nuvole
#[2,]     2  824527 -> acqua/ombra nuvole
#[3,]     3 3403593 -> altra vegetazione
#[4,]     4 5831336 -> foresta matura

plot(usc1989$map, col=cc, main="LandCover Yellowstone 1989")
freq(usc1989$map)

#  value   count
#[1,]     1 4626048 -> foresta matura
#[2,]     2  604650 -> acqua
#[3,]     3 2144591 -> area bruciata
#[4,]     4 3343787 -> altra vegetazione


plot(usc1994$map, col=cc,main="LandCover Yellowstone 1994")
freq(usc1994$map)

#  value   count
#[1,]     1  799405 -> acqua
#[2,]     2 3770220 -> foresta matura
#[3,]     3 3720497 -> area bruciata
#[4,]     4 2428954 -> altra vegetazione

plot(usc1999$map, col=cc, main="LandCover Yellowstone 1999")
freq(usc1999$map)

#  value   count
#[1,]     1 3362417 -> foresta matura
#[2,]     2 3062801 -> altra vegetazione
#[3,]     3  700552 -> acqua
#[4,]     4 3593306 -> area incendiata

plot(usc2004$map, col=cc, main="LandCover Yellowstone 2004")
freq(usc2004$map)

#  value   count
#[1,]     1 3450743 -> foresta matura
#[2,]     2 2992403 -> altra vegetazione
#[3,]     3  760718 -> acqua
#[4,]     4 3515212 -> area bruciata


plot(usc2009$map, col=cc, main="LandCover Yellowstone 2009")
freq(usc2009$map)

#  value   count
#[1,]     1  365011 -> nuvole
#[2,]     2  913583 -> acqua/ombra nuvole
#[3,]     3 5474748 -> vegetazione tot
#[4,]     4 3965734 -> area bruciata


plot(usc2014$map, col=cc, main="LandCover Yellowstone 2014")
freq(usc2014$map)

#  value   count
#[1,]     1 2702556 -> altra vegetazione
#[2,]     2 2487973 -> area bruciata
#[3,]     3 4270153 -> foresta matura
#[4,]     4 1258394 -> acqua



plot(usc2019$map, col=cc, main="LandCover Yellowstone 2019")
freq(usc2019$map)

#  value   count
#[1,]     1  820008 -> acqua/ombra nuvole
#[2,]     2 4041129 -> area bruciata
#[3,]     3 5318256 -> vegetazione tot
#[4,]     4  539683 -> nuvole


# CALCOLO LAND COVER

areatot <- 10719076 #(pixel totali)

#Calcolo ottenuto mettendo a rapporto i pixel di ciascuna classe con i pixel totali

p1987 <- freq(usc1987$map)/areatot
p1987
# value      count
#[1,] 9.329162e-08 0.06153702 -> 6% (nuvole)
#[2,] 1.865832e-07 0.07692146 -> 8% (acqua/ombra nuvole)
#[3,] 2.798749e-07 0.31752672 -> 32% (altra vegetazione)
#[4,] 3.731665e-07 0.54401480 -> 54% (foresta matura)

p1989 <- freq(usc1989$map)/areatot
p1989
# value      count
#[1,] 9.329162e-08 0.43157153 -> 43% (foresta matura)
#[2,] 1.865832e-07 0.05640878 -> 6% (acqua)
#[3,] 2.798749e-07 0.20007238 -> 20% (area bruciata)
#[4,] 3.731665e-07 0.31194732 -> 31% (altra vegetazione)


p1994 <-freq(usc1994$map)/areatot
p1994
# value      count
#[1,] 9.329162e-08 0.07457779 -> 7% (acqua)
#[2,] 1.865832e-07 0.35172994 -> 35% (foresta matura)
#[3,] 2.798749e-07 0.34709120 -> 35% (area bruciata)
#[4,] 3.731665e-07 0.22660106 -> 23% (altra vegetazione)


p1999<-freq(usc1999$map)/areatot
p1999
# value      count
#[1,] 9.329162e-08 0.31368534 -> 31% (foresta matura)
#[2,] 1.865832e-07 0.28573368 -> 29% (altra vegetazione)
#[3,] 2.798749e-07 0.06535563 -> 6% (acqua)
#[4,] 3.731665e-07 0.33522535 -> 34% (area incendiata)


p2004<-freq(usc2004$map)/areatot
p2004
# value      count
#[1,] 9.329162e-08 0.32192542 -> 32% (foresta matura)
#[2,] 1.865832e-07 0.27916613 -> 28% (altra vegetazione)
#[3,] 2.798749e-07 0.07096862 -> 7% (acqua)
#[4,] 3.731665e-07 0.32793983 -> 33% (area bruciata)


p2009<-freq(usc2009$map)/areatot
p2009
# value      count
#[1,] 9.329162e-08 0.03405247 -> 3% (nuvole)
#[2,] 1.865832e-07 0.08522964 -> 9% (acqua/ombra nuvole)
#[3,] 2.798749e-07 0.51074813 -> 51% (vegetazione tot)
#[4,] 3.731665e-07 0.36996976 -> 37% (area bruciata)


p2014<-freq(usc2014$map)/areatot
p2014
# value     count
#[1,] 9.329162e-08 0.2521258 -> 25% (altra vegetazione)
#[2,] 1.865832e-07 0.2321070 -> 23% (area bruciata)
#[3,] 2.798749e-07 0.3983695 -> 40% (foresta matura)
#[4,] 3.731665e-07 0.1173976 -> 12% (acqua)


p2019<-freq(usc2019$map)/areatot
p2019
# value      count
 #[1,] 9.329162e-08 0.07649988 -> 8% (acqua/ombra nuvole)
#[2,] 1.865832e-07 0.37700348 -> 38% (area bruciata)
#[3,] 2.798749e-07 0.49614874 -> 50% (vegetazione tot)
#[4,] 3.731665e-07 0.05034790 -> 5% (nuvole)


#VISUALIZZAZIONE DATI ATTRAVERSO GRAFICI

anno <- c("1987", "1989","1994","1999", "2004", "2009", "2014", "2019")
area_incendiata <- c(0, 20, 35, 34, 33, 37, 23, 38)
vegetazione <- c(86, 74, 58, 60, 60, 51, 64, 50)
percentages<-data.frame(anno, area_incendiata, vegetazione)
percentages

#Grafico a barre
ggplot(percentages, aes(x = anno, y =area_incendiata, fill = area_incendiata)) + geom_bar(stat = "identity") + theme_minimal() + ggtitle("Area interessata da incendi dal 1987 al 2019")

ggplot(percentages, aes(x = anno, y =vegetazione, fill = vegetazione)) + geom_bar(stat = "identity") + theme_minimal() + ggtitle("Copertura vegetazione tot. dal 1987 al 2019")

#Grafico lineare area incendiata x vegetazione
gr_inc <- ggplot(percentages, aes(x=anno, y=area_incendiata, group = 1)) + geom_line(color = "red")
gr_veg <- ggplot(percentages, aes(x=anno, y=vegetazione, group = 1)) + geom_line(color = "green")
grid.arrange(gr_inc, gr_veg, nrow = 2, top= "Comparazione copertura vegetazione e aree incendiate")

#grafico lineare vegetazione matura x altra vegetazione
anno0 <- c("1987", "1989","1994","1999", "2004", "2014")
vegetazione_matura <- c(54, 43, 35, 31, 32, 40)
altra_vegetazione <- c(32, 31, 23, 29, 28, 25)
vegxveg <- data.frame(anno0, vegetazione_matura, altra_vegetazione)
vegxveg

veg_mat <- ggplot(vegxveg, aes(x=anno0, y=vegetazione_matura, group = 1)) + geom_line(color = "dark green")
gr_veg <- ggplot(vegxveg, aes(x=anno0, y=altra_vegetazione, group = 1)) + geom_line(color = " light green")
grid.arrange(veg_mat, gr_veg, nrow = 2, top= "Comparazione copertura vegetazioni")

