library( tidyverse )
library( curl )
library( lubridate )
library( fuzzyjoin )
library( dplyr )
library( compare )
library( stringi )
library( readxl )

setwd( "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1" )

#'* 1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html. *

base_covid_PE <- read.csv( curl( url = "https://dados.seplag.pe.gov.br/apps/basegeral.csv", open = "", handle = new_handle( ) ), sep = ";", encoding = "UTF-8" )

#'* 2. Calcule, para cada município do Estado, o total de casos confirmados e o total de óbitos por semana epidemiológica *
#'* [atenção, você terá de criar uma variável de semana epidemiológica com base na data].*

base_covid_PE <- base_covid_PE %>% mutate( semana_epidemiologica = epiweek( dt_notificacao ) )

base_covid_PE %>% count( semana_epidemiologica, classe )

#'* 3. Enriqueça a base criada no passo 2 com a população de cada município, usando a tabela6579 do sidra ibge. *

base_covid_PE$municipio <- tolower( base_covid_PE$municipio )

base_covid_PE$municipio <- str_to_title( base_covid_PE$municipio )

tabela6579 <- as.data.frame( readxl::read_xlsx( "tabela6579.xlsx" ) )

colnames( tabela6579 ) <- c( "municipio", "populacao" )

tabela6579 <- tabela6579[ grepl( "PE", tabela6579$municipio ), ]

tabela6579$municipio <- gsub( "\\s*\\([^\\)]+\\)", "", tabela6579$municipio )

tabela6579$municipio <- stri_trans_general( tabela6579$municipio, "Latin-ASCII" )

base_covid_PE <- left_join( base_covid_PE, tabela6579, by = "municipio" )

#'* 4. Calcule a incidência (casos por 100.000 habitantes) e letalidade (óbitos por 100.000 habitantes) por município a cada semana epidemiológica. *

base_covid_PE <- base_covid_PE %>% 
                 mutate( confirmados = case_when( classe == "CONFIRMADO" ~ 1,
                                                  classe != "CONFIRMADO" ~ 0 ) )

base_covid_PE <- base_covid_PE %>% 
                 mutate( obito = case_when( !is.na( dt_obito ) ~ 1,
                                             is.na( dt_obito ) == NA ~ 0 ) )

incidencia <- aggregate( base_covid_PE$confirmados ~ base_covid_PE$municipio + base_covid_PE$semana_epidemiologica, data = base_covid_PE, FUN = sum )

colnames( incidencia ) <- c( "municipio", "semana", "confirmados" )

incidencia <- left_join( incidencia, tabela6579, by = "municipio" )

incidencia <- incidencia %>% mutate( incidencia = ( as.numeric( incidencia$confirmados ) * 100000 ) / as.numeric( incidencia$populacao ) )

obitos <- aggregate( base_covid_PE$obito ~ base_covid_PE$municipio + base_covid_PE$semana_epidemiologica, data = base_covid_PE, FUN = sum )

colnames( obitos ) <- c( "municipio", "semana", "obitos" )

obitos <- left_join( obitos, tabela6579, by = "municipio" )

obitos <- obitos %>% mutate( obitos = ( as.numeric( obitos ) * 100000 ) / as.numeric( populacao ) )
