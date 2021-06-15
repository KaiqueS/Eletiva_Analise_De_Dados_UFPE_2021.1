library( dplyr )
library( data.table )
library( plotly )
library( EnvStats )

covid <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

covidMun <- covid %>% count( municipio, sort = T, name = 'casos2' ) %>%
            mutate(casos2 = sqrt( casos2 ), casosLog = log10( casos2 ) )

plot_ly(y = covidMun$casos2, type = "box", text = covidMun$municipio, 
                                           boxpoints = "all", jitter = 0.3 )

boxplot.stats( covidMun$casos2 )$out
boxplot.stats( covidMun$casos2, coef = 2 )$out

covidOut <- boxplot.stats(covidMun$casos2 )$out
covidOutIndex <- which( covidMun$casos2 %in% c( covidOut ) )
covidOutIndex

lower_bound <- median( covidMun$casos2 ) - 3 * mad( covidMun$casos2, constant = 1 )
upper_bound <- median( covidMun$casos2 ) + 3 * mad( covidMun$casos2, constant = 1 )
( outlier_ind <- which( covidMun$casos2 < lower_bound | covidMun$casos2 > upper_bound ) )

covidRosner <- rosnerTest( covidMun$casos2, k = 10 )
covidRosner
covidRosner$all.stats
