install.packages( 'data.table' )
install.packages( 'ff' )
install.packages( 'ffbase' )

library( data.table )
library( ff )
library( ffbase )

setwd( "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1" )

caminho <- "Banco_de_dados.csv"

banco <- read.csv.ffdf( file = caminho )

Amostra <- banco[ sample( nrow( banco ), 100000) , ]

mean( Amostra$c )
median( Amostra$c )

summary( lm( c ~ ., Amostra ) )
