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

#DVI
#vediamo ora il DVI, la differenza tra la riflettanza nell’infrarosso vicino e quella nel rosso
defor1
#vediamo che è un'immagine a 8bit (255 max come valore di risoluzione per banda)
#è un indice che va da -255 a +255 per immagini a 8 bit. 
#a 16 bit il max è 65535

dvi1<-defor1$defor1.1-defor1$defor1.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")
#la vegetazione riflette molto nell'infrarosso, quindi dove vediamo i valori più alti di riflettanza abbiamo una maggiore copertura arborea

#facciamo la stessa cosa per defor2
defor2
dvi2<-defor2$defor2.1-defor2$defor2.2
plot(dvi2, col=cl, main="DVI at time 2")

#confrontiamo ora i due DVI con un "par"
par(mfrow=c(1,2))
plot(dvi1, col=cl)
plot(dvi2, col=cl)
#nella prima mappa abbiamo il dvi1, nella seconda mappa abbiamo il dvi2. 
#Se il dvi cala, nella prima mappa dovrei avere un valore alto:
#Es. 255(foresta pluviale) nella prima e 20 nella seconda -> Se faccio la differenza= 235. Si assiste ad un calo testimoniato dal colore giallo, suolo agricolo

#eseguiamo ora una differenza tra i due indici di vegetazione
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)
#dove la differenza è pià alta, parte in rosso. Dove è meno marcata, blu e bianca. 
#posso visualizzare le aree in cui la deforestazione è più marcata. 

#NDVI
#per confrontare immagini a bit differenti (risoluzioni radiometriche differenti)
#se applico NDVI ottengo valori che vanno da -1 a +1 e posso fare confronti

#il calcolo svolto è il seguente: (NIR-RED) / (NIR+RED)
ndvi1<- (defor1$defor1.1-defor1$defor1.2) / (defor1$defor1.1+defor1$defor1.2)
plot(ndvi1, col=cl)

ndvi2<- (defor2$defor2.1-defor2$defor2.2) / (defor2$defor2.1+defor2$defor2.2)
plot(ndvi2, col=cl)

#SPECTRALINDICES
#La funzione si potrebbe calcolare anche con RStoolbox::spectralIndices
#tramite la funzione spectralindex calcolo tutti gli indici e li metto tutti insieme
#nella firma spettrale ho la redslape (ha alta pendenza se la pianta sta bene)

vi1<-spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi1, col=cl)

vi2<-spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)
 
#facciamo poi la differenza e plottiamo
difndvi<- ndvi1-ndvi2
plot(difndvi, col=cld)

#worldwide NDVI
plot(copNDVI)
#funzione per cambiare valori in altri valori
#i pixel coi valori 253, 254, 255 (acqua) saranno settati come "NA"
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)
#levelplot è media di valori per riga e colonna, utilizzo pacchetto rasterVis
levelplot(copNDVI)
