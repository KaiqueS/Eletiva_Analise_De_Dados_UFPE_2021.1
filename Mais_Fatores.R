library( poliscidata )
library( ade4 )
library( arules )
library( forcats )
library( tidyverse )

banco <- poliscidata::world

banco$dem_score14 <- as.integer( banco$dem_score14 )

banco$dem_score14 <- discretize( banco$dem_score14, method = "interval", breaks = 3, labels = c( "anocracia", "poliarquia", "democracia" ) )

glimpse( banco$dem_score14 )

banco$dem_score14