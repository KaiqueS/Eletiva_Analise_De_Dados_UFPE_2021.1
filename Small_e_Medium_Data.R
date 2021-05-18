install.packages( "tidyverse" )
install.packages( "devtools" )

library( tidyverse )
library( devtools )
library( data.table )

setwd( "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1" )

devtools::install_github( "vdeminstitute/vdemdata" )

library( vdemdata )

banco <- 'banco_vdem.csv'

system.time( extracaoLD1 <- read.csv2( banco ) )

system.time( extracaoLD1 <- fread( banco ) )
