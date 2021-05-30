library( tidyverse )
library( vdem )
library( validate )

banco <- vdem

glimpse( banco )

vdem$v2x_po

regras_validar_vdem <- validator( v2x_libdem >= 3, v2x_polyarchy >= 2 )

validacao_vdem <- confront( banco, regras_validar_vdem )

summary( banco )

