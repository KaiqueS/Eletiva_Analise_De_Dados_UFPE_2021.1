library( tidyverse )
library( vdemdata )

polity_online <- download.file( "http://www.systemicpeace.org/inscr/p5v2018.xls", "polity_online.xls", mode = 'wb' )

banco_polity <- readxl::read_xls( "polity_online.xls" )

banco_polity <- banco_polity %>% 
                select( polity2 ) %>%
                na.omit( )

banco_vdem <- vdem %>%
              select(  v2x_polyarchy ) %>%
              na.omit( )

colnames( banco_polity ) <- "Democracia"
colnames( banco_vdem ) <- "Democracia"

glimpse( banco_polity )
glimpse( banco_vdem )

banco_completo <- full_join( banco_polity, banco_vdem, by = "Democracia" )
