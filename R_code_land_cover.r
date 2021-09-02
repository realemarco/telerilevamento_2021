setwd("C:/lab/")
library(raster)
library(RStoolbox)

#installiamo il pacchetto ggplot2
# install.packages("ggplot2")
library(ggplot2)



#ggplot2 -> serve per plottare raster con una grafca più accattivante
#RStoolbox -> RStoolBox ci serve per la classificazione
#plottando tramite plotRGB o ggRGB (ggplot) posso fare confronti tramite la funzione "par" oppure, per ggplot, tramite la funzione grid.arrange del pacchetto gridExtra. 

#usiamo immagini usate nel vegetation index

defor1 <- brick("defor1.jpg") 
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

#aggiungere coordinate all'immagine
ggRGB(defor1, r=1, g=2, b=3, stretch="Lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#il par non è sufficiente per ggRGB, quindi si utilizza un altro pacchetto
# install.packages("gridExtra")
library(gridExtra)


#facciamo un multiframe con ggplot2 e gridExtra

p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

#la funzione grid.arrange compone come vogliamo il multiframe
#diamo un nome al primo plot, uno al secondo e grid.arrange li mette insieme; poi Nrow = n di righe. 
#il plot risultante è più informativo del multiframe con "par"

#CONTINUO LAND COVER

setwd("C:/lab/")
library(raster)
library(RStoolbox) 
library(ggplot2)
library(gridExtra)

#importiamo le immagini dell'Amazzonia 
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#vediamo ora l'indice vegetazionale suddiviso in due classi
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)

#eseguiamo la stessa cosa ma con defor2 (prima con 2 poi con 3 classi)
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)


#calcoliamo adesso la frequenza fra la prima e la seconda classe per le due immagini 
freq(d1c$map)  # per s1 la dimensione è: s1=304725
#in questo caso la frequenza totale di foresta è maggiore rispetto al resto (se si somano i due valori si raggiungono le dimensioni totali dell'immagine)

#facciamo lo stesso per defor2
freq(d2c$map) # per s2 la dimensione è: s2=164908

#adesso eseguiamo un calcolo
s1<-304725
prop1 <- freq(d1c$map) / s1
prop1

s2<-164908
prop2<- freq(d2c$map) / s2
prop2
#così facendo abbiamo proporzionato i valori dimensionali, in modo da essere più accurati


#adesso creiamo una tabella/dataset per confrontare i dati pre e post deforestazione
cover <- c("forest", "agriculture")
percent_1992 <- c(89.83, 10.16)  #qui inseriamo i valori dei dati che abbiamo ottenuto da prop1
percent_2006 <- c(52.06, 47.93)  #stessa cosa per prop2
percentages <- data.frame(cover, percent_1992, percent_2006) #crea una tabella raggruppando in questo caso i dati di "cover" da percent_1992 e percent_2006
percentages

#LA TABELLA:
#        cover percent_1992 percent_2006
#1      forest        89.83        52.06
#2 agriculture        10.16        47.93

#con GGPLOT rappresentiamo il dato 
par(mfrow=c(1,2))
p1 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
#ora scrivendo "p1" o "p2" ci verranno fuori dei grafici a barre con le percentuali di land cover
p1
p2

#vediamo assieme i due grafici a barre
grid.arrange(p1, p2, nrow=1)  
#NON SI USA PAR PERCHE FUNZIONA PER I PLOT
