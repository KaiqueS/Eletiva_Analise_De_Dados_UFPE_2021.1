library( tidyverse )
library( drc )
library( plotly )
library( zoo )
library( xts )
library( curl )
library( Hmisc )
library( VIM )
library( data.table )
library( dplyr )
library( TTR )
library( runner )
library( stringr )

#'* 1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html*

base_covid_PE <- read.csv( curl( url = "https://dados.seplag.pe.gov.br/apps/basegeral.csv", open = "", handle = new_handle( ) ), sep = ";", encoding = "UTF-8" )

#'* 2. Corrija os NAs da coluna sintomas através de imputação randômica *

# Recodificar os NA's. No banco raw, temos que transformar os "" em NA's.

base_covid_PE <- base_covid_PE %>%
                 mutate( sintomas = na_if( sintomas, "" ) ) %>%
                 mutate( sintomas = impute( sintomas, "random" ) )

#'* 3. Calcule, para cada município do Estado, o total de casos confirmados e negativos *

base_covid_PE %>% count( municipio, classe )

#'* 4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos casos confirmados e negativos tiveram tosse como sintoma *

base_covid_PE <- base_covid_PE %>% 
                 mutate( inclui_tosse = case_when( grepl( "TOSSE", sintomas, fixed = TRUE ) == TRUE ~ 1,
                                                   grepl( "TOSSE", sintomas, fixed = TRUE ) == FALSE ~ 0 ) )

base_covid_PE %>% count( classe, inclui_tosse )

#'* 5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados e negativos *

base_filtrada <- subset( base_covid_PE, base_covid_PE$dt_notificacao > "2021-06-18" & base_covid_PE$dt_notificacao <= "2021-06-26" )

media_confirmados <- mean( base_filtrada$classe == "CONFIRMADO" )
media_negativos <- mean( base_filtrada$classe == "NEGATIVO" )