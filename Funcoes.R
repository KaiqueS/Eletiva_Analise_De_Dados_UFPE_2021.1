library( tidyverse )
library( poliscidata )
library( scales )
library( ggbeeswarm )


banco <- as.data.frame( world )

str( banco )

funcao <- function( dataset ){
  
  for( i in nrow( dataset ) ){
    
      print( dataset[ i, ] )
  }
}

nrow( banco )
ncol( banco )

funcao( banco )
