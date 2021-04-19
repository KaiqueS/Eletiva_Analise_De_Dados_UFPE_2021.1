install.packages( "tidyverse" )
install.packages( "poliscidata" )
install.packages( "scales" )
install.packages( "ggbeeswarm" )

library( tidyverse )
library( poliscidata )
library( scales )
library( ggbeeswarm )


banco <- world

for( i in 1:15 ){
  
  for( j in 1:5 ){
    
    print( banco[ i, j ] )
  }
}