install.packages( "plyr" )

library( tidyverse )
library( plyr )

# Adicionando mais um ano de acidentes de trânsito
sinistrosRecife2019Raw <- read.csv2( 'http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8' )

glimpse( sinistrosRecife2019Raw )

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# Unindo o ano de 2019 aos demais anos
sinistrosRecifeRaw <- rbind.fill( sinistrosRecife2019Raw, sinistrosRecifeRaw )

glimpse( sinistrosRecifeRaw )

sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# Transformando coluna em fator
sinistrosRecifeRaw$sentido_via <- as.factor( sinistrosRecifeRaw$sentido_via )
