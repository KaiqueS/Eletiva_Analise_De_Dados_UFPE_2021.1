library( tidyverse )
library( dplyr )

sinistrosRecife2019Raw <- read.csv2( 'http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8' )

sinistrosRecife2019Raw_Copia <- read.csv2( 'http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8' )

glimpse( sinistrosRecife2019Raw )

Real_Time_Sinistros <- ( sinistrosRecife2019Raw_Copia$numero %in% sinistrosRecife2019Raw )

Sinitros_Incrementados <- ( sinistrosRecife2019Raw_Copia$numero %in% sinistrosRecife2019Raw )

setdiff( sinistrosRecife2019Raw_Copia, sinistrosRecife2019Raw )

sinistrosRecife2019Raw[ Sinitros_Incrementados, ]
