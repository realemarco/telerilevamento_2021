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

#partendo da tante bande faremo un'analisi multivariata (PCA)
#quuesta analisi può essere fatta confrontando più bande di una stessa immagine satellitare oppure confrontando la stessa banda ma in tempi diversi (time series)

library(raster)
library(RStoolbox)
   
setwd("C:/lab/")

#carichiamo il dataset
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

#immagine formata da 7 bande, pixel delle diverse bande molto correlati fra loro
#questo lo possiamo vedere con la funzione "pairs"

pairs(p224r63_2011)

#vediamo che la banda 1 (del blu) e la 2 (del verde) sono fortemente correlate (0.93)
#ciò significa che per gli stessi pixel le due bande avranno valori simili 

#le due bande concorrono per il 50% ciascuna sulla variabilità
#usiamo però due componenti PC1 (principal component 1) e la PC2 (principal component 2) per
#rappresentare la variabilità lungo il gradiente più alto (PC1) e l'altro che passa per il gradiente più basso (PC2)
#in questo caso la variabilità è spiegata per il 90% dalla sola PC1


#Per alleggerire il dato usiamo la funzione "aggregate"
#aggreghiamo i pixel

p224r63_2011res <- aggregate(p224r63_2011, fact=10)

#"fact" indica il fattore di aggregazione
#"res" sta per "resampled"

#col fattore usato il nostro pixel non sarà più 30 metri ma 300 metri (fact=10)

#ora plottiamo le due immagini (originale e resampled)
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")


#proseguiamo con la PCA
#usiamo la funzione "rasterPCA" di RStoolBox
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)

#come per la funzione "unsupclass", anche per "rasterPCA" in uscita otteniamo una mappa, un modello, etc...
#quindi p224r63_2011res_pca contiene anche questi nuovi elementi
#per visualizzare tutto ciò usiamo la funzione "summary" e il simbolo $ per inserire le componenti che voglio vedere
summary(p224r63_2011res_pca$model)




