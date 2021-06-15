library( data.table )
library( tidyverse )
library( vdemdata )
library( Hmisc )
library( VIM )

bancoDT <- vdem %>% setDT( )

quantidade_na <- sapply( bancoDT, function( y ) sum( length( which( is.na( y ) ) ) ) )
quantidade_na <- data.frame( quantidade_na )

colnames( quantidade_na ) <- "Contagem"

# Encontrar a variável com o maior número de missings
maior_missing <- rownames( quantidade_na )[ which.max( quantidade_na$Contagem ) ]

index_na <- is.na( index_na <- is.na( bancoDT$v3elupvtlg ) )

summary( bancoDT$v3elupvtlg )

bancoDT$v3elupvtlg <- impute( bancoDT$v3elupvtlg, fun = mean )
bancoDT$v3elupvtlg <- impute( bancoDT$v3elupvtlg, fun = median )

summary( bancoDT$v3elupvtlg )

is.imputed( bancoDT$v3elupvtlg )

bancoDT <- vdem %>% setDT( )

( bancoDT$v3elupvtlg <- impute( impute( bancoDT$v3elupvtlg, "random" ) ) )

summary( bancoDT$v3elupvtlg )
