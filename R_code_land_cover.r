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
