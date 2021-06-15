library( data.table )
library( funModeling ) 
library( tidyverse ) 
library( poliscidata )

banco <- poliscidata::world

matriz_sombra <- as.data.frame( abs( is.na( banco ) ) )

sem_missing <- matriz_sombra[ which( sapply( matriz_sombra, sd ) > 0 ) ]

cor( matriz_sombra )

cor( sem_missing )

cor( matriz_sombra, sem_missing, use = "pairwise.complete.obs" )

com_missing <- matriz_sombra[ which( sapply( matriz_sombra, sd ) > 0 ) ]

round( cor( com_missing ), 3 )
