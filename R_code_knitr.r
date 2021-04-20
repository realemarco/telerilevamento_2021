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
