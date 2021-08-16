#R_code_multivariate_analysis

library(raster)
library(RStoolbox)

setwd("C:/lab/")

#useremo il file "p224r63_2011_masked.grd"
#immagine del satellite Landsat (7 bande)
#usiamo la funzione brick per importare tutte le bande (set multiplo di dati)

#la funzione raster invece carica solo un set per volta

p224r63_2011<- brick("p224r63_2011_masked.grd")

p224r63_2011

#plottiamo l'immagine in tutte le sue bande
plot(p224r63_2011)

#plottiamo la B1 del nostro set (p224r63_2011) contro i valori della B2

plot(p224r63_2011$B1_sre,p224r63_2011$B2_sre, col="red", pch=19, cex=2)

#pch indica il simbolo che verrà messo nel grafico
#col è banalmente il colore che verrà rappresentato


#funzione "pairs"
#serve per plottare tutte le variabili (in questo caso le bande)
#mette in correlazione a due a due tutte le variabili del dataset
#l'indice che viene riportato superiormente è l'indice di correlazione 
#varia tra -1 e 1
#se c'è una correlazione positiva va verso 1 e viceversa se c'è una correlazione negativa

pairs(p224r63_2011)

#ad es. B1 e B2 hanno un indice di 0.93 (molto correlate)

#LEZIONE DEL 28/04/21











