#my first code created in R

#install.packages("raster") 
library(raster)
#la funzione library richiama il pacchetto installato

setwd("C:/lab/")
#la funzione setwd dice a R da quale cartella prendere i dati

p224r63_2011<-brick("p224r63_2011_masked.grd")
#la funzione brick permette di importare dati raster in R
p224r63_2011

plot(p224r63_2011)
#la funzione plot permette di visualizzare i dati

cl<-colorRampPalette(c("black","grey","light grey")) (100)
#la funzione colorRampPalette permette di plottare le singole bande e cambiarne il colore
#la nostra gamma di colori comprenderà nero, grigio e bianco, che vanno inseriti tra virgolette
#usiamo la c per dire ad R che racchiudiamo i colori per lo stesso oggetto
#(100) è il numero di livelli tra un colore e l'altro

plot(p224r63_2011, col=cl)
#con questa funzione abbiamo cambiato la scala di colori con quella scelta

###DAY 2

#colour change -> new
cl<-colorRampPalette(c("green","yellow","red"))(100)
#bisogna sempre associare la funzione colorRampPalette ad un oggeto

plot(p224r63_2011, col=cl)
#col è un argomento della funzioe plot che serve a definire i colori, mettiamo poi = l'oggetto cl per cambiare il colore

###DAY 3

#Bande satellite Landsat
#B1: blu
#B2: verde
#B3: rosso
#B4: infrarosso vicino
#B5: infrarosso medio
#B6: infrarosso termico
#B7: infrarosso medio

#rimuovo la finestra grafica che si è aperta prima con la funzione dev.off()
dev.off()

#es. voglio plottare solo una banda, la B1 
#la banda del blu si chiama B1_sre
#per mostrare solo la B1 dell'immagine uso il simbolo $ che lega questi due oggetti
plot(p224r63_2011$B1_sre)
#verrà plottata la B1 con i colori di default della banda

#esercizio: cambiare colore della sola B1
#plotto l'immagine ma indicando con quale colorramppalette voglio visualizzarla
plot(p224r63_2011$B1_sre, col=cl)

#per visualizzare due bande nello stesso grafico uso la funzione par
#indico la funzione par poi mf (multiframe) e row(per righe e colonne) con c indico quante righe e quante colonne voglio
#successivamente plotto le singole bande e mi verranno visualizzate nello stesso grafico

# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

#par(mfcol... se voglio indicare prima il numero di colonne (invece con par(mfrow... indico prima le righe))

#esercizio: plottare le prime 4 bande di Lancet
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#visualizzate in 2 righe e 2 colonne
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#visualizzare le 4 bande in una griglia 2x2 con colori scelti
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre, col=cl)
plot(p224r63_2011$B2_sre, col=cl)
plot(p224r63_2011$B3_sre, col=cl)
plot(p224r63_2011$B4_sre, col=cl)

#cambiare colore alle singole bande e plottarle insieme con i colori selezionati

par(mfrow=c(2,2))

