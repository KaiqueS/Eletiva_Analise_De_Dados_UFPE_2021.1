library( tidyverse )
library( poliscidata )
library( scales )
library( ggbeeswarm )


banco <- as.data.frame( world )

glimpse( banco )

str( banco$dem_rank14 )

media_dem_rank14 <- lapply( banco[ 4, ], FUN = mean )

media_dem_rank14
