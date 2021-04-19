install.packages( "tidyverse" )
install.packages( "poliscidata" )
install.packages( "scales" )
install.packages( "ggbeeswarm" )

library( tidyverse )
library( poliscidata )
library( scales )
library( ggbeeswarm )


banco <- world

banco %>% group_by( democ ) %>%
          summarise( media = mean( gdppcap08, na.rm = T ),
                     mediana = median( gdppcap08, na.rm = T ),
                     desvio = sd( gdppcap08, na.rm = T ) )

ggplot( banco, aes( x = gdppcap08, y = democ ) ) +
        geom_boxplot( ) + 
        stat_summary( fun = mean, colour = "blue", geom = "point", 
                      shape = 18, size = 3, show.legend = FALSE )


banco_states <- states %>% select( obama2012, conpct_m, hs_or_more, prcapinc,
                                   blkpct10, south, religiosity3, state )

glimpse( banco_states )
summary( banco_states )
head( banco_states )
tail( banco_states )
str( banco_states )

banco_nes <- nes %>% select( obama_vote, ftgr_cons, dem_educ3, income5, 
                             black, south, relig_imp, sample_state )

glimpse( banco_nes )
summary( banco_nes )
head( banco_nes )
tail( banco_nes )
str( banco_nes )