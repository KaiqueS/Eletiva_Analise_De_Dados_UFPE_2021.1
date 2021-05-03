install.packages( "microbenchmark" )
install.packages( "readxl" )

library( microbenchmark )
library( tidyverse )
library( plyr )
library( readxl )

setwd( "D:\\Trabalho\\Eletiva_Analise_De_Dados_UFPE_2021.1" )

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')
sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# exporta em formato nativo do R
saveRDS( sinistrosRecifeRaw, "sinistrosRecife.rds" )

# exporta em formato tabular (.csv) - padrÃ£o para interoperabilidade
write.csv2( sinistrosRecifeRaw, "sinistrosRecife.csv" )

# Exporta em formato excel csv2
write_excel_csv2( sinistrosRecifeRaw, "sinistrosRecife.xlsx" )

# compara os processos de exportação, usando a função microbenchmark
microbenchmark( a <- readRDS( 'sinistrosRecife.rds'), b <- read.csv2( 'sinistrosRecife.csv', sep = ';' ), times = 10L )

microbenchmark( a <- readRDS( 'sinistrosRecife.rds'), b <- readxl::read_xlsx( 'sinistrosRecife.xlsx' ), times = 10L )

teste <- readxl::read_xlsx( "sinistrosRecife.xlsx" )
