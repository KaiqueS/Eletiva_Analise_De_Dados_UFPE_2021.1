library( dplyr )
library( data.table )
library( plotly )
library( EnvStats )

covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

covid19PEMun <- covid19PE %>% count( municipio, sort = T, name = 'casos2' ) %>%
                mutate(casos2 = sqrt( casos2 ), casosLog = log10( casos2 ) )

plot_ly(y = covid19PEMun$casos2, type = "box", text = covid19PEMun$municipio, 
                                               boxpoints = "all", jitter = 0.3 )

boxplot.stats( covid19PEMun$casos2 )$out
boxplot.stats( covid19PEMun$casos2, coef = 2 )$out

covid19PEOut <- boxplot.stats(covid19PEMun$casos2 )$out
covid19PEOutIndex <- which( covid19PEMun$casos2 %in% c( covid19PEOut ) )
covid19PEOutIndex

lower_bound <- median( covid19PEMun$casos2 ) - 3 * mad( covid19PEMun$casos2, constant = 1 )
upper_bound <- median( covid19PEMun$casos2 ) + 3 * mad( covid19PEMun$casos2, constant = 1 )
( outlier_ind <- which( covid19PEMun$casos2 < lower_bound | covid19PEMun$casos2 > upper_bound ) )

covid19PERosner <- rosnerTest( covid19PEMun$casos2, k = 10 )
covid19PERosner
covid19PERosner$all.stats