clb<- colorRampPalette(c("dark blue","blue","light blue")) (200)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green")) (200)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink")) (200)
plot(p224r63_2011$B2_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow")) (200)
plot(p224r63_2011$B2_sre, col=clnir)

###DAY 4
#Visualizzare i dati con il plotting RGB

#Bande satellite Landsat
#B1: blu
#B2: verde
#B3: rosso
#B4: infrarosso vicino
#B5: infrarosso medio
#B6: infrarosso termico
#B7: infrarosso medio

#RGB
#Vedere l'immagine a colori naturali (spettro visibile)
#monto le bande rossa, verde e blu nelle rispettive componenti dell'RGB
#uso la funzione plotRGB 
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
#uso stretch per allargare il range di riflettanza tra 0 e 1 (magari erano tra 0.4 e 0.5)

#scorriamo di 1 tacca le bande per le componenti RGB
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
#ora invertiamo una componente
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
#ancora
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe, con la funzione par
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#creare un pdf con la funzione pdf
pdf("ilmioprimopdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()
#non apparirà un grafico, ma verrà salvato (dopo aver fatto il dev.off) nella cartella della setwd

#histogram stretch
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#con l'histogram stretch ho modo di visualizzare ancoa meglio le sfumature che invece con lo stretch lineare non rieso a vedere

#plot con par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#install.packages("RStoolbox")
#installato RStoolbox

###DAY 5
#immagine del 1988 "p224r63_1988_masked.grd"

library(raster)
setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

# inseriamo anche l'immagine del 1988 (multitemporal set)

p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988
#facciamo ora un plot dell'immagine del 1988
plot(p224r63_1988)

#facciamo ora un plot in RGB con le varie bande associate
#Bande satellite Landsat
#B1: blu
#B2: verde
#B3: rosso
#B4: infrarosso vicino
#B5: infrarosso medio
#B6: infrarosso termico
#B7: infrarosso medio

plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
#abbiamo associato per ogni componente la banda del colore corrispondente, così da avere colori "naturali"
#il violetto che appare sono dei corpuscoli causati dal rumore

plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
#così vediamo il NIR col rosso 
#quindi la vegetazione ci appare rossa

#confrontiamo ora le due immagini 2011 e 1988
#usiamo la funzione par

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

#plottiamo in una tabella 2x2 con confronto tra 1988 e 2011 usando uno stretch lin e hist
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")

pdf("1988_2011_lin_stretch.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
dev.off()
#dev.off() serve a chiudere il file così da salvarlo

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


#LEZIONE DEL 14/04/21

#il metadato è la descrizione del dato che andiamo ad utilizzare
#Copernicus Global Land Service
#tanti dataset per aree tematiche

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

#LEZIONE 16/04/21

#R_code_knitr

#install.packages("knitr")

setwd("C:/lab/")
library(knitr)

#con knitr r può usare un codice esterno, importarlo in r e generare un report
#questo report verrà salvato dentro alla cartella dove abbiamo preso il codice precedente

#prendiamo tutto il codice di una precedente lezione e lo incolliamo in un qualsiasi gestore di testo
#salviamo il file nella cartella C:/lab/
#IMPORTANTE: non dev'esserci dev.off() nel codice del file di testo

#andiamo ad usare la funzione "stitch"
#come primo argomento da dare alla funzione è come si chiama il codice che abbiamo appena salvato
#in questo caso è "r_code_greenland.txt"
#NOTA BENE: va indicata anche l'estenzione nel nome del file (".txt")

#altro argomento è il temeplate (in questo caso "misc")
#poi va messo il nome del pacchetto da utilizzare ("knitr")

stitch("C:/lab/r_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

#si genererà un file ".tex" nella cartella "C:/lab/"
#stitch salva anche una cartella con le singole immagini che vengono generate dal codice (cartella "figure")
#il prossimo passaggio è convertire questo file .tex in un pdf

#useremo un sito (Overleaf) per fare questa conversione
#una volta creato l'account overleaf
#incolliamo il contenuto del file .tex generato (aprendolo con un qualunque gestore di testo)
#una volta incollato premiamo "Ricompila"
#a questo punto otteniamo il pdf (ma senza figure)

#per visualizzare le figure
#in overleaf creo la cartella "figure" e gli carico gli stessi file della cartella figure che si trova in C:/lab/
#digito ricompila e ora il codice ha modo di pescarsi le immagini da inserie nel pdf

#R_code_classification.r
#LEZIONE DEL 21/04/21

library(raster)
library(RStoolbox)

setwd("C:/lab/")

#andiamo a scaricare immagini del Solar Orbiter (su virtuale)
#salviamo il file Solar_Orbiter_s_first_views_of_the_Sun_pillars
#l'immagine è già create come RGB e non abbiamo accesso alle bande originali

#carichiamo l'immagine con la funzione "brick" (libreria raster)
#le librerie si caricano sempre per prime (così si sa da subito quali stiamo usando) 

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#ora visualizziamo l'immagine 
so
#immagine a 8bit

#ora eseguiamo un plottaggio in RGB
#mettendo rosso nel primo livello, verde nel secondo e blu nel terzo
#come stretch usiamo quello lineare

plotRGB(so,1, 2, 3, stretch="lin")

#vediamo distintamente tre "classi" nell'immagine
#ad alta, intermedia e a bassa energia
#vediamo ora di classificarle


 #attraverso il processo di "maximum-likelyhood" analizziamo pixel per pixel 
 #e lo assegnamo ad una classe (per affinità ad una classe rispetto ad un'altra)
 #sfrutta training site formati da gruppi di pixel
 #usiamo una funzione del pacchetto RStoolbox -> unsuperClass
 
 #procediamo alla classificazione
  #Unsupervised Classification (unsuperClass)
  #i training site vengono definiti randomicamente dal software
 
 #nel caso di questa immagine del solar orbiter noi riconosciamo tre livelli energetici principali
 #di conseguenza nell'argomento della funzione diciamo al software che vogliamo identificare 3 classi (training site)
 
 soc <- unsuperClass(so, nClasses=3)
 
 #la funzione ha creato in uscita tutta la parte sul modello
 #e in più ha creato la mappa
 #a questo punto possiamo plottare l'immagine classificata e in patticolare la mappa annessa
 #per plottare entrambe allora usiamo il simbolo $
 
 plot(soc$map)
 
 #vediamo tre classi, ognuna con un colore associato
 
 #le mappe prodotte dai colleghi è possibile che siano leggermente diverse tra loro
 #questo perchè la classificazione essendo non supervisionata è a cura del software
 #possono quindi esserci lievi variazioni
 
 #per fare si che la classificazione sia sempre la stessa si usa la funzione "setSeed"

#proviamo ad aumentare il numero delle classi e vedere cosa vede il software
#per assurdo proviamo 20 classi

#Unsupervised Classification with 20 Classes
soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map)

#in generale è importante avere più o meno chiaro il numero di classi che ci aspettiamo


#nella Supervised Classification si vanno invece a selezionare i singoli pixel
#nella classificazione Object Oriented si discriminano anche le forme (tecnologia riconoscimento facciale)


#esercitazione scaricando un'immagine a piacere
raf <- brick("raf.jpg")
plotRGB(raf,1, 2, 3, stretch="lin")
rafc <- unsuperClass(raf, nClasses=20)
plot(rafc$map)


#GRAND CANYON

#LEZIONE DEL 23/04/21

#esamineremo un RGB già processato
#attraverso la riflettanza riusciremo a classificare la mineralogia del terreno
#scarichiamo l'immagine del Solar Orbiter



library(raster)
library(RStoolbox)
setwd("C:/lab/")

#adesso carichiamo l'immagine
#è un RGB formato da 3 livelli, quindi useremo la funzione brick

gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")

#visualizziamo l'immagine RGB con la funzione plotRGB

plotRGB(gc, r=1, g=2, b=3, stretch="lin")

#se voglio "estendere" la visione dell'immagine posso usare un histogram stretch
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
#in questo modo usiamo tutte le gamme possibili per visualizzare l'immagine

#procediamo alla classificazione dell'immagine
#sempre attraverso il Maximum-Likelyhood 
#verranno selezionate dal software delle classi di pixel (il numero glielo diamo noi)
#e ogni pixel verrà assegnato ad una classe dal software

#usiamo la funzione unsuperClass (unsupervised classification) del pacchetto RStoolbox

gcc2<-unsuperClass(gc,nClasses=2)

gcc2

#siamo interessati a plottare sia le classi che la mappa che verranno generati (usiamo il simbolo $)
#eseguiamo il plot
plot(gcc2$map)

#a questo punto proviamo ad aumentare il numero di classi
gcc4<-unsuperClass(gc,nClasses=4)
plot(gcc4$map)

#R_code_classification.r
#LEZIONE DEL 21/04/21

library(raster)
library(RStoolbox)

setwd("C:/lab/")

#andiamo a scaricare immagini del Solar Orbiter (su virtuale)
#salviamo il file Solar_Orbiter_s_first_views_of_the_Sun_pillars
#l'immagine è già create come RGB e non abbiamo accesso alle bande originali

#carichiamo l'immagine con la funzione "brick" (libreria raster)
#le librerie si caricano sempre per prime (così si sa da subito quali stiamo usando) 

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#ora visualizziamo l'immagine 
so
#immagine a 8bit

#ora eseguiamo un plottaggio in RGB
#mettendo rosso nel primo livello, verde nel secondo e blu nel terzo
#come stretch usiamo quello lineare

plotRGB(so,1, 2, 3, stretch="lin")

#vediamo distintamente tre "classi" nell'immagine
#ad alta, intermedia e a bassa energia
#vediamo ora di classificarle


 #attraverso il processo di "maximum-likelyhood" analizziamo pixel per pixel 
 #e lo assegnamo ad una classe (per affinità ad una classe rispetto ad un'altra)
 #sfrutta training site formati da gruppi di pixel
 #usiamo una funzione del pacchetto RStoolbox -> unsuperClass
 
 #procediamo alla classificazione
  #Unsupervised Classification (unsuperClass)
  #i training site vengono definiti randomicamente dal software
 
 #nel caso di questa immagine del solar orbiter noi riconosciamo tre livelli energetici principali
 #di conseguenza nell'argomento della funzione diciamo al software che vogliamo identificare 3 classi (training site)
 
 soc <- unsuperClass(so, nClasses=3)
 
 #la funzione ha creato in uscita tutta la parte sul modello
 #e in più ha creato la mappa
 #a questo punto possiamo plottare l'immagine classificata e in patticolare la mappa annessa
 #per plottare entrambe allora usiamo il simbolo $
 
 plot(soc$map)
 
 #vediamo tre classi, ognuna con un colore associato
 
 #le mappe prodotte dai colleghi è possibile che siano leggermente diverse tra loro
 #questo perchè la classificazione essendo non supervisionata è a cura del software
 #possono quindi esserci lievi variazioni
 
 #per fare si che la classificazione sia sempre la stessa si usa la funzione "setSeed"

#proviamo ad aumentare il numero delle classi e vedere cosa vede il software
#per assurdo proviamo 20 classi

#Unsupervised Classification with 20 Classes
soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map)

#in generale è importante avere più o meno chiaro il numero di classi che ci aspettiamo


#nella Supervised Classification si vanno invece a selezionare i singoli pixel
#nella classificazione Object Oriented si discriminano anche le forme (tecnologia riconoscimento facciale)


#esercitazione scaricando un'immagine a piacere
raf <- brick("raf.jpg")
plotRGB(raf,1, 2, 3, stretch="lin")
rafc <- unsuperClass(raf, nClasses=20)
plot(rafc$map)


#GRAND CANYON

#LEZIONE DEL 23/04/21

#esamineremo un RGB già processato
#attraverso la riflettanza riusciremo a classificare la mineralogia del terreno
#scarichiamo l'immagine del Solar Orbiter



library(raster)
library(RStoolbox)
setwd("C:/lab/")

#adesso carichiamo l'immagine
#è un RGB formato da 3 livelli, quindi useremo la funzione brick

gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")

#visualizziamo l'immagine RGB con la funzione plotRGB

plotRGB(gc, r=1, g=2, b=3, stretch="lin")

#se voglio "estendere" la visione dell'immagine posso usare un histogram stretch
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
#in questo modo usiamo tutte le gamme possibili per visualizzare l'immagine

#procediamo alla classificazione dell'immagine
#sempre attraverso il Maximum-Likelyhood 
#verranno selezionate dal software delle classi di pixel (il numero glielo diamo noi)
#e ogni pixel verrà assegnato ad una classe dal software

#usiamo la funzione unsuperClass (unsupervised classification) del pacchetto RStoolbox

gcc2<-unsuperClass(gc,nClasses=2)

gcc2

#siamo interessati a plottare sia le classi che la mappa che verranno generati (usiamo il simbolo $)
#eseguiamo il plot
plot(gcc2$map)

#a questo punto proviamo ad aumentare il numero di classi
gcc4<-unsuperClass(gc,nClasses=4)
plot(gcc4$map)

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


#(con 3 componenti abbiamo spiegato il 99,9% della variabilità)
#la prima componente è sempre quella con più informazioni
#in "proportion of variance" vediamo il contributo della variabilità per ogni componente

#adesso facciamo il plot della mappa
plot(p224r63_2011res_pca$map)
#ci aspettiamo di vedere tante informazioni nella prima componente (PC1) e via via sempre meno nelle altre (nell'ultima solo rumore)

p224r63_2011res_pca
#vediamo un attimo le info che abbiamo dal dataset usato ora:
#vediamo la "$call" , cioè la funzione usata (rasterPCA in questo caso)
#associato a $ abbiamo gli altri elementi con le rispettive informazioni

#a questo punto plottiamo in RGB tutta l'immagine
plotRGB(p224r63_2011res_pca$map, r=1,g=2,b=3, stretch="Lin")

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
#come l’NDV varia all’interno del pianeta attraverso la funzione Levelplot

#COPNDVI 
#una media dei valori  dal  1999 fino 2017 per ogni 21 di giugno dell'NDVI a livello mondiale
#il pacchetto rasterdiv -> cioè rasterdiversity (dentro ha il dataset copNDVI) 
# install.packages("rasterdiv")

plot(copNDVI)

#"cbind" argomento funzione per cambiare valori in altri valori (o non valori)
#usiamo la funzione "reclassify"
#i pixel coi valori 253, 254, 255 (acqua) saranno settati come "NA"
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

#ora riplottiamo
plot(copNDVI)
#levelplot è media di valori per riga e colonna, utilizzo pacchetto rasterVis
library(rasterVis)

levelplot(copNDVI)

#vediamo la varianza e come varia tra latitutine e longitudine
#vediamo che abbiamo un picco a livello dell'equatore (maggiore luce)

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



#CONTINUO

setwd("C:/lab/EN")
library(raster)
#scaricare cartella "EN"

EN01 <- raster("EN_0001.png")
cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN01, col=cls)

EN13 <- raster("EN_0013.png")

par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")
