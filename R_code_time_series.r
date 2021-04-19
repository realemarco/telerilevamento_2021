#time series analysis
#Greenland increase of temperature
#data and code from Emanuela Cosma

library(raster)
setwd("C:/lab/greenland")
#essendo i dati nella cartella greenland, settando la wd dobbiamo mettere anche il nome di questa cartella

#nei dataset che andremo ad importare non avremo i valori di riflettanza ma una stima della temperatura superficiale (LST di Copernicus)
#LST: Land Surface Temperature

#dato che importeremo singoli dati e non tutto il dateset non useremo la funzione brick
#useremo la funzione raster (nel pacchetto raster)
#prima di tutto diamo un nome ai file e poi importiamo con la funzione raster
lst_2000 <- raster("lst_2000.tif")

#plottiamo il dataset
plot(lst_2000)

#importiamo la seconda immagine e la plottiamo
lst_2005 <- raster("lst_2005.tif")
plot(lst_2005)

#queste immagini sono codificate a 16 bit
# 2^16 = 65535 valori possibili
#quindi anche se hanno dimensioni di 4428595 pixel comunque i valori possibili sono 65535 (alcuni valori si ripetono)
#questo comporta un alleggerimento del file che se avesse usato i decimali sarebbe ben più pesante (ogni pixel valore diverso)
#per convertire i valori dei bit in valori di temperatura si usano dei tabulati
#per fare la conversione si usa il metadato

#ora importiamo le altre immagini 
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#creiamo un miltipanel con la funzione par con tutte e quattro le immagini
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#metodo per imparare ad importare tutte le immagini insieme
#fino ad ora le abbiamo importate manualmente una ad una

#funzione chiave a questo scopo è "lapply"
#permette di applicare una certa funzione ad una lista di file
#es: lapply(lista di file, funzione da applicare)

#la lista di file si fa con la funzione "list.files"
#es: rlist <- list.files(pattern="lst")
#il pattern spiega al software quali file considerare usando un elemento comune nel nome del file
#il pattern sarebbe la parte comune nel nome tra i diversi file (in questo caso "lst")

rlist<-list.files(pattern="lst")
rlist
#vedremo tutti i file presenti in lista

#ora applichiamo lapply
import<-lapply(rlist,raster)
#do il nome import ma il nome non è importante
import
#così vedo tutti i file importati con la funzione raster

#ora impacchettiamo questi file che fin'ora sono separati
#usiamo la funzione "stack"
#nel pacchetto raster permette di creare un gruppo di file raster

#creo un gruppo chiamandolo Temperature Greenland (TGr)
TGr<-stack(import)

#questo aiuta, ad esempio, in caso di plottaggio per avere tutti i dati insieme

TGr
#la stessa cosa si aveva nelle bande della scorsa immagine satelliatare (B1,B2,B3...)
#adesso abbiamo fatto lo stesso processo che ha portato alla creazione di un'immagine con più livelli

plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin") 
#con questo plottaggio avremo la sovrapposizione di tre immagini insieme (2000,2005,2010)
#nel primo livello lst_2000 (red)
#nel secondo ho lst_2005 (green)
#nel terzo ho inserito lst_2010 (blue)
#vedendo nell'immagine maggiormente i blu, questo potrebbe indicare che ho valori più alti nel 2010

 #facciamo un plot ma mettendo anche l'immagine del 2015
plotRGB(TGr, 2, 3, 4, stretch="Lin") 
#anche qui il blu è predominante, quindi anche qui l'immagine più recente (stavolta 2015) ci da valori più alti


#per finire installiamo il pacchetto rasterVis
#install.packages("rasterVis")

###LEZIONE DEL 09/04/21

#rasterVis: per visualizzazioni di file raster

library(raster)
library(rasterVis)

setwd("C:/lab/greenland")
    
rlist <- list.files(pattern="lst")
rlist


import <- lapply(rlist,raster)
import


TGr <- stack(import)
TGr

#abbiamo ricaricato i file della volta scorsa

#facciamo ora un levelplot

levelplot(TGr)
levelplot(TGr$lst_2000)
#levelplot(TGr$lst_2000) serve per visualizzare un singolo livello
#per ogni pixel abbiamo un valore di temperatura
#per ogni colonna viene fatta una media dei valori e queste medie vengono riportate nel grafico sopra l'immagine

#cambiamo i colori usando la colorRampPalette
levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

#l'argomento su levelplot per cambiare colore non è col ma col.regions
levelplot(TGr, col.regions=cl)

#la differenza tra levelplot e la semplice funzione plot:
#con plot si ha per ogni immagine una legenda (che ruba spazio) e generalmente è meno ordinato di levelplot

#possiamo agire sui nomi delle singole mappe (titoli)
#i singoli strati di uno stack si chiamano attributi
#abbiamo quattro attributi (lst_2000, lst_2005, lst_2010, lst_2015)

#possiamo cambiare i nomi degli attributi usando l'argomento "names.attr" della funzione levelplot
levelplot(TGr,col.regions=cl,main="Summer land surface temperature", names.attr=c("July 2000","July 2005","July 2010","July 2015"))
#siccome sono quattro blocchi (vettore di quattro cose diverse) devo mettere la "c" davanti
#con l'argomento "main" inseriamo il titolo



#melt
#dati sulla copertura di ghiaccio da satellite usando le microonde (non assorbite dal ghiaccio)

#carichiamo i file della cartella melt usando list.files 

meltlist<-list.files(pattern="melt")
meltlist

#usiamoora lapply alla lista appena creata e applichiamogli la funzione raster
meltimport<-lapply(meltlist, raster)
meltimport

#ora raggruppiamo i file con la funzione stack
melt<-stack(meltimport)
melt
#plottiamo con levelplot
levelplot(melt)
#vediamo i valori dello scoglimento dei ghiacci
#più alto è il valore maggiore sarà lo scioglimento

#abbiamo una matrice di dati (una matrice di pixel) con dei valori che rappresentano il tasso di scioglimento
#nei diversi anni per lo stesso pixel ho valori diversi 
#allora facciamo la sottrazione dei valori per gli stessi pixel su matrici diverse (sui file dei diversi anni)
#2007 meno 1979 ci da la differenza

#facciamo la differenza tra le due immagini
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
#mettiamo $ per identificare il file che ci interessa in mezzo allo stack
#plottiamo ora i file e modifichiamo i colori

clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
#in questo grafico, tutte le zone rosse sono quelle in cui dal 2007 al 1979 (i due estremi temporali)
#c'è stato uno scioglimento del ghiaccio maggiore
#perchè abbiamo soltato il valore dello scioglimento del 2007 a quello del 1979

#facciamo ora un levelplot di melt_amount
levelplot(melt_amount, col.regions=clb)

#per prossima volta installare pacchetto knitr

