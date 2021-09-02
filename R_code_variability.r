setwd("C:/lab/")
library(raster)
library(RStoolbox)
library(ggplot2) #for ggplot plotting
library(gridExtra) #for plotting ggplots togheter

#install.packages("viridis") #pacchetto con scale di colore predefinite
library (viridis)


#carichiamo l'immagine png di Sentinel
sent <- brick("sentinel.png")
sent

#plottiamo
plotRGB(sent, stretch="lin") 
#usiamo i colori di default (non inserendo r=1, g=2 e b=3) 

plotRGB(sent, r=2, g=1, b=3, stretch="lin") 
#assegnamo colori in modo da distinguere bene praterie, boschi e laghi


#proseguiamo con:
##NDVI= (Nero Infra Red - Red)/(Nero Infra Red + Red)

#per prima cosa creiamo i due oggetti "nir" e "red"
nir <- sent$sentinel.1 
red <- sent$sentinel.2

#procediamo a calcolare l'NDVI
ndvi <- (nir-red) / (nir+red)  
#il risultato è l'indice di vegetazione
#plottiamo la mappa ndvi
plot(ndvi) 

#cambiamo la colorazione rampalette di ndvi
Similaun <- colorRampPalette(c('black','white','red', 'magenta','green'))(100)
plot(ndvi, col=Similaun)    

#Adesso calcoliamo la deviazione standard dell'immagine
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(ndvisd3)

#cambiamo i colori di base:
#la deviazione standard è più omogenea  nelle praterie alpine e foreste
#ha valori più alti nelle zone rocciose (che sono molto più variabili)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)

#allarghiamo la dimensione dei quadrati, ottendendo perciò informazioni più facili da caricare ma meno dettagliate
#funzione "focal"
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd5, col=clsd)             


#RASTER PCA

#eseguiamo la rasterPCA dell'immagine (analissiamo la componente principale del raster)
sentpca <- rasterPCA(sent)
plot(sentpca$map)
sentpca
summary(sentpca$model)

#guardiamo le componenti di sentpca
pc1 <- sentpca$map$PC1
pc1
#TABELLA
#                           Comp.1     Comp.2      Comp.3   Comp.4
# Standard deviation     77.3362848 53.5145531 5.765599616      0
# Proportion of Variance  0.6736804  0.3225753 0.003744348      0
# Cumulative Proportion   0.6736804  0.9962557 1.000000000      1

#vediamo che la prima componente spiega più delle altre 
#funzione "focal"-> caclola i valori "focali" (moving window) attraverso una matrice
######C'E' UN ERROREEE####
up<-focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
          
focalpc1_sd5<-focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
plot(focalpc1_sd5, col=clsd)


#FUNZIONE SOURCE
#salva un codice di R che possiamo poi recuperare
#Scarichiamo il file R ("source_test_lezione.r") da virtuale e salviamolo in "lab". 
#usando questa funzione R va a pescare quel file col codice R per poi plottarlo

#funzione source carica direttamente un file da una cartella del pc
source("source_test_lezione.r")

#in questo passaggio la funzione ha caricato e plottato questo codice da (source_test_lezione.r):
#   pc1 <- sentpca$map$PC1                                       #
#   pc1sd7 <- focal(pc1, w=matrix(1/49, nrow=7, ncol=7), fun=sd) #
#   plot(pc1sd7)                                                 #


#FUNZIONI INTERESSANTI

library(viridis) #necessario per queste funzioni

# ggplot() + geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer))    
#la funzione crea una mappa di calore, con le due variabili x e y ma anche una terza variabile che è il colore 

# ggplot() + geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis()            
#aggiunge la colorazione gialla nella mappa

# ggplot() + geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis()  + ggtitle ("Standard deviation of PC1 by viridis colour scale")   
#altra tipologia di sfumatura con un'altra legenda di colori

# ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option ="magma")  + ggtitle("Standard deviation of PC1 by viridis colour scale")
#Altre colorazioni per la mappa a tre variabili


#creare colorramppalette predefinita direttamente tramite viridis
p1<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis()
#utilizzo colorramppalette "magma"
p2<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")
#utilizzo colorramppalette "inferno"
p3<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "inferno")  +
ggtitle("Standard deviation of PC1 by inferno colour scale")
#utilizzare un grid arrange diverso 
#in verticale
grid.arrange(p1,p2,p3, nrow=3)
#in orizzontale
grid.arrange(p1,p2,p3, nrow=1)
