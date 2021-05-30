library( data.table )
library( dplyr )
library( tidyverse )
library( vdemdata )
library( poliscidata )

vdem_amostra <- sample_n( vdem, size = 1000 ) %>% select( v2x_partipdem, v2x_liberal )

banco <- poliscidata::states

glimpse( banco )

banco_pivotado <- pivot_longer( data = banco, cols = c( union07, vep00_turnout ) )

glimpse( banco_pivotado )