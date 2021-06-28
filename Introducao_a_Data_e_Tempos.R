library( lubridate )

#'* Criem um objeto próprio de data e tempo,*

data <- "2021-06-28 08:00:00"

#'* convertam pros três formatos de data e tempo,*

data_object <- as.Date( data )

conversao_POSIXCT <- as.POSIXct( data )

conversao_POSIXLT <- as.POSIXlt( data )

unclass( conversao_POSIXLT ) # observamos o POSIXlt no formato original (componentes de tempo)

#'* e façam pelo menos 3 extrações de componentes e/ou operações*

ano_data <- year( data_object )

mes_data <- month( data_object )

dia_data <- wday( data_object, label = T, abbr = T )

semana_data <- isoweek( data_object )

semana_epi_data <- epiweek( data_object )

data_object + hours( 6 )

data_object + dminutes( 90 )

intervalo_exemplo <- as.interval( conversao_POSIXCT, as.POSIXct( as.Date( "2021-07-15 16:40:00" ) )  )

now( ) %within% intervalo_exemplo