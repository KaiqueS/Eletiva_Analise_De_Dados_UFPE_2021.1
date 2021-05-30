library( tidyverse )
library( vdemdata )
library( funModeling )

# Self-note: Sempre lembrar de fazer isso ao usar o VDEM! Não quero tacar fogo no computador.
vdem_amostra <- sample_n( vdem, size = 1000 ) %>% select( v2x_partipdem, v2x_liberal, v2xeg_eqdr )

glimpse( vdem_amostra )
status( vdem_amostra )
freq( vdem_amostra )

plot_num( vdem_amostra )

profiling_num( vdem_amostra )