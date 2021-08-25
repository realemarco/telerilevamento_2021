#CONTINUO LEZIONE DEL 28/04

library(raster)
setwd("C:/lab/")

#dopo aver scaricato le due immagini (defor1 e defor2) le importiamo
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#proseguiamo col plottaggio:
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")


