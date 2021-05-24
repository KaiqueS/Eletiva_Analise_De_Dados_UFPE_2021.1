library( ff )
library( ffbase )
library( tidyverse )
library( rvest )
library( dplyr )
library( plyr )

setwd( "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1\\Bases_Exercicio_2" )

links_dos_bancos <- as.data.frame( read_html( "http://dados.recife.pe.gov.br/dataset/situacao-final-dos-alunos-por-periodo-letivo" ) %>%
                                   html_nodes( "[class='resource-url-analytics']" ) %>%
                                   html_attr( "href" ) )

colnames( links_dos_bancos ) <- "Links"

links_dos_bancos <- links_dos_bancos[ grep( "csv", links_dos_bancos$Links ), ]

for( url in links_dos_bancos ){
  
  download.file( url, destfile = basename( url ) )
}

path <- list.files( path = "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1\\Bases_Exercicio_2", pattern = "*.csv" )

lista_de_bancos <- lapply( path, function( x ) read.csv.ffdf( file = x, header = TRUE ) )

bancos_mergidos <- Reduce( ffdfrbind.fill, lista_de_bancos )

saveRDS( bancos_mergidos, "Situacao_Alunos_Mergidos.rds" )

rm( list = ls( ) )
