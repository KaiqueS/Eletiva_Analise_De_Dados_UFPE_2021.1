library( data.table )
library( poliscidata )
library( tidyverse )
library( ggthemes )
library( graphics )
library( vcd )

banco <- as.data.table( world )

banco[ , lm( formula = gdppcap08 ~ dem_score14, data = banco ) ]
