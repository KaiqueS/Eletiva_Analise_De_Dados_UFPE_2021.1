library( tidyverse )
library( drc )
library( plotly )
library( zoo )
library( xts )

#'* Nos vídeos, vocês viram o exemplo com casos totais e novos casos. Agora, o desafio de vocês é replicar isso com outra variável da base. *

pagina <- 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'

dados_nacionais <- read.csv2( pagina, encoding='latin1', sep = ',')

dados_PE <- subset( dados_nacionais, state == 'PE')

dados_PE$date <- as.Date( dados_PE$date, format = "%Y-%m-%d")

dados_PE$dia <- seq( 1:length( dados_PE$date ) )

predicao_Dia = data.frame( dia = dados_PE$dia )
predicao_Seq = data.frame( dia = seq( max( dados_PE$dia ) + 1, max( dados_PE$dia ) + 180 ) )

predicao_Dia <- rbind( predicao_Dia, predicao_Seq )

# A variável de escolha foi o número de óbitos

fitLL <- drm( deaths ~ dia, fct = LL2.5( ), data = dados_PE, robust = 'mean' )

plot( fitLL, log = "", main = "Log logistic" )

predLL <- data.frame( predicao = ceiling( predict( fitLL, predicao_Dia ) ) )

predLL$data <- seq.Date( as.Date( '2020-03-12' ), by = 'day', length.out = length( predicao_Dia$dia ) )

predLL <- merge( predLL, dados_PE, by.x ='data', by.y = 'date', all.x = T )

plot_ly( predLL ) %>% add_trace( x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Casos - Predição" ) %>%
                      add_trace( x = ~data, y = ~totalCases, name = "Casos - Observados", mode = 'lines' ) %>%
                      layout( title = 'Predição de Casos de COVID 19 em Pernambuco', xaxis = list( title = 'Data', showgrid = FALSE ), 
                                                                                     yaxis = list( title = 'Casos Acumulados por Dia', showgrid = FALSE ), hovermode = "compare" )

dados_PE <- dados_PE %>% mutate( newCasesMM7 = round( rollmean( x = newCases, 7, align = "right", fill = NA ), 2 ) )

dados_PE <- dados_PE %>% mutate( newCasesL7 = dplyr::lag( newCases, 7 ) )

plot_ly( dados_PE ) %>% add_trace( x = ~date, y = ~newCases, type = 'scatter', mode = 'lines', name = "Novos Casos") %>%
                        add_trace( x = ~date, y = ~newCasesMM7, name = "Novos Casos MM7", mode = 'lines' ) %>%
                        layout( title = 'Novos Casos de COVID19 em Pernambuco', xaxis = list( title = 'Data', showgrid = FALSE ), 
                                                                                yaxis = list( title = 'Novos Casos por Dia', showgrid = FALSE ), hovermode = "compare" )

( serie_temporal <- xts( dados_PE$newCases, dados_PE$date ) )

str( serie_temporal )

autoplot( serie_temporal )

acf( serie_temporal )
