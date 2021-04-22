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




