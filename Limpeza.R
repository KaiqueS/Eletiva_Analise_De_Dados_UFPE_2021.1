library( tidyverse )
library( vdemdata )

polity_online <- download.file( "http://www.systemicpeace.org/inscr/p5v2018.xls", "polity_online.xls", mode = 'wb' )

banco_polity <- readxl::read_xls( "polity_online.xls" )

banco_polity <- banco_polity %>% 
                select( country, year, polity2 ) %>%
                na.omit( )
