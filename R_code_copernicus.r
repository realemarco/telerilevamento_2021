#LEZIONE 14/04/21
#R_code_copernicus.r
#Visualizing Copernicus data

 #installiamo il pacchetto ncdf4
 #install.packages("ncdf4")

library(raster)
library(ncdf4)

setwd("C:/lab/")

#scegliamo un nome da dare al dataset
#fcover
fcover<-raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")
#carichiamo un singolo layer, quindi usuiamo la funzione raster
 
fcover
 
#vediamo che è un rasterlayer (pixel con unità di misura minima del file)
#risuluzione in coordinate geografiche
#sistema di riferimento in WGS84

#settiamo una colorRampPalette
cl <- colorRampPalette(c('brown','yellow','green','dark green'))(100)
plot(fcover, col=cl)

#se variabile è pesante la possiamo ricampionare
#usiamo la funzione "aggregate"
#questo processo si chiama ricampionamento bilineare (fa media tra pixel vicini)

fcover_res<-aggregate(fcover, fact=100)
#usando un fattore di 100 diminuisco l'informazione di 10.000 volte

plot(fcover_res)


#per prossima lezione installare i pacchetti knitr e RStoolbox
