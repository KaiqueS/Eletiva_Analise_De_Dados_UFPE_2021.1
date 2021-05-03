library( tidyverse )

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecifeRaw <- rbind( sinistrosRecife2020Raw, sinistrosRecife2021Raw )

naZero <- function( x ) {

    x <- ifelse( is.na( x ), 0, x )
}


naZero( sinistrosRecifeRaw )

glimpse( sinistrosRecifeRaw )

object.size( sinistrosRecife2020Raw )
object.size( sinistrosRecife2021Raw )

# Esse é o maior objeto
object.size( sinistrosRecifeRaw )
