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
#in questo caso è "r_code_greenland.r"

#altro argomento è il temeplate (in questo caso "misc")
#poi va messo il nome del pacchetto da utilizzare ("knitr")

stitch("C:/lab/r_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

